# =========================================================================
# =========================================================================
#
#	Dockerfile
#	  Dockerfile for node.js in a Debian docker container.
#
# =========================================================================
#
# @author Jay Wheeler.
# @version 0.0.2
# @copyright © 2018. EarthWalk Software.
# @license Licensed under the Academic Free License version 3.0
# @package ewsdocker/debian-nodejs
# @subpackage Dockerfile
#
# =========================================================================
#
#	Copyright © 2018. EarthWalk Software
#	Licensed under the GNU General Public License, GPL-3.0-or-later.
#
#   This file is part of ewsdocker/debian-nodejs.
#
#   ewsdocker/debian-nodejs is free software: you can redistribute 
#   it and/or modify it under the terms of the GNU General Public License 
#   as published by the Free Software Foundation, either version 3 of the 
#   License, or (at your option) any later version.
#
#   ewsdocker/debian-nodejs is distributed in the hope that it will 
#   be useful, but WITHOUT ANY WARRANTY; without even the implied warranty 
#   of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with ewsdocker/debian-nodejs.  If not, see 
#   <http://www.gnu.org/licenses/>.
#
# =========================================================================
# =========================================================================
FROM ewsdocker/debian-base:3.0.5

MAINTAINER Jay Wheeler <EarthWalkSoftware@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive

# =========================================================================

ENV PKG_VER=9
ENV PKG_HOST=https://deb.nodesource.com \
    PKG_DIR="node.js" \
    PKG_NAME="setup_${PKG_VER}.x" \
    PKG_URL=${PKG_HOST}/${PKG_NAME} \
    LMSBUILD_DOCKER="ewsdocker/debian-nodejs:0.0.2" \ 
    LMSBUILD_PACKAGE="node.js v. ${PKG_VER}.x"

# =========================================================================

COPY scripts/. / 

# =========================================================================

RUN apt-get -y upgrade \
 && curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash - \
 && apt-get -y install \
               nodejs \
               build-essential \
 && apt-get clean all \
 && printf "${LMSBUILD_DOCKER} (${LMSBUILD_PACKAGE}), %s @ %s\n" `date '+%Y-%m-%d'` `date '+%H:%M:%S'` >> /etc/ewsdocker-builds.txt 

# =========================================================================

ENTRYPOINT ["/my_init", "--quiet"]
CMD ["/usr/bin/bash"]
