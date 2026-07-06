# Docker Build

## Simple App

Build simple-app
* docker build: The command to build an image.
* -t my-app:1.0: The tag, which gives the image a name:version. This is critical for managing different versions of your application.
* .: The location of the build context (your current folder).

`docker build -t simple-app:1.0 .`


