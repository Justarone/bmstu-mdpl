ml /c matrix.asm
ml /c main.asm
link main.obj matrix.obj, app.exe, , , ,
del main.obj
del matrix.obj
del app.map
