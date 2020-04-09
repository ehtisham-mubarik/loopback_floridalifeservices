docker build -t loopback:latest . 
docker run -it -p 3000:3000 -p 3001:3001 loopback:latest 
