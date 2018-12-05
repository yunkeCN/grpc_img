FROM node:10.14.0-alpine

LABEL Author="明源云客 <lixb@mingyuanyun.com>"

USER node

WORKDIR /home/node

RUN npm config set registry https://registry.npm.taobao.org \
  && echo "{\"description\": \"npm pre install\", \"repository\": \"https://no.git.repository\", \"license\": \"UNLICENSED\"}" > package.json \
  && npm i grpc@1.16.1 --save \
  && npm cache clean --force \
  && mkdir res \
  && cd res

RUN wget https://codeload.github.com/golang/protobuf/zip/master -O golang_protobuf.zip \
  && mkdir -p github.com/golang \
  && unzip golang_protobuf.zip -d github.com/golang \
  && mv github.com/golang/protobuf-master github.com/golang/protobuf \
  && rm golang_protobuf.zip

RUN wget https://codeload.github.com/google/protobuf/zip/master -O google_protobuf.zip \
  && mkdir -p github.com/google \
  && unzip google_protobuf.zip -d github.com/google \
  && mv github.com/google/protobuf-master github.com/google/protobuf \
  && rm google_protobuf.zip

WORKDIR /home/node/app

CMD [ "node" ]
