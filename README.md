# Quorum Maker Docker image building utility #

Quorum Maker uses Docker to make the setup easy. Most of the dependancies are baked into the image, so users can get going without having to download and install a list of dependancies. If you want to use a different version of these dependancies other than officially supported by Quorum Maker, build the docker image locally and use with Quorum Maker. 

> **Usage of Quorum Maker image building utility is optional. The official docker image is uploaded in docker hub.**

## Quick Start ##

1. Create a temperory directory and clone following three projects
   1. `mkdir qmtemp; cd qmtemp ` 
   1. `git clone https://github.com/synechron-finlabs/quorum-maker-nodemanager.git`
   1. `git clone https://github.com/synechron-finlabs/quorum-maker-ui.git`
   1. `git clone https://github.com/synechron-finlabs/quorum-maker-image.git` 
   1. Quorum Maker project is not required to build docker image as it is required only at runtime. 
1. Run `./build_image.sh` inside `quorum-maker-image` directory. Following are the steps executed automatically by this script. 
   1. Automatically build quorum-maker-nodemanager using Golang and copy the executable to image.
   2. Automatically build quorum-maker-ui using Angular and copy HTML, JS, CSS and images. 
   3. Automatically clone Quorum and copy `geth` and `bootnode` to image.
   4. Download `Constellation` executable and copy to image.
   5. Install Linux libraries.
1. Tag docker image


Please refer to the source code and edit each libraries versions before you build. Make sure to update the image tag name on Quorum Maker to use this newly built image.  
