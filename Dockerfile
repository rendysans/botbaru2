FROM node:lts-buster

RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

COPY package.json .

RUN npm install
RUN npm install pm2 -g
ENV PM2_PUBLIC_KEY wckctc2403tx929
ENV PM2_SECRET_KEY 7yg6gv2apd911uu


COPY . .
EXPOSE 5000
CMD ["pm2-runtime", "app.js"]
