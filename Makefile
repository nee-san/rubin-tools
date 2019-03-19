CC ?= cc
CFLAGS ?= -O2
PREFIX ?= /usr/local
MAINFLAGS := -Isrc/compat

all: clean prepare tsort true false test touch

prepare:
	mkdir -p build

tsort:
	$(CC) $(MAINFLAGS) $(CPPFLAGS) $(CFLAGS) src/compat/fgetln.c src/compat/strlcat.c src/compat/strlcpy.c \
		src/tsort/main.c src/tsort/ohash.c -o build/tsort

true:
	$(CC) $(MAINFLAGS) $(CPPFLAGS) $(CFLAGS) src/true/main.c -o build/true

false:
	$(CC) $(MAINFLAGS) $(CPPFLAGS) $(CFLAGS) src/false/main.c -o build/false

test:
	$(CC) $(MAINFLAGS) $(CPPFLAGS) $(CFLAGS) src/compat/strlcpy.c src/compat/strtonum.c \
		src/test/main.c -o build/test

touch:
	$(CC) $(MAINFLAGS) $(CPPFLAGS) $(CFLAGS) src/touch/main.c -o build/touch

clean:
	rm -rf build
