#!/usr/bin/env sh

##############################################################################
##
##  Updated Gradle startup script for UNIX-based systems
##
##############################################################################

# Resolve script location
PRG="$0"
while [ -h "$PRG" ]; do
    ls=`ls -ld "$PRG"`
    link=`expr "$ls" : '.*-> \(.*\)$'`
    if expr "$link" : '/.*' > /dev/null; then
        PRG="$link"
    else
        PRG=`dirname "$PRG"`"/$link"
    fi
done
SAVED="`pwd`"
cd "`dirname \"$PRG\"`/" >/dev/null
APP_HOME="`pwd -P`"
cd "$SAVED" >/dev/null

APP_NAME="Gradle"
APP_BASE_NAME=`basename "$0"`

# Updated JVM options for better performance
DEFAULT_JVM_OPTS="-Xmx512m -Xms256m"

# Detect operating system
cygwin=false
msys=false
darwin=false
case "`uname`" in
  CYGWIN*) cygwin=true ;;
  Darwin*) darwin=true ;;
  MINGW*) msys=true ;;
esac

CLASSPATH="$APP_HOME/gradle/wrapper/gradle-wrapper.jar"

# Determine the Java command
if [ -n "$JAVA_HOME" ]; then
    JAVACMD="$JAVA_HOME/bin/java"
    if [ ! -x "$JAVACMD" ]; then
        echo "ERROR: JAVA_HOME is set incorrectly: $JAVA_HOME"
        exit 1
    fi
else
    JAVACMD="java"
    if ! command -v java >/dev/null 2>&1; then
        echo "ERROR: JAVA_HOME is not set, and 'java' is not found in PATH."
        exit 1
    fi
fi

# Adjust settings for macOS
if [ "$darwin" = "true" ]; then
    GRADLE_OPTS="$GRADLE_OPTS -Xdock:name=$APP_NAME -Xdock:icon=$APP_HOME/media/gradle.icns"
fi

# Convert paths for Windows compatibility (Cygwin/MSYS)
if [ "$cygwin" = "true" ] || [ "$msys" = "true" ]; then
    APP_HOME=`cygpath --path --mixed "$APP_HOME"`
    CLASSPATH=`cygpath --path --mixed "$CLASSPATH"`
    JAVACMD=`cygpath --unix "$JAVACMD"`
fi

# Prepare application arguments
save() {
    for i; do printf %s\\n "$i" | sed "s/'/'\\\\''/g;1s/^/'/;\$s/\$/' \\\\/"; done
    echo " "
}
APP_ARGS=`save "$@"`

# Execute Gradle Wrapper
exec "$JAVACMD" $DEFAULT_JVM_OPTS $JAVA_OPTS $GRADLE_OPTS \
    "-Dorg.gradle.appname=$APP_BASE_NAME" \
    -classpath "$CLASSPATH" org.gradle.wrapper.GradleWrapperMain "$APP_ARGS"
