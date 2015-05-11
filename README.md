steps:<br/><br/>

1. build image,eg:<br/>
  docker build -t songkun/hadoop:2.7 .
2. edit /etc/hosts(note:you may edit the ip ,if the docker0's ip does not start with 172.17.42.edit the prefix same to the docker0's.....and edit the hosts file),add the following lines to /etc/hosts:<br/>
  172.17.42.2 2.test.cn<br/>
  172.17.42.3 3.test.cn<br/>
  172.17.42.4 4.test.cn<br/>
  172.17.42.5 5.test.cn<br/>
  172.17.42.6 6.test.cn<br/>
  172.17.42.7 7.test.cn
  
3. start containers <br/>
  ./start-all.sh
4. stop containers <br/>
  ./stop-all.sh
5. restart containers<br/>
  ./restart-all.sh
6. clear containers<br/>
  ./clear-all.sh
