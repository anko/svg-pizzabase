export PATH := node_modules/.bin:$(PATH)

all: index.js

test: index.js test.ls
	@lsc test.ls

test-docs: readme.markdown index.js
	@txm readme.markdown

test-all: test test-docs

index.js: index.ls
	echo "#!/usr/bin/env node" > $@
	lsc --compile --print $< >> $@
	chmod +x $@

clean:
	rm index.js

.PHONY: all test test-docs test-all clean
