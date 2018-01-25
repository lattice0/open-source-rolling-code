CC=gcc
RM=rm -f
CFLAGS=-std=c99
LDFLAGS=

SOURCES  := $(wildcard *.c) $(wildcard tiny-AES-c/*.c)
SOURCES  := $(filter-out tiny-AES-c/test.c tiny-AES-c/test.o,$(SOURCES))
OBJECTS  := $(subst .c,.o, $(SOURCES))

INCLUDES :=tiny-AES-c
INCLUDES :=$(addprefix -I,$(INCLUDES))

TARGET := rolling

print-%  : ; @echo $* = $($*)

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CC) $(LDFLAGS) -o $(TARGET) $(OBJECTS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@ $(INCLUDES)

tiny-AES-c/%.o: tiny-AES-c/%.c
	$(CC) $(CFLAGS) -c $< -o $@ $(INCLUDES)

.PHONY: clean
clean:
	$(RM) $(OBJECTS)
