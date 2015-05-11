
echo 'docker restart .......................'

docker restart 2.test.cn
docker restart 3.test.cn
docker restart 4.test.cn
docker restart 5.test.cn
docker restart 6.test.cn
docker restart 7.test.cn

echo 'set network ......................'
./network.sh 2.test.cn 172.17.42.2
./network.sh 3.test.cn 172.17.42.3
./network.sh 4.test.cn 172.17.42.4
./network.sh 5.test.cn 172.17.42.5
./network.sh 6.test.cn 172.17.42.6
./network.sh 7.test.cn 172.17.42.7

echo 'start dfs ........................'
#/usr/local/hadoop/sbin/start-dfs.sh
docker exec 2.test.cn /usr/local/hadoop/sbin/hadoop-daemon.sh --script hdfs start namenode
docker exec 2.test.cn /usr/local/hadoop/sbin/hadoop-daemon.sh --script hdfs start datanode
docker exec 3.test.cn /usr/local/hadoop/sbin/hadoop-daemon.sh --script hdfs start datanode
docker exec 4.test.cn /usr/local/hadoop/sbin/hadoop-daemon.sh --script hdfs start datanode
docker exec 5.test.cn /usr/local/hadoop/sbin/hadoop-daemon.sh --script hdfs start datanode
docker exec 6.test.cn /usr/local/hadoop/sbin/hadoop-daemon.sh --script hdfs start datanode
docker exec 7.test.cn /usr/local/hadoop/sbin/hadoop-daemon.sh --script hdfs start datanode
docker exec 5.test.cn /usr/local/hadoop/sbin/hadoop-daemon.sh --script hdfs start secondarynamenode

docker exec 3.test.cn /usr/local/hadoop/sbin/yarn-daemon.sh start resourcemanager
docker exec 2.test.cn /usr/local/hadoop/sbin/yarn-daemon.sh start nodemanager
docker exec 3.test.cn /usr/local/hadoop/sbin/yarn-daemon.sh start nodemanager
docker exec 4.test.cn /usr/local/hadoop/sbin/yarn-daemon.sh start nodemanager
docker exec 5.test.cn /usr/local/hadoop/sbin/yarn-daemon.sh start nodemanager
docker exec 6.test.cn /usr/local/hadoop/sbin/yarn-daemon.sh start nodemanager
docker exec 7.test.cn /usr/local/hadoop/sbin/yarn-daemon.sh start nodemanager
