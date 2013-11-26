rem *** DO NOT RUN THIS ***
rem 用于迁移用户目录
robocopy "C:\Users" "D:\Users" /E /COPYALL /XJ
rmdir "C:\Users" /S
mklink /J "C:\Users" "D:\Users"
