MODS = $(wildcard *.erl)

run: compile
	erl -noshell -pa . -eval "all_tests:test()" -s init stop

compile: ${MODS:%.erl=%.beam}

%.beam: %.erl
	erlc -W $< $@
%.erl: %.yrl
	erlc -W $< $@

clean:
	rm *.beam

.PHONY: compile run clean
