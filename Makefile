TARGET := lib_util.a
include ./Makefile.inc

# Position independent code (-fPIC) is required for the UMVE plugin system.
CXXFLAGS += -fPIC -I./

SOURCES := $(wildcard [^_]*.cc)
${TARGET}: ${SOURCES:.cc=.o}
	$(AR) rcs $@ $^

_test%: _test%.o lib_util.a
	${LINK.cc} -o $@ $^ ${LDLIBS}

clean:
	${RM} ${TARGET} *.o Makefile.dep

.PHONY: clean
