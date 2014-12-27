CC = clang++
SRC = $(wildcard *.cpp)
LIBGTEST = libgtest.a

test:
	@g++ -isystem . -pthread $(SRC) $(LIBGTEST)
	@./a.out

.PHONY: test
