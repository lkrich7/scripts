
@echo off
MODE con: COLS=80 lines=20
:main
title  --   win7's IP切换  by灰糖   --   有线、无线二合一 
color 7
cls

set choice=""
set 网络类型=""&set 随机模式=0
set 网络名称=""
set IP地址=""&set 子网掩码=""&set 默认网关=""set 子IP=""
set 首选DNS=""
set 备用DNS=""
set 网络密码=""

echo.
echo.
echo          ">>>>>>>   欢迎使用灰糖整理的IP切换批处理   <<<<<<<"
echo.
echo             1、设置【有线】网络         2、设置【无线】网络
echo.
echo             3、 随机设置【有线】网络    4、随机设置【无线】网络
echo.
echo                s、说明        w、作者首页        x、退出
echo.
echo                                                “不做选择10秒自动退出”
echo.
echo.
choice /t 10 /c swx1234 /d x /n /m "----请选择："
if %errorlevel%==1 goto 说明
if %errorlevel%==2 start iexplore.exe "http://supersea.blog.163.com"&goto main
if %errorlevel%==3 exit 
if %errorlevel%==4 goto 有线网络设置
if %errorlevel%==5 goto 无线网络设置
if %errorlevel%==6 set RanMod=1&goto 有线网络设置
if %errorlevel%==7 set RanMod=1&goto 无线网络设置


% ====================== 有线网络设置 ====================== %
:有线网络设置
title  --   有线网络 IP切换  by灰糖   --
color a
set 网络类型=本地连接
set 网络类型名称=有线网络
cls

%==以下是不同环境IP的名称，以地点命名，可依次向后添加==%
set 网络名称1=高新
set 网络名称2=金碧
set 网络名称3=Dlink

echo.
echo.
echo                  ">>>>>>>   开始设置【有线】网络   <<<<<<<"
echo.
echo.
echo          1、切换“%网络名称1%” 2、切换“%网络名称2%” 3、切换“%网络名称3%”
echo.
echo        a、自动获取   t、测试   h、手动添加
echo. 
echo.
echo.
choice /t 10 /c athx1234567890 /d x /n /m "----请选择："   %这里只预定义了10个应用场所，估计10个够用个，不够就自行添加吧%
echo.

if %errorlevel%==1 goto 自动获取IP
if %errorlevel%==2 goto 测试当前IP
if %errorlevel%==3 goto 手动输入IP
if %errorlevel%==4 exit                   %前4个是功能开关，5到14是IP场所切换%
if %errorlevel%==5 goto ip1
if %errorlevel%==6 goto ip2
if %errorlevel%==7 goto ip3

goto main

%===================预设有线自定义IP================%
:ip1
cls
if %随机模式%==1 (set /a 子IP=100+%random:~2,2%) else if %随机模式%==0 (set 子IP=117) else goto main
set 网络名称=%网络名称1%
set IP地址=172.16.197.%子IP%
set 子网掩码=255.255.255.0
set 默认网关=172.16.197.1
set 首选DNS=222.172.200.68
set 备用DNS=61.166.150.123
call :IP设置
goto 结束

:ip2
cls
if %随机模式%==1 (set /a 子IP=100+%random:~2,2%) else if %随机模式%==0 (set 子IP=217) else goto main
set 网络名称=%网络名称2%
set IP地址=192.168.195.%子IP%
set 子网掩码=255.255.255.0
set 默认网关=192.168.195.1
set 首选DNS=222.172.200.68
set 备用DNS=61.166.150.123
call :IP设置
goto 结束

:ip3
cls
if %随机模式%==1 (set /a 子IP=100+%random:~2,2%) else if %随机模式%==0 (set 子IP=7) else goto main
set 网络名称=%网络名称3%
set IP地址=192.168.1.%子IP%   
set 子网掩码=255.255.255.0
set 默认网关=192.168.1.1 
set 首选DNS=222.172.200.68
set 备用DNS=61.166.150.123
call :IP设置
goto 结束

