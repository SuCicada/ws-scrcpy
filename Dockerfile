FROM node:18 AS builder

ENV LANG C.UTF-8
WORKDIR /ws-scrcpy
RUN npm install -g node-gyp  && \
    apt update && \
    apt install android-tools-adb -y && \
    rm -rf /var/lib/apt/lists/*

# RUN git clone https://github.com/NetrisTV/ws-scrcpy.git .
COPY . .
RUN npm install
RUN npm run dist 

EXPOSE 8000

CMD ["node", "dist/index.js"]
