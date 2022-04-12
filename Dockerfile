ARG SWIFT_VERSION
FROM swift:${SWIFT_VERSION}
WORKDIR /app
COPY Package.swift Package.resolved ./
RUN swift package --skip-update --force-resolved-versions resolve
COPY ./ ./
RUN swift build
RUN swift test -v
ENTRYPOINT swift run
#ENTRYPOINT /bin/bash
