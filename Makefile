.PHONY: keydoku-init, ergogen-generate, jscad-to-stl

keydoku-init:
	npm install

ergogen-generate:
	npx ergogen ergogen/ -o output --clean

jscad-to-stl:
	npx openjscad output/cases/bottom_case.jscad -o case/bottom_case.stl
	npx openjscad output/cases/top_case.jscad -o case/top_case.stl
