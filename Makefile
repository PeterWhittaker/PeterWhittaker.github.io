all: build serve

build:
	@bundle install

serve:
	@bundle exec jekyll serve -o

clean:
	@rm Gemfile.lock

doctor:
	@bundle exec jekyll doctor
