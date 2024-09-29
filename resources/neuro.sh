#!/usr/bin/env bash
set -eu

APPDIR="/app/app"

# Discover some variables automatically from config file
JPACKAGE_CONFIG_FILE="$APPDIR/Neuro Desktop.cfg"
MAIN_CLASS=$(sed -n 's/^app.mainclass=//p' "$JPACKAGE_CONFIG_FILE")
BUILD_VERSION=$(sed -n 's/^java-options=-Dneuro.build.version=//p' "$JPACKAGE_CONFIG_FILE")

export PATH=/app/jre/bin:/usr/bin

cd /app
exec java \
    -Djava.awt.headless=false \
    -Djava.io.tmpdir="$XDG_CACHE_HOME" \
    -Duser.dir="$XDG_DATA_HOME" \
    -Duser.home="$XDG_DATA_HOME" \
    -Dneuro.build.version=$BUILD_VERSION \
    -Djpackage.app-version=$BUILD_VERSION \
    -Dcompose.application.configure.swing.globals=true \
    -Dcompose.application.resources.dir="$APPDIR/resources" \
    -Dskiko.library.path="$APPDIR" \
    -classpath "$APPDIR/*" \
    $MAIN_CLASS "$@"
