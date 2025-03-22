run:
	@echo "Starting server..."
	bundle exec jekyll serve

update:
	@echo "Updating gems..."
	bundle update

update-github-pages:
	@echo "Updating github-pages gem..."
	bundle update github-pages
