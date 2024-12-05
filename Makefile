all:	clean uninstall install

clean:
	rm -rf build *.o *.info *.a *.tar.gz docs/html docs/latex report Tetris_and_Snake tmp .qmake.* *.txt
install:
	 mkdir Tetris_and_Snake && mkdir tmp && install *.cpp *.h *.pro *.pro.* Tetris_and_Snake
	 echo "" > tmp/Makefile && cp -rf Makefile tmp/Makefile
	 qmake -o Makefile Tetris_and_Snake/gamebox.pro && make
	 mv ./gamebox Tetris_and_Snake && cp -rf tmp/Makefile Makefile
	 rm -rf tmp && ./Tetris_and_Snake/gamebox
uninstall:	clean

dist:
	tar czvf Teris_Snake.tar.gz --ignore-failed-read *.cpp *.h *.pro.* *.pro Makefile readme.md
dvi:
	$(shell which firefox || which xdg-open || which open || which x-www-browser) docs/html/index.html
