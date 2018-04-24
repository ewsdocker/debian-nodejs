# =========================================================================
# =========================================================================
#
#	Dockerfile
#	  Dockerfile for node.js in a Debian docker container.
#
# =========================================================================
#
# @author Jay Wheeler.
# @version 0.0.1
# @copyright © 2018. EarthWalk Software.
# @license Licensed under the Academic Free License version 3.0
# @package ewsdocker/debian-nodejs
# @subpackage Dockerfile
#
# =========================================================================
#
#	Copyright © 2018. EarthWalk Software
#	Licensed under the Academic Free License, version 3.0.
#
#	Refer to the file named License.txt provided with the source,
#	or from
#
#		http://opensource.org/licenses/academic.php
#
# =========================================================================
# =========================================================================

FROM ewsdocker/debian-base:3.0.4

MAINTAINER Jay Wheeler <EarthWalkSoftware@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive

# =========================================================================

ENV PKG_VER=9 \
    PKG_HOST=https://deb.nodesource.com \
    PKG_DIR="node.js" \
    PKG_NAME="setup_${PKG_VER}.x" \
    PKG_URL=${PKG_HOST}/${PKG_NAME} \
    LMSBUILD_DOCKER="ewsdocker/debian-nodejs:0.0.1" \ 
    LMSBUILD_PACKAGE="node.js v. ${PKG_VER}.x"

# =========================================================================

COPY scripts/. / 

# =========================================================================

RUN mkdir -p /etc/BUILDS/ \
 && printf "${LMSBUILD_DOCKER} (${LMSBUILD_PACKAGE}), %s @ %s\n" `date '+%Y-%m-%d'` `date '+%H:%M:%S'` > /etc/BUILDS/CONTAINER.txt \
 && apt-get -y upgrade \
 && curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash - \
 && apt-get -y install \
               nodejs \
               build-essential \
 && apt-get clean all 

# =========================================================================

ENTRYPOINT ["/my_init", "--quiet"]
CMD ["/usr/bin/bash"]
