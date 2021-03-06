doc:
	pandoc --from=markdown --to=rst --output="README.rst" "README.md"

clean:
	rm dist/* || true
	rm -fr __pycache__ || true
	rm -fr ff/__pycache__ || true
	rm -fr build || true
	find . -iname '*.pyc' -delete || true

build:
	python setup.py sdist
	python setup.py bdist_wheel

upload:
	twine upload dist/ff_find* dist/ff-find*

distro: clean build upload
