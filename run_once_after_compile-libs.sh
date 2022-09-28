#!/bin/bash

if hash java 2>/dev/null; then
  (cd $HOME/.lib/java-debug && \
    JAVA_HOME=/usr/lib/jvm/java-17-openjdk ./mvnw clean install)
fi

if hash npm 2>/dev/null; then
  (cd $HOME/.lib/vscode-java-test && \
    npm install &&
    JAVA_HOME=/usr/lib/jvm/java-17-openjdk npm run build-plugin)
fi
