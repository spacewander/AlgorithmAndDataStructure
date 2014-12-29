CC = clang++
SRC = $(wildcard *.cpp)
LIBGTEST = ../lib/libgtest.a

test:
	@$(CC) -isystem ../lib -pthread  -std=c++11 $(SRC) $(LIBGTEST)
	@./a.out

.PHONY: test
