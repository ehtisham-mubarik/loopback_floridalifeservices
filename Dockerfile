FROM node:8.10.0
RUN mkdir -p /home/node/app
WORKDIR /home/node/app
# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied

COPY  /package.json ./package.json
COPY /package-lock.json ./package-lock.json
RUN npm install

#Bundle app source code
COPY  . .
RUN npm  build
# Bind to all network interfaces so that it can be mapped to the host OS
ENV HOST=0.0.0.0 PORT=3000 PORT2=3001  
EXPOSE 3000
EXPOSE 3001

#CMD ["sleep", "10"]
CMD ["npm", "start"]  
