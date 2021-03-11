FROM swift 
WORKDIR /app
COPY Package.swift ./
RUN swift package clean
RUN swift package update
COPY ./ ./
RUN swift build
RUN swift test -v
ENTRYPOINT swift run
#ENTRYPOINT /bin/bash
