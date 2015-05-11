steps:

1. build image,eg:
  docker build -t songkun/hadoop:2.7 .
2. edit /etc/hosts(note:you may edit the ip ,if the docker0's ip does not start with 172.17.42.edit the prefix same to the docker0's.....and edit the hosts file),add :
  172.17.42.2 2.test.cn
  172.17.42.3 3.test.cn
  172.17.42.4 4.test.cn
  172.17.42.5 5.test.cn
  172.17.42.6 6.test.cn
  172.17.42.7 7.test.cn
  
3. start containers 
  ./start-all.sh
4. stop containers 
  ./stop-all.sh
5. restart containers
  ./restart-all.sh
6. clear containers
  ./clear-all.sh
