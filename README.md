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
   * Quourm maker follows below convention for naming docker image
   syneblock/quorum-maker:`<quorum-version>`_`<quorum-maker-version>`  

   E.g. If Quorum version is 2.0.2 and Quorum Maker version is 2.1, the docker image tag by convension is **syneblock/quorum-maker:2.0.2_2.1**
   
   * You can pass the name and tag of the docker image as the parameter to the `build_image.sh` script.  

   E.g. `build_image.sh my-quorum-maker` or `build_image.sh my-quorum-maker 1.9_2.0`

   * If you do not pass any parameters, `build_image.sh` will use the git branch for the Quorum Maker part of the tag name. 

   E.g. If you are V2.0 branch, the generated image name will be **syneblock/quorum-maker:2.0.2_2.0**

   > Branches `development` and `master` are treated specially.  


Please refer to the source code and edit each libraries versions before you build. Make sure to update the image tag name in qm.variables of Quorum Maker to use this newly built image.  
