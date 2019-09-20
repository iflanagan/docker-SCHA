The commands below Create a HIGH AVAILABILITY SAUCE CONNECT TUNNELS. NOTE you can open two terminal windows and execute the same command to run to truly obtain a HA environment. 


Docker Project: 

iflanagan/sauceconnectha

GitHub Project

https://github.com/iflanagan/docker-sauce-connect

 

docker run -it iflanagan/sauceconnectha:first_version <sauce_username> <sauce_access_key> Web <TunnelIdentifierName>


-Creates a High Availability Tunnel in Headless

docker run -it iflanagan/sauceconnectha:first_version <sauce_username> <sauce_access_key> HEADLESS <TunnelIdentifierName>

-Creates a High Availability Tunnel in US Real Device Cloud

docker run -it iflanagan/sauceconnectha:first_version <sauce_username> <sauce_access_key> US <TunnelIdentifierName>

-Creates a High Availability Tunnel in Real Europe  Device Cloud

docker run -it iflanagan/sauceconnectha:first_version <sauce_username> <sauce_access_key> EU <TunnelIdentifierName>



If you want to adjust the memory, CPU or disk space of a container see below


https://stackoverflow.com/questions/44533319/how-to-assign-more-memory-to-docker-container


Also if you want to pull down the files and build the project yourself here are the steps 

Create directory
Cd <directory>
docker pull iflanagan/sctunnels

docker build -t <imagename> .

docker tag <imagename> <dockeraccount>/<Dockerproject>:<tagname>
docker login
docker push  <dockeraccount>/<Dockerproject>:<tagname>



