HANDLEBARS_VERSION=3

default: lib lib/ember.js lib/handlebars.js

lib:
	@mkdir -p $@

lib/ember.js:
	@axel -o $@ http://builds.emberjs.com.s3.amazonaws.com/ember-latest.min.js

lib/handlebars.js:
	@axel -o $@ http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/1.0.0-rc.$(HANDLEBARS_VERSION)/handlebars.min.js

clean:
	@rm -rf lib

.PHONY: clean
