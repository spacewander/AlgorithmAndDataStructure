ifdef TEST
	TESTS := $(TEST)_spec.coffee
	SRCS := $(TESTS)
	SRCS += $(TEST).coffee
else
	SRCS := $(wildcard *.coffee)
	TESTS := $(wildcard *_spec.coffee)
endif

JS := $(SRCS:.coffee=.js)

test: $(JS)
	mocha $(TESTS:.coffee=.js)

%.js : %.coffee
	coffee  -c $<

clean:
	rm -rf *.js

.PHONY: clean
