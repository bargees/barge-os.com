#!/usr/bin/env bash

pushd `dirname $0` > /dev/null
HERE=`pwd`
popd > /dev/null

cd "${HERE}"

WORKDIR=/vagrant

DOCKER_IMAGE="hugo"
DOCKER_OPTIONS="-v ${WORKDIR}/src:/src -v ${WORKDIR}/public:/public"
HUGO_OPTIONS="--source=/src --destination=/public --baseURL=http://localhost:8080/"

hugo() {
  docker run -t --rm ${DOCKER_OPTIONS} ${DOCKER_IMAGE} "$@"
}

case "${1}" in
  version)
    hugo version
    ;;
  init)
    hugo new site . --source=/src
    ;;
  clean)
    rm -rf public
    ;;
  destroy)
    rm -rf public src
    ;;
  *)
    hugo ${HUGO_OPTIONS} "$@"
    ;;
esac
