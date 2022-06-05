# simple-redis-cluster
a simple redis cluster (windows) for dev testing. this is for those who don't have docker app

## How to run
1. run the script `run-server.bat` to start the servers
2. then run `create-cluster.bat` to create the clusters
    - currently creating cluster slots parallely ,(high cpu processing) if you want to renu them sequencially uncomment the serial and cmnt the parallel script.
3. to stop the server run `stop-server.bat` this will kill the redis process

## Info
 3 Masters and 3 Slaves
 
 #### Master 
    - 127.0.0.1:7000-7002
 #### Slaves 
    - 127.0.0.1:7003-7005

ps: redis-services installings are not working (for me)