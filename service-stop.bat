redis-server --service-stop --service-name Redism1
redis-server --service-uninstall --service-name Redism1

redis-server --service-stop --service-name Redism2
redis-server --service-uninstall --service-name Redism2

redis-server --service-stop --service-name Redism3
redis-server --service-uninstall --service-name Redism3

redis-server --service-stop --service-name Rediss1
redis-server --service-uninstall --service-name Rediss1

redis-server --service-stop --service-name Rediss2
redis-server --service-uninstall --service-name Rediss2

redis-server --service-stop --service-name Rediss3
redis-server --service-uninstall --service-name Rediss3


cd m1
del nodes-7000.conf
del appendonly.aof
del dump.rdb
del server_log.txt

cd..
cd m2
del nodes-7001.conf
del appendonly.aof
del dump.rdb
del server_log.txt

cd..
cd m3
del nodes-7002.conf
del appendonly.aof
del dump.rdb
del server_log.txt

cd..
cd s1
del nodes-7003.conf
del appendonly.aof
del dump.rdb
del server_log.txt

cd..
cd s2
del nodes-7004.conf
del appendonly.aof
del dump.rdb
del server_log.txt

cd..
cd s3
del nodes-7005.conf
del appendonly.aof
del dump.rdb
del server_log.txt
cd ..