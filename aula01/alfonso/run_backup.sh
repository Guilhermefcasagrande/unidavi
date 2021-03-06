#docker rm -f host1 || true
#docker rm -f host2 || true
#docker rm -f host3 || true
#docker rm -f mysql01 || true 
#docker rm -f loadbalancer || true
docker rm -f $(docker ps -a -q)

#docker run -d --name mysql01 -h mysql01 -e MYSQL_ROOT_PASSWORD=teste -d mysql8
docker run -d --name mysql01 -h mysql01 -p 3306:3306 -e MYSQL_ROOT_PASSWORD=unidavi -e MYSQL_DATABASE=unidavi mysql8

sleep 10s

docker run -d --name host1 -h host1 --link mysql01:mysql01 -p 8080:8080 tomee-unidavi
#docker run -d --name host2 -h host2 --link mysql01:mysql01 -p 8082:8080 tomee-unidavi
#docker run -d --name host3 -h host3 --link mysql01:mysql01 -p 8083:8080 tomee-unidavi
#docker run -d --name loadbalancer -h loadbalancer -p 81:80 --link host1:host1 --link host2:host2 --link host3:host3 --env-file ./env.list jasonwyatt/nginx-loadbalancer

