component = ./node_modules/component-hooks/node_modules/.bin/component

public: node_modules components lib/index.js lib/ember.js lib/handlebars.js
	@$(component) build -n $@ -o $@

node_modules:
	@npm install

components:
	@$(component) install

lib/ember.js:
	@axel -o $@ http://builds.emberjs.com/tags/v1.2.0/ember.js

lib/handlebars.js:
	@axel -o $@ http://builds.handlebarsjs.com.s3.amazonaws.com/handlebars-v1.1.2.js

example: public
	@xdg-open example/index.html

clean:
	@rm -rf public lib/ember.js lib/handlebars.js

.PHONY: clean example