%===========添加新IP设置要修改相应参数========%
:ip4
cls
if %随机模式%==1 (set /a 子IP=100+%random:~2,2%) else if %随机模式%==0 (set 子IP=7) else goto main
set 网络名称=%网络名称4%
set IP地址=192.168.1.%子IP%   
set 子网掩码=255.255.255.0
set 默认网关=192.168.1.1 
set 首选DNS=222.172.200.68
set 备用DNS=61.166.150.123
call :IP设置
goto 结束

% ====================== 无线网络设置 ====================== %
:无线网络设置
title  --   无线网络 IP切换  by灰糖   --
color a
set 网络类型=无线网络连接
set 网络类型名称=无线网络
cls

%==以下是不同环境IP的名称，以地点命名，可依次向后添加==%
set 网络名称1=凤翥校区
set 网络名称2=一二一校区
set 网络名称3=Dlink

echo.
echo.
echo                  ">>>>>>>   开始设置【无线】网络   <<<<<<<"
echo.
echo.
echo          1、切换“%网络名称1%” 2、切换“%网络名称2%” 3、切换“%网络名称3%”
echo.
echo        a、自动获取   t、测试   h、手动添加  w、无线AP设置
echo. 
echo.
echo.
choice /t 10 /c athwx1234567890 /d x /n /m "----请选择："  %这里只预定义了10个应用场所，估计10个够用个，不够就自行添加吧%
echo.

if %errorlevel%==1 goto 自动获取IP
if %errorlevel%==2 goto 测试当前IP
if %errorlevel%==3 goto 手动输入IP
if %errorlevel%==4 goto 设置AP
if %errorlevel%==5 exit                  %前5个是功能开关，6到15是IP场所切换%
if %errorlevel%==6 goto ip1
if %errorlevel%==7 goto ip2
if %errorlevel%==8 goto ip3

goto main

