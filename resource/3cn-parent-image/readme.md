## Building 3cn-parent image
We can build 3cn-parent image from scratch by running `build-3cn-parent-image.sh`
The above script simply install the whole on maven instance. This building requires some time as this project need to download all libraries.
After downloading, it simply creates an image `3cn-parent:0.0.1-SNAPSHOT`

## Updating 3cn-parent image
We can update the 3cn-parent image by executing `update-3cn-parent-image`. The above script run the `Dockerfile.update-3cn-parent` which simply reinstall the whole project on `3cn-parent:0.0.1-SNAPSHOT`

## Pushing to Dockerhub Registry
`docker push 3cn-parent:0.0.1-SNAPSHOT`