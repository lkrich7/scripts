rem *** DO NOT RUN THIS ***
rem �����ƶ��û�Ŀ¼

robocopy "C:\Users" "D:\Users" /E /COPYALL /XJ
rmdir "C:\Users" /S
mklink /J "C:\Users" "D:\Users"