FROM node:19-alpine
COPY package.json package.json
COPY index.js index.js
RUN npm install
ENTRYPOINT [ "node", "index.js" ]
 