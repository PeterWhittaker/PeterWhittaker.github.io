all: build serve

build:
	@bundle config set force_ruby_platform true
	@bundle install

serve:
	@bundle exec jekyll serve -o

clean:
	@rm -f Gemfile.lock

doctor:
	@bundle exec jekyll doctor
