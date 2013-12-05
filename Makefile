HANDLEBARS_VERSION=3

component = ./node_modules/component-hooks/node_modules/.bin/component

default: lib/ember.js lib/handlebars.js node_modules components public

lib/ember.js:
	@axel -o $@ http://builds.emberjs.com.s3.amazonaws.com/ember-latest.min.js

lib/handlebars.js:
	@axel -o $@ http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/1.0.0-rc.$(HANDLEBARS_VERSION)/handlebars.min.js

node_modules:
	@npm install

components:
	@$(component) install

public: lib/index.js
	@$(component) build -n $@ -o $@

example: default
	@xdg-open example/index.html

clean:
	@rm -rf public lib/ember.js lib/handlebars.js

.PHONY: clean example