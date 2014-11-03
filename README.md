# Online GLSA Checker

Runs in the clound and check if your docker images are affected by any GLSAs.

This is a CoreOS based SaaS platform.

## Architecture

````
+-----------+-----------------+
| UI        | Workers         |
+-----------+-----------------+
| API       | Docker          |
+-----------+-----------------+
|            CoreOS           |
+-----------------------------+

````

API Layer is for storing all things regarding state. Workers get run in a nested
Docker instance for additional isolation. The UI is based on the API.

## Needed Units

* mongodb.service (persistance for api.service)
* api.service (api for storing state)
* docker.service (for running nested docker)
* frontend.service (web site)
* worker.unit (template for running instade nested docker)
* router.service (http routing for api and frontend)
* revproxy.service (front ssl proxy)
