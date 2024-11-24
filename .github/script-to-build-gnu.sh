#!/bin/sh

set -eux

VERSION=$1
TSS_VERSION=$2
ARCH=$3
ABI=$4
IMAGE_NAME=$5
DOCKER_PLATFORM=$6

if [ ! -z "${DOCKER_PLATFORM}" ]; then
  sudo docker run --privileged --network=host --rm -v $(pwd):/work --platform="${DOCKER_PLATFORM}" "${IMAGE_NAME}" \
    sh -c "chmod a+x /work/do-build.sh && /work/do-build.sh ${VERSION} ${TSS_VERSION} ${ARCH} ${ABI}"
else
  sudo docker run --privileged --network=host --rm -v $(pwd):/work "${IMAGE_NAME}" \
    sh -c "chmod a+x /work/do-build.sh && /work/do-build.sh ${VERSION} ${TSS_VERSION} ${ARCH} ${ABI}"
fi
