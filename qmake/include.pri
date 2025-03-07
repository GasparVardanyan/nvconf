unix {
	DESTDIR = build
	OBJECTS_DIR = build/.obj
	MOC_DIR = build/.moc
	RCC_DIR = build/.rcc
	UI_DIR = build/.ui

	run.target = run
	run.commands = ./$$DESTDIR/$$TARGET
	run.depends = $$DESTDIR/$$TARGET

	nmake.target = nmake
	nmake.commands = "compiledb -n make && sed -i 's/\"-mno-direct-extern-access\",//' compile_commands.json"
	nmake.depends = qmake

	QMAKE_EXTRA_TARGETS += run nmake
}
