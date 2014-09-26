# scalabox

## Sbt cache

Keep sbt dependencies you download in a shared cache so you can easily stop and start containers without having to redownload anything.

    docker run --name sbtcache bobpace/sbtcache
    devbox --volumes-from sbtcache -P bobpace/scalabox

## Typesafe Activator

run-activator bash script:

    activator ui -Dhttp.address=0.0.0.0
