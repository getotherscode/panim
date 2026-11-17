CFLAGS = -Wall -Wextra
SOFLAGS = -fPIC -shared

INC = raylib/raylib-5.0_linux_amd64/include

LIB_PATH_1 = raylib/raylib-5.0_linux_amd64/lib
LIB_PATH_2 = ./

# named rule - lib+$(real-lib-name)
RAYLIB = libraylib.so
PLUGLIB = libplug.so

.PHONY: all main plug clean

all: main plug

#rpath
main:main.c
	gcc $(CFLAGS) -I$(INC) -o $@ $< -L$(LIB_PATH_1) -Wl,-rpath=$(LIB_PATH_1) -Wl,-rpath=$(LIB_PATH_2) -l:$(RAYLIB)

plug:plug.c
	gcc $(CFLAGS) -I$(INC) $(SOFLAGS) -o $(PLUGLIB) $< -Wl,-rpath=$(LIB_PATH_1) -Wl,-rpath=$(LIB_PATH_2)  -L$(LIB_PATH_1) -l:$(RAYLIB)

clean:
	rm main libplug.so