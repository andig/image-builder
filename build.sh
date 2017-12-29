#!/bin/bash
docker build -t volkszaehler/image-builder .
docker run -it --cap-add=SYS_ADMIN -v $(pwd)/build:/build volkszaehler/image-builder bash
