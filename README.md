# Online GLSA Checker

[![HuBoard badge](http://img.shields.io/badge/Hu-Board-7965cc.svg)](https://huboard.com/hairmare/ogc)

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
