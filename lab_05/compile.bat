ml /c input.asm
ml /c main.asm
ml /c output.asm
ml /c calc.asm
link main.obj input.obj output.obj calc.obj, app.exe, , , ,
del main.obj
del input.obj
del output.obj
del calc.obj
del app.map
