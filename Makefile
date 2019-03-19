CC ?= cc
CFLAGS ?= -O2
PREFIX ?= /usr/local
MAINFLAGS := -Isrc/compat

all: clean tsort

tsort:
	$(CC) $(MAINFLAGS) $(CPPFLAGS) $(CFLAGS) src/compat/fgetln.c src/compat/strlcat.c src/compat/strlcpy.c \
		src/tsort/main.c src/tsort/ohash.c -o src/tsort/tsort

clean:
	rm -rf src/tsort/tsort
