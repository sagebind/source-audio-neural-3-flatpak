#!/usr/bin/env bash
set -eu

APPDIR="/app/app"
MAIN_CLASS="com.sourceaudio.neuro.multiplatform.MainKt"

export PATH=/app/jre/bin:/usr/bin

cd /app
exec java \
    -Djava.awt.headless=false \
    -Djava.io.tmpdir="$XDG_CACHE_HOME" \
    -Duser.dir="$XDG_DATA_HOME" \
    -Duser.home="$XDG_DATA_HOME" \
    -Djpackage.app-version=3.0.20 \
    -Dcompose.application.configure.swing.globals=true \
    -Dcompose.application.resources.dir="$APPDIR/resources" \
    -Dskiko.library.path="$APPDIR" \
    -classpath "$APPDIR/*" \
    $MAIN_CLASS "$@"
