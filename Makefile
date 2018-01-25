CC=gcc
RM=rm -f
CFLAGS=-std=c99
LDFLAGS=

SUBDIRS := $(wildcard */.)

INCLUDES_=tiny-AES-c
INCLUDES=$(addprefix -I,$(INCLUDES_))

CINCLUDES=tiny-AES-c

all: rolling $(SUBDIRS)

$(SUBDIRS):
    @$(MAKE) -C $@

rolling:  $(CINCLUDES)/%.o %.o
    @$(CC) $< $(LDFLAGS) -o $@
    @echo "Linking complete!"

%.o : $(CINCLUDES)/%.c %.c
    @$(CC) $(CFLAGS) -c $< -o $@ $(INCLUDES)

.PHONY: clean
clean:
    @$(rm) $(OBJECTS)
    @echo "Cleanup complete!"

.PHONY: remove
remove: clean
    @$(rm) $(BINDIR)/$(TARGET)
    @echo "Executable removed!"
