target = stack
compile = gcc
flags = -g -Wall -fprofile-arcs -ftest-coverage
source_dir = source
debug_dir = debug
source = main.c
include = -Iinclude \
		  -I.
libs = -Llib -lstack -lgcov
source_build = $(patsubst %.c, $(debug_dir)/%.o,$(source))
lib_dir = lib
make_lib = lib.mk


.PHONY: debug
debug: lib $(debug_dir)/$(target)

.PHONY: clean
clean:
	rm -rf $(debug_dir) $(lib_dir)

.PHONY: lib
lib: makedir
	make -f $(make_lib) debug
.PHONY: run
run: debug
	./$(debug_dir)/$(target)

# Compile
$(debug_dir)/%.o: $(source_dir)/%.c
	$(compile) $(flags) -c -o $@ $< $(include) $(libs)
# Linking
$(debug_dir)/$(target):$(source_build)
	$(compile) $(flags) -o $@ $^ $(include) $(libs)


makedir:
	[ -d $(debug_dir) ] || mkdir -p $(debug_dir)
	[ -d $(lib_dir) ] || mkdir -p $(lib_dir)
