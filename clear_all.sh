echo 'stop 2.test.cn......'
docker stop 2.test.cn

echo 'stop 3.test.cn......'
docker stop 3.test.cn

echo 'stop 4.test.cn......'
docker stop 4.test.cn

echo 'stop 5.test.cn......'
docker stop 5.test.cn

echo 'stop 6.test.cn......'
docker stop 6.test.cn

echo 'stop 7.test.cn......'
docker stop 7.test.cn

echo 'remove the stopped container .....'
#docker ps -a -q|xargs docker rm
docker rm 2.test.cn
docker rm 3.test.cn
docker rm 4.test.cn
docker rm 5.test.cn
docker rm 6.test.cn
docker rm 7.test.cn
