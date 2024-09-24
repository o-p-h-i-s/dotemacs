CFGS = init.elc early-init.elc

all: $(CFGS)

%.elc: %.el
	emacs -l init.el -batch -f batch-byte-compile $<

init.el: README.org
	emacs --batch --eval \
		"(progn \
			(require 'ob-tangle) \
			(org-babel-tangle-file \"$<\" \"$@\" \"emacs-lisp\"))"

clean:
	rm -rf *.el *.elc auto-save-list
