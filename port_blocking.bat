@echo off
chcp 65001
title Closing port 445, 135, 137, 138, 139
echo Closing ports using Windows IPsec
echo Make sure that you are using the administrative mode
echo 此脚本利用Windows IP安全策略关闭脚本
echo 请使用管理员模式运行
pause
netsh ipsec static add policy name=BLOCK_PORT
echo Creating policy
netsh ipsec static add filterlist name=close_port
echo Adding filterlist
netsh ipsec static add filter filterlist=close_port srcaddr=any dstaddr=Me dstport=445 protocol=TCP
echo Adding 445 port to the filterlist
netsh ipsec static add filter filterlist=close_port srcaddr=any dstaddr=Me dstport=135 protocol=TCP
echo Adding 135 port to the filterlist
netsh ipsec static add filter filterlist=close_port srcaddr=any dstaddr=Me dstport=137 protocol=TCP
echo Adding 137 port to the filterlist
netsh ipsec static add filter filterlist=close_port srcaddr=any dstaddr=Me dstport=138 protocol=TCP
echo Adding 138 port to the filterlist
netsh ipsec static add filter filterlist=close_port srcaddr=any dstaddr=Me dstport=139 protocol=TCP
echo Adding 139 port to the filterlist

netsh ipsec static add filteraction name=block_act action=block
echo Creating the block action
netsh ipsec static add rule name=killport policy=BLOCK_PORT filterlist=close_port filteraction=block_act
netsh ipsec static set policy name=BLOCK_PORT assign=y

echo Motion assigned
echo Press any key to quit...
echo 请按任意键关闭...
pause>nul 
