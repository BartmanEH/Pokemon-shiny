deploy: updateTime build build-sw
	npm run deploy

build: copy-assets
	npm run build;

build-sw:
	workbox generateSW workbox-config.js;

copy-assets:
	cp -r ./assets/* ./public/

updateTime:
	sed -i -r "s/[12][0-9]{3}-[01][0-9]-[0-3][0-9]/`date '+%F'`/g" './assets/index.html'; \
	git add './assets/index.html'; true; \
	git commit -m 'update time'; true; \
