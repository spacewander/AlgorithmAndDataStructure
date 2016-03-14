Implement ordinary algorithms in different languages.

## Algorithm

To see what algorithms are implemented, look at Algorithms.md.

## Run tests

To run tests, look at steps below :

### C++ 

GTest is used to write unit tests for c++.
If you are not using Linux x86_64, or you want to use a different version of GTest, you may have to go to GTest's official site and search for installation. You may have to modify `c++/Makefile`, too.
Otherwise, you can simply `make` in the `c++` directory, or `make TEST=set` to run a specific test file like `setTest.cpp`.

### Python

```
cd python
sudo pip install pytest
py.test
# or run py.test -q test_modifying_sequence.py, if you only want to run tests in specific file.
```

### Javascript

```
cd javascript
sudo npm install // install mocha, gulp, and more
gulp
```

### Coffeescript

```
cd coffeescript
# install mocha globally, and then
make 
# or make TEST=modifying_sequence to run a specific test file, like modifying_sequence.coffee
```

### Go

```
# please set up GOPATH for yourself
cd go
# install onsi/ginkgo and onsi/gomega
go test
```

### Ruby

```
cd ruby
rake
# or rake TEST=non_modifying_sequence
```

### Lua

```
cd lua
busted # run all *_spec.lua tests
```

### PHP

```
cd php
phpunit --bootstrap autoload.php .
```
