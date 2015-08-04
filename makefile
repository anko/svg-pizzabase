export PATH := node_modules/.bin:$(PATH)

all: index.js

test: index.js test.ls
	lsc test.ls

index.js: index.ls
	echo "#!/usr/bin/env node" > $@
	lsc --compile --print $< >> $@
	chmod +x $@

clean:
	rm index.js

.PHONY: all test clean
