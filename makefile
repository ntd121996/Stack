EXE = stack
COMPILE = gcc
FLAGS = -g -Wall
LIBS = 
SRC_DIR = src
SRC = stack.c \
	  main.c
INCLUDE = include
INCLUDE_BUILD = -I$(INCLUDE)\
				-I.
DEBUG_DIR = debug
SRC_BUILD = $(patsubst %.c, $(DEBUG_DIR)/%.o, $(SRC))



.PHONY: debug
debug:
	[ -d $(DEBUG_DIR)] || mkdir -p $(DEBUG_DIR)
	make $(EXE)
.PHONY: run
run: debug
	./$(EXE)
.PHONY: clean
clean:
	rm -rf $(EXE) $(DEBUG_DIR)/*
$(DEBUG_DIR)/%.o : $(SRC_DIR)/%.c
	$(COMPILE) $(FLAGS) -c -o $@ $< $(INCLUDE_BUILD) $(LIBS)

$(EXE): $(SRC_BUILD)
	$(COMPILE) $(FLAGS) -o $@ $^ $(INCLUDE_BUILD) $(LIBS)

