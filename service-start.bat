cd m1
del nodes-7000.conf
del appendonly.aof
del dump.rdb
del server_log.txt
redis-server --service-install redis.windows-service.conf --service-name Redism1 --port 17000
redis-server --service-start --service-name Redism1
cd ..
cd m2
del nodes-7001.conf
del appendonly.aof
del dump.rdb
del server_log.txt
redis-server --service-install redis.windows-service.conf --service-name Redism2 --port 7001
redis-server --service-start --service-name Redism2
cd..
cd m3
del nodes-7002.conf
del appendonly.aof
del dump.rdb
del server_log.txt
redis-server --service-install redis.windows-service.conf --service-name Redism3 --port 7002
redis-server --service-start --service-name Redism3
cd..
cd s1
del nodes-7003.conf
del appendonly.aof
del dump.rdb
del server_log.txt
redis-server --service-install redis.windows-service.conf --service-name Rediss1 --port 7003
redis-server --service-start --service-name Rediss1
cd..
cd s2
del nodes-7004.conf
del appendonly.aof
del dump.rdb
del server_log.txt
redis-server --service-install redis.windows-service.conf --service-name Rediss2 --port 7004
redis-server --service-start --service-name Rediss2
cd..
cd s3
del nodes-7005.conf
del appendonly.aof
del dump.rdb
del server_log.txt
redis-server --service-install redis.windows-service.conf --service-name Rediss3 --port 7005
redis-server --service-start --service-name Rediss3
cd..