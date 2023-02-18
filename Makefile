.PHONY: test
CFLAGS=-g -Wall
#CFLAGS+=-DDEBUGLOG

LUAINC?=-I/usr/local/include
#LUAINC+=-I./lua-5.4.4/src

ifeq ($(OS), Darwin)
  SO=so
  SHARED= -fPIC -dynamiclib -Wl,-undefined,dynamic_lookup
else
  SHARED=--shared -fPIC
  SO=so
endif

all : traceback.$(SO)

SRCS=\
 traceback.c

traceback.$(SO) : $(SRCS)
	$(CC) $(CFLAGS) $(SHARED) $(LUAINC) -o $@ $^

test: traceback.$(SO)
	lua test.lua

clean :
	rm -rf *.$(SO)

