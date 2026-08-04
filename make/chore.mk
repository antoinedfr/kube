CODE_DIR := code
CC = gcc
CFLAGS ?= -Wall -Wextra
SOURCES = $(wildcard $(CODE_DIR)/*.c)
OBJECTS = $(patsubst %.c,%.o,$(SOURCES))



%.o: %.c  ## creates .o from .c
	@$(CC) $(CFLAGS) -c $< -o $@

boiler: $(OBJECTS)
	@$(CC) $^ -o $(CODE_DIR)/$@

clean:
	@rm -f $(OBJECTS) $(CODE_DIR)/boiler


.PHONY: boiler.create
boiler.create: guard-ARGV
	@./$(CODE_DIR)/boiler $(ARGV)