%===================预设无线自定义IP================%
:ip1
cls
if %随机模式%==1 (set /a 子IP=100+%random:~2,2%) else if %随机模式%==0 (set 子IP=117) else goto main
set 网络名称=%网络名称1%
set IP地址=172.16.85.%子IP%
set 子网掩码=255.255.255.0
set 默认网关=172.16.85.1
set 首选DNS=222.172.200.68
set 备用DNS=61.166.150.123
set 网络密码=ijeiqn(ornmf7f
call :IP设置
goto 结束

:ip2
cls
if %随机模式%==1 (set /a 子IP=100+%random:~2,2%) else if %随机模式%==0 (set 子IP=118) else goto main
set 网络名称=%网络名称2%
set IP地址=192.168.196.%子IP%
set 子网掩码=255.255.255.0
set 默认网关=192.168.196.1
set 首选DNS=222.172.200.68
set 备用DNS=61.166.150.123
set 网络密码=1jia1dy2
call :IP设置
goto 结束

:ip3
cls
if %随机模式%==1 (set /a 子IP=100+%random:~2,2%) else if %随机模式%==0 (set 子IP=27) else goto main
set 网络名称=%网络名称3%
set IP地址=192.168.1.%子IP%   
set 子网掩码=255.255.255.0
set 默认网关=192.168.1.1 
set 首选DNS=222.172.200.68
set 备用DNS=61.166.150.123
set 网络密码=""
call :IP设置
goto 结束

%===========添加新IP设置要修改相应参数========%
:ip4
cls
if %随机模式%==1 (set /a 子IP=100+%random:~2,2%) else if %随机模式%==0 (set 子IP=27) else goto main
set 网络名称=%网络名称4%
set IP地址=192.168.1.7   
set 子网掩码=255.255.255.0
set 默认网关=192.168.1.1 
set 首选DNS=222.172.200.68
set 备用DNS=61.166.150.123
set 网络密码=""
call :IP设置
goto 结束

%===================IP设置过程================%
:IP设置
title  --  设置%网络类型名称% %网络名称%环境 IP  by灰糖   -- 
color a
cls
if not %网络密码%=="" (
echo %网络名称%密码：%网络密码%（已经复制到剪切板，可直接粘贴。）
echo %网络密码%|clip
echo.
echo.
)
echo 正在设置  %网络名称%  网络....
echo.
echo 设置  IP、网关及子网掩码...
cmd /c netsh interface ip set address name="%网络类型%" static %IP地址% %子网掩码% %默认网关% 1
echo 设置  首选DNS服务器...
cmd /c netsh interface ip set dns name="%网络类型%" static %首选DNS% PRIMARY 
if 备用DNS=="" goto :eof
echo 设置  备用DNS服务器...
cmd /c netsh interface ip add dns name="%网络类型%" %备用DNS%
echo ">>设置完成
goto :eof

%==================自动获得IP===============%
:自动获取IP
title  --  自动获取%网络类型名称%IP  by灰糖   -- 
cls
echo 正在更改网络自动获得IP...
echo.
echo 自动获取IP地址....
netsh interface ip set address name="%网络类型%" source=dhcp
echo 自动获取DNS服务器....
netsh interface ip set dns name="%网络类型%" source=dhcp
echo ">>设置完成
goto 结束

%===================手动输入IP==============%
:手动输入IP
title  --  手动输入%网络类型名称% %网络名称% IP  by灰糖   -- 
color c
cls
echo.
echo. 此段未设置输入校验，请仔细填写！！
echo.
set /p IP地址=     ----请输入  IP地址：
echo.
set /p 子网掩码=     ----请输入  子网掩码：
echo.
set /p 默认网关=     ----请输入  默认网关：
if %IP地址%=="" goto 手动输入IP
if %子网掩码%=="" goto 手动输入IP
if %默认网关%=="" goto 手动输入IP
echo.
set /p 首选DNS=     ----请输入  首选DNS：
if %首选DNS%=="" goto 手动输入IP
echo.
set /p 备用DNS=     ----请输入  备用DNS(可以留空)：
call :IP设置
goto 结束

%===================检测网络情况==============%
:测试当前IP
title  --  检测%网络类型名称%当前IP  by灰糖   -- 
color e
cls
echo.
echo 测试结果如下...
echo.
echo.
netsh interface ip show config name = "%网络类型%"
echo.
echo.
set /p choice=请按任意键返回...
goto main

%===================无线AP管理==============%
:设置AP
colot c
cls
echo.
choice /c 12 /n /m "-----1、开启无线AP功能   2、关闭无线AP功能"
if %errorlevel%==1 goto 开启AP
if %errorlevel%==2 goto 关闭AP

:开启AP
cls
echo.
set AP名称=""
set /p AP名称=请输入AP名称，回车默认howie...
if %AP名称%=="" set AP名称=howie
echo.
set AP密码=""
set /p AP密码=请输入AP密码，回车默认huitang...
if %AP密码%=="" set AP密码=huitang
netsh wlan set hostednetwork mode=allow ssid=%AP名称% key=%AP密码%
goto 结束

:关闭AP
cls
netsh wlan set hostednetwork mode=disallow
goto 结束

%======================说明==================%
:说明
title  --   win7's IP切换  by灰糖   -- 作者主页：http://supersea.blog.163.com
color a
cls
echo.
echo 说明：
echo.
echo          1、此批处理只适用于win7，XP下会提示choice语句错误。
echo          请到http://supersea.blog.163.com寻找XP适用版
echo.
echo          2、这里只预定义了10个应用场所，估计10个够用了，不够就自行添加吧。
echo.
echo          3、修改使用场所名称和IP在相应段落已作说明，按提示修改即可。
echo.
echo          4、固定IP切换可进行IP子段随机生成，一定程度上可避免产生IP冲突。
echo.
echo          5、手动输入IP没有做IP合理性校验，必须填写完整IP；但是对空输入有检查。
echo.
echo          6、222.172.200.68和61.166.150.123分别是云南电信主用和备用DNS服务器，
echo          请根据不同地区自行更改。
echo.
pause

%======================退出===================%
:结束
title  --   win7's IP切换  by灰糖   -- 感谢使用
color a
set choice=""
echo.
choice /t 10 /c yn /d y /n /m "退出请按 Y，返回菜单请按 N。(默认10秒自动退出)"
if %errorlevel%==1 exit
if %errorlevel%==2 goto main
