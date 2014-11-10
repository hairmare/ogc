# Online GLSA Checker

Runs in the clound and checks if your docker images are affected by GLSAs.

This is a CoreOS based SaaS platform.

If the service detects that an image is affected by GLSAs then an attempt
is made to build binary packages for patching the system. If all goes well
the patches will get published so dependant containers may use them to be
updated in situ.

Online GLSA Checker ist still very much experimental software.

## GLSA Checking an Image

For each image to check the following workflow is evaluated.

TODO add image

The resultings artefct are then published on the web for later use. They
consist of a report containing information on the run as well as a portage
dist files overlay repository.

## Install

````
sh build.sh
git clone https://github.com/coreos/coreos-vagrant.git
cp user-data coreos-vagrant
cd coreos-vagrant
vagrant up
````

## Adding an image

Add a new image to the system.

````
curl -H 'Content-Type: applicationjson' -X POST -d '{"_id": "hairmare/example"}' 'https://example.com/images'
````

Now wait for the initial build and then have a look at the image on https://localhost/images/hairmare/example
or via gui: https://example.com/#image/about?id=hairmare%2Fnode 

## Needed Units

* [X] mongodb.service (persistance for api.service)
* [X] ogc-api.service (api for storing state)
* [X] nested-docker.service (for running nested docker)
* [X] ogc-gui.service (web site)
* [X] ogc-worker.unit (worker that interacts with the api and docker)
* [X] ogc-proxy-main.service (http routing for api and frontend)
* [X] ogc-proxy-ssl.service (front ssl proxy)
* [X] ogc-storage.service (hosting for static data like build artefacts)
* [ ] package-cache.service (outgoing caching webproxy (for distfiles))
* [ ] elasticsearch.service (for search)

## TODOs

* [ ] replace nested-docker.service with one based on gentoo
* [ ] switch to using emerge @security instead of installing glsa-check
* [ ] split ogc-worker into a worker for each type of work
* [X] cleanup logging everywhere (see ogc-api for how it should behave)
* [ ] clean error handling with automatic recovery where possible
* [ ] split api service into internal and external service (removes some rw routes externally)
* [ ] add permissions and auth to external api
* [ ] make mongodb ha (1 master, 2 secondaries and  1 arbiter per additional machine if the cluster grows, add sidekick units for managing the replica set)
* [ ] implenent es as per http://stackoverflow.com/questions/23846971/how-to-use-elasticsearch-with-mongodb)
* [ ] add ambassadors where needed (between api and mongodb for instance, maybe also between proxies and backends, or just use docker/libswarm)
* [ ] add ``USER`` directive in ogc-* services
* [ ] implement using of storage service in workers
