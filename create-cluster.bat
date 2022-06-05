@echo off
echo yes | redis-cli --cluster  create 127.0.0.1:7000  127.0.0.1:7001  127.0.0.1:7002 --cluster-replicas 0

@rem replicationg cluster slaves with masters
echo "replicating masters to slaves"
FOR /F  "tokens=1,3 delims= " %%i IN ('redis-cli -c -h 127.0.0.1 -p 7000 cluster nodes') do ( if "%%j"=="myself,master" (  set m1_id=%%i ))
FOR /F  "tokens=1,3 delims= " %%i IN ('redis-cli -c -h 127.0.0.1 -p 7001 cluster nodes') do ( if "%%j"=="myself,master" (  set m2_id=%%i ))
FOR /F  "tokens=1,3 delims= " %%i IN ('redis-cli -c -h 127.0.0.1 -p 7002 cluster nodes') do ( if "%%j"=="myself,master" (  set m3_id=%%i ))

redis-cli  --cluster add-node 127.0.0.1:7003 127.0.0.1:7000 --cluster-slave --cluster-master-id  %m1_id%%
redis-cli  --cluster add-node 127.0.0.1:7004 127.0.0.1:7001 --cluster-slave --cluster-master-id  %m2_id%
redis-cli  --cluster add-node 127.0.0.1:7005 127.0.0.1:7002 --cluster-slave --cluster-master-id  %m3_id%

echo "done"

