DEPS=fuzzgoat.c main.c
LIBS=-lm

all: $(DEPS)
	$(CC) -w -I. -o fuzzgoat $(CFLAGS) $^ $(LIBS)

fuzzer: $(DEPS)
	$(CC) -w -o parse-json-fuzzer -pthread -DFUZZING $(CFLAGS) -fsanitize=fuzzer $^ $(LIBS)

.PHONY: clean

clean:
	rm -f ./fuzzgoat ./parse-json-fuzzer

