.POSIX:

CC := clang

SRCFILES := src/main.c
C_INCLUDES := -Iinclude
TEST_SRCFILES := test/main.c test/test_tinker_assert.c test/test_tinker_uint_to_str.c

CFLAGS := ${CFLAGS} -std=c11 -pedantic-errors -gdwarf-2 \
			-fdiagnostics-show-option -Werror -Wextra

all: tinker-test

tinker-test:
	${CC} ${CFLAGS} ${C_INCLUDES} ${SRCFILES} ${TEST_SRCFILES} -o $@

test: tinker-test
	./tinker-test

lint:
	clang-check ${SRCFILES} ${TEST_SRCFILES} -- ${C_INCLUDES}

clean:
	rm -f tinker-test

.PHONY: all clean test
