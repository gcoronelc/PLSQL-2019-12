expdp system/oracle schemas=SCOTT dumpfile=SCOTT.dmp logfile=scott.log

impdp system/oracle schemas=SCOTT dumpfile=SCOTT.dmp logfile=scott2.log


