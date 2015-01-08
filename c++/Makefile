CC := clang++
LIBGTEST := ../lib/libgtest.a
GTESTHEADERS := ../lib
TARGETS := a.out
LDLIBS := -isystem $(GTESTHEADERS) $(LIBGTEST) -pthread -lm
CCFLAGS := -MP -MMD -isystem $(GTESTHEADERS) -pthread -std=c++11

# `make TEST=nonModifyingSequence` will run nonModifyingSequenceTest, and so on.
ifdef TEST
	SRC := $(TEST)Test.cpp main.cpp
else
	SRC := $(wildcard *Test.cpp) main.cpp
endif

OBJS := $(SRC:.cpp=.o)
DEPS := $(DEPS:.cpp=.d)

test: $(TARGETS)
	@./$(TARGETS)

$(TARGETS): $(OBJS)
	@$(CC) $(OBJS) $(LDLIBS) -o $(TARGETS)

%.o : %.cpp
	@$(CC) -c $(CCFLAGS) $*.cpp -o $*.o

-include $(DEPS)

clean:
	rm -rf $(OBJS) $(DEPS) $(TARGETS)

.PHONY: clean
