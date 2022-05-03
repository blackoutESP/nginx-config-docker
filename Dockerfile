FROM nginx:latest
RUN apt update && apt upgrade -y
RUN apt install -y nodejs npm
RUN npm install -g pm2 socket.io
RUN mkdir -p /usr/share/nginx/cloudlite-typescript/back/
COPY ./back/ /usr/share/nginx/cloudlite-typescript/back/
WORKDIR /usr/share/nginx/cloudlite-typescript/back
RUN npm install
RUN npm run build
RUN cd /usr/share/nginx/cloudlite-typescript/back/out/ && mkdir logs
RUN cp /usr/share/nginx/cloudlite-typescript/back/src/config.json /usr/share/nginx/cloudlite-typescript/back/out/
ENV NODE_ENV dev
ENV PORT 3000
RUN mkdir /usr/share/nginx/cloudlite-typescript/front
COPY --chown=root:http ./front/dist/front/* /usr/share/nginx/cloudlite-typescript/front/
COPY ./nginx.conf.docker /etc/nginx/nginx.conf
EXPOSE 80
WORKDIR /usr/share/nginx/cloudlite-typescript/back/out/
CMD ["node", "/usr/share/nginx/cloudlite-typescript/back/out/index.js"]