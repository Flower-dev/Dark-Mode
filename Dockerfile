# pull official base img
FROM node:19.0.0-alpine

RUN mkdir /usr/app

# set working directory
WORKDIR /usr/app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY package.json ./
COPY package-lock.json ./
RUN npm install

# add app
COPY . ./

# start app
CMD ["npm", "run", "dev"]