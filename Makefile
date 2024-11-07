.PHONY: keydoku-init, ergogen-generate, jscad-to-stl, qmk-clean, qmk-link, qmk-compile

keydoku-init:
	npm install
	git submodule update --remote
	git submodule update --init --recursive

ergogen-generate:
	npx ergogen ergogen/ -o output --clean

jscad-to-stl:
	npx openjscad output/cases/bottom_case.jscad -o case/bottom_case.stl
	npx openjscad output/cases/top_case.jscad -o case/top_case.stl

qmk-clean:
	rm -rf firmware/qmk-firmware/keyboards/keydoku
	rm -f firmware/qmk-firmware/keydoku_default.uf2
	cd firmware/qmk-firmware; qmk clean

qmk-link: qmk-clean
	ln -s $(shell pwd)/firmware/keydoku firmware/qmk-firmware/keyboards/

qmk-compile:
	cd firmware/qmk-firmware; qmk compile -kb keydoku -km default