@echo off
if /I "%1"=="start" (
	netsh wlan set hostednetwork mode=allow ssid=lksns key=1234554321
	netsh wlan start hostednetwork mode=allow
) else if /I "%1"=="stop" (
	netsh wlan set hostednetwork mode=disallow
) else (
	echo %0 [start ^| stop]
)


