FROM swift 
WORKDIR /app
COPY Package.swift ./
RUN swift package update
COPY ./ ./
RUN swift test
#RUN swift run
ENTRYPOINT swift run
#ENTRYPOINT /bin/bash
