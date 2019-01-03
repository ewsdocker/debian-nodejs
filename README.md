## ewsdocker/debian-nodejs:9.6.0  
**ewsdocker/debian-nodejs** is a **Debian** docker image containing the latest [nodesource/distributions](https://github.com/nodesource/distributions) version of the [Node.js](https://nodejs.org/) library.  

____  
**Pre-built Docker images are available from [ewsdocker/debian-nodejs](https://hub.docker.com/r/ewsdocker/debian-nodejs).**  

____  

**NOTE: ewsdocker/debian-nodejs** is designed to be used on a Linux system configured to support **Docker** _user namespaces_.  Refer to [ewsdocker Containers and Docker User Namespaces](https://github.com/ewsdocker/ewsdocker.github.io/wiki/UserNS-Overview) for an overview and additional information.  
____  

**Visit [ewsdocker/debian-nodejs Wiki](https://github.com/ewsdocker/debian-nodejs/wiki) for complete documentation of this docker image.**  
____  

#### Installing ewsdocker/debian-nodejs  
The following scripts will download the selected **ewsdocker/debian-nodejs** image, create a container, setup and populate the directory structures, and create the run-time scripts.  

The <i>default</i> values will install all directories and contents in the <b>docker host</b> user's home directory (refer to <a href="#mapping">Mapping docker host resources to the docker container</a>, below).  

____  

**ewsdocker/debian-nodejs:9.6.0**
  
    docker run --rm \
               -v ${HOME}/bin:/userbin \
               -v ${HOME}/.local:/usrlocal \
               -e LMS_BASE="${HOME}/.local" \
               -v ${HOME}/.config/docker:/conf \
               -v ${HOME}/.config/docker/debian-nodejs-9.6.0:/root \
               --name=debian-nodejs-9.6.0\
           ewsdocker/debian-nodejs:9.6.0 lms-setup  

____  

#### Running the installed scripts

After running the above command script, and using the settings indicated, the docker host directories, mapped as shown in the above tables, will be configured as follows:

 - the executable scripts have been copied to **~/bin**;  
 - the associated **debian-nodejs-"version"** executable script (shown below) will be found in **~/.local/bin**, and _should_ be customized with proper local volume names;  

____  

**Execution scripts**  

**ewsdocker/debian-nodejs:9.6.0**  
  
    docker run -it \
               --rm \
               -v /etc/localtime:/etc/localtime:ro \
               -v ${HOME}/workspace/debian/nodejs/9.6.0:/workspace \
               -v ${HOME}/.config/docker/debian-nodejs-9.6.0:/root \
               --name=debian-nodejs-9.6.0\
           ewsdocker/debian-nodejs:9.6.0 /bin/bash

____  

Refer to the **[Command-line Interface](https://github.com/ewsdocker/debian-nodejs/wiki/CommandLineInterface) Wiki** page for details about how to connect to this container.

____  

**Copyright © 2018, 2019. EarthWalk Software.**  
**Licensed under the GNU General Public License, GPL-3.0-or-later.**  

This file is part of **ewsdocker/debian-nodejs**.  

**ewsdocker/debian-nodejs** is free software: you can redistribute 
it and/or modify it under the terms of the GNU General Public License 
as published by the Free Software Foundation, either version 3 of the 
License, or (at your option) any later version.  

**ewsdocker/debian-nodejs** is distributed in the hope that 
it will be useful, but WITHOUT ANY WARRANTY; without even the implied 
warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.  

You should have received a copy of the GNU General Public License
along with **ewsdocker/debian-nodejs**.  If not, see 
<http://www.gnu.org/licenses/>.  
____  
