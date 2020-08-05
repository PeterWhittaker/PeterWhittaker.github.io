all:
	@bundle install
	@bundle exec jekyll serve

clean:
	@rm Gemfile.lock
