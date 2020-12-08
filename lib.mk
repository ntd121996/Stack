target = libstack.so.1.0
compile = gcc
flag = -g -Wall -fPIC
ldflag = -shared -Wl,-soname,libstack.so.1
lib_dir = lib
source_dir = source
source = stack.c
include = -Iinclude \
		  -I.
debug_dir = debug
source_build = $(patsubst %.c, $(debug_dir)/%.o, $(source))
current_dir := $(shell pwd)



.PHONY: debug
debug: $(lib_dir)/$(target) install


#Compile
$(debug_dir)/%.o: $(source_dir)/%.c
	$(compile) $(flag) -c -o $@ $< $(include)

#Linking
$(lib_dir)/$(target):$(source_build)
	$(compile) $(ldflag) -o $@ $^ $(include)

install:
	ln -sf $(current_dir)/$(lib_dir)/libstack.so.1.0 $(current_dir)/$(lib_dir)/libstack.so.1
	ln -sf $(current_dir)/$(lib_dir)/libstack.so.1.0 $(current_dir)/$(lib_dir)/libstack.so









