FROM node:16
WORKDIR /usr/src/app
COPY package.json ./
COPY pnpm-lock.yaml ./
RUN mkdir -p node_modules
RUN chown -R $user:$user *
RUN chown -R $user:$user node_modules
USER $user

RUN pnpm i

ENV NODE_ENV production
EXPOSE 9000
CMD [ "node", "index.js" ]