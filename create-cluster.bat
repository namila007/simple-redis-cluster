rem allow master nodes to meet each other
redis-cli -c -h 127.0.0.1 -p 7000 cluster meet 127.0.0.1 7001
redis-cli -c -h 127.0.0.1 -p 7000 cluster meet 127.0.0.1 7002

@REM ===========================================================

@REM keep either serial or parallel slot creation

@REM +++uncomment below lines for serial+++++

@REM echo "adding slots  serial"
@REM @REM @Echo off & SetLocal EnableDelayedExpansion
@REM rem assign 16384 slots to each master node evenly
@REM for /l %%s in (0, 1, 5461) do redis-cli -h 127.0.0.1 -p 7000 CLUSTER ADDSLOTS %%s
@REM for /l %%s in (5462, 1, 10923) do redis-cli -h 127.0.0.1 -p 7001 CLUSTER ADDSLOTS %%s
@REM for /l %%s in (10924, 1, 16383) do redis-cli -h 127.0.0.1 -p 7002 CLUSTER ADDSLOTS %%s
@REM @REM @echo on
@REM echo "slots added"

@REM ++++uncomment below line for parallel++++++++++++++++++++++++++++++++++++++++++++++++++

echo "adding slots parallel"
@REM @Echo off & SetLocal EnableDelayedExpansion
start /wait cmd /c cluster-slot-parallel.bat
@REM @echo on
echo "slots added"
@REM ============================================================================

@echo off
echo "meeting slaves with its masters"
rem allow slave nodes to meet with master nodes
redis-cli -c -h 127.0.0.1 -p 7000 cluster meet 127.0.0.1 7003
redis-cli -c -h 127.0.0.1 -p 7001 cluster meet 127.0.0.1 7004
redis-cli -c -h 127.0.0.1 -p 7002 cluster meet 127.0.0.1 7005

@rem replicationg cluster slaves with masters
echo "replicating masters to slaves"
FOR /F  "tokens=1,3 delims= " %%i IN ('redis-cli -c -h 127.0.0.1 -p 7000 cluster nodes') do ( if "%%j"=="myself,master" (  set m1_id=%%i ))
FOR /F  "tokens=1,3 delims= " %%i IN ('redis-cli -c -h 127.0.0.1 -p 7001 cluster nodes') do ( if "%%j"=="myself,master" (  set m2_id=%%i ))
FOR /F  "tokens=1,3 delims= " %%i IN ('redis-cli -c -h 127.0.0.1 -p 7002 cluster nodes') do ( if "%%j"=="myself,master" (  set m3_id=%%i ))

redis-cli -c -h 127.0.0.1 -p 7003 cluster replicate %m1_id%%
redis-cli -c -h 127.0.0.1 -p 7004 cluster replicate %m2_id%
redis-cli -c -h 127.0.0.1 -p 7005 cluster replicate %m3_id%

echo "done"