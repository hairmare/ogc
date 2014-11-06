# Online GLSA Checker

Runs in the clound and checks if your docker images are affected by GLSAs.

This is a CoreOS based SaaS platform.

If the service detects that an image is affected by GLSAs then an attempt
is made to build binary packages for patching the system. If all goes well
the patches will get published so dependant containers by use them to be
updated in situ.

## Needed Units

* [X] mongodb.service (persistance for api.service)
* [X] ogc-api.service (api for storing state)
* [X] nested-docker.service (for running nested docker)
* [X] ogc-gui.service (web site)
* [X] ogc-worker.unit (worker that interacts with the api and docker)
* [X] ogc-proxy-main.service (http routing for api and frontend)
* [X] ogc-proxy-ssl.service (front ssl proxy)
* [ ] ogc-dist.service (hosting for static data like build artefacts)
* [ ] package-cache.service (outgoing caching webproxy (for distfiles))

## TODOs

* [ ] replace nested-docker.service with one based on gentoo
* [ ] switch to using emerge @security instead of installing glsa-check
* [ ] split ogc-worker into a worker for each type of work
* [ ] cleanup logging everywhere (see ogc-api for how it should behave)
* [ ] clean error handling with automatic recovery where possible
* [ ] split api service into internal and external service (removes some rw routes externally)
* [ ] add permissions and auth to external api
