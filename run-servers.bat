cd m1
del nodes-7000.conf
del appendonly.aof
del dump.rdb
del server_log.txt
start /min cmd /c redis-server.exe redis.windows.conf
cd ..
cd m2
del nodes-7001.conf
del appendonly.aof
del dump.rdb
del server_log.txt
start /min cmd /c redis-server.exe redis.windows.conf
cd..
cd m3
del nodes-7002.conf
del appendonly.aof
del dump.rdb
del server_log.txt
start /min cmd /c redis-server.exe redis.windows.conf
cd..
cd s1
del nodes-7003.conf
del appendonly.aof
del dump.rdb
del server_log.txt
start /min cmd /c redis-server.exe redis.windows.conf
cd..
cd s2
del nodes-7004.conf
del appendonly.aof
del dump.rdb
del server_log.txt
start /min cmd /c redis-server.exe redis.windows.conf
cd..
cd s3
del nodes-7005.conf
del appendonly.aof
del dump.rdb
del server_log.txt
start /min cmd /c redis-server.exe redis.windows.conf
cd..