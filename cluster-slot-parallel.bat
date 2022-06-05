rem assign 16384 slots to each master node evenly
start cmd /c for /l %%s in (0, 1, 5461) do redis-cli -h 127.0.0.1 -p 7000 CLUSTER ADDSLOTS %%s
start cmd /c for /l %%s in (5462, 1, 10923) do redis-cli -h 127.0.0.1 -p 7001 CLUSTER ADDSLOTS %%s
timeout /t 1 /nobreak
start /wait cmd /c for /l %%s in (10924, 1, 16383) do redis-cli -h 127.0.0.1 -p 7002 CLUSTER ADDSLOTS %%s