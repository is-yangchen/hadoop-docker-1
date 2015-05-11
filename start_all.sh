
echo 'docker run .......................'

docker run --privileged=true --name=2.test.cn --net=none -itd --hostname=2.test.cn songkun/hadoop:2.7
docker run --privileged=true --name=3.test.cn --net=none -itd --hostname=3.test.cn songkun/hadoop:2.7
docker run --privileged=true --name=4.test.cn --net=none -itd --hostname=4.test.cn songkun/hadoop:2.7
docker run --privileged=true --name=5.test.cn --net=none -itd --hostname=5.test.cn songkun/hadoop:2.7
docker run --privileged=true --name=6.test.cn --net=none -itd --hostname=6.test.cn songkun/hadoop:2.7
docker run --privileged=true --name=7.test.cn --net=none -itd --hostname=7.test.cn songkun/hadoop:2.7

echo 'set network ......................'
./network.sh 2.test.cn 172.17.42.2
./network.sh 3.test.cn 172.17.42.3
./network.sh 4.test.cn 172.17.42.4
./network.sh 5.test.cn 172.17.42.5
./network.sh 6.test.cn 172.17.42.6
./network.sh 7.test.cn 172.17.42.7

echo 'namenode format ..................'
docker exec 2.test.cn /usr/local/hadoop/bin/hdfs namenode -format
echo 'start dfs ........................'
#/usr/local/hadoop-2.7.0/sbin/start-dfs.sh
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
docker exec 3.test.cn /usr/local/hadoop/bin/hadoop fs -mkdir /app-logs
docker exec 3.test.cn /usr/local/hadoop/sbin/mr-jobhistory-daemon.sh start historyserver
