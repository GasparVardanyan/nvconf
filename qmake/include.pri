unix {
	DESTDIR = build
	OBJECTS_DIR = build/.obj
	MOC_DIR = build/.moc
	RCC_DIR = build/.rcc
	UI_DIR = build/.ui

	run.target = run
	run.commands = ./$$DESTDIR/$$TARGET
	run.depends = $$DESTDIR/$$TARGET

	Qmake.target = Qmake
	Qmake.commands = compiledb -n make

	QMAKE_EXTRA_TARGETS += run Qmake
}
