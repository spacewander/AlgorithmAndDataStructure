CC = clang++
SRC = $(wildcard *.cpp)
LIBGTEST = libgtest.a

test:
	@$(CC) -isystem . -pthread  -std=c++11 $(SRC) $(LIBGTEST)
	@./a.out

.PHONY: test
