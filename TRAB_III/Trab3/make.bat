flex -oanalex.c analex.l
bison sint.y -o sint.c -d
gcc sint.c -o sint.exe
