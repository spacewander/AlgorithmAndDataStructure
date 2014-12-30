CC = clang++
LIBGTEST = ../lib/libgtest.a
GTESTHEADERS = ../lib

# `make TEST=nonModifyingSequence` will run nonModifyingSequenceTest, and so on.
ifdef TEST
	SRC = $(TEST)Test.cpp main.cpp
else
	SRC = $(wildcard *.cpp)
endif

test:
	@$(CC) -isystem $(GTESTHEADERS) -pthread  -std=c++11 $(SRC) $(LIBGTEST)
	@./a.out

