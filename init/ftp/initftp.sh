#1/bin/bash
# 确认函数：
confirm () {
    while true; do
        read -p "$1 " yn
        case $yn in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            * ) echo "请输入 Y/y 或者 N/n ，其他按键无效";;
        esac
    done
}

nextStep () {
    if confirm "如果上一部分没有问题，确定继续此部分？"; then
        echo '开始下一阶段'
    else
        echo '退出'
        exit
    fi
}

echoread () {
echo ''
echo ''
echo "--------------------------------------------------------------------"
echo "--------------------------------------------------------------------"
}
echo "---------------------------准备安装ftp----------------------------"
nextStep
echoread
echo "---------------------------01.安装ftp-------------------------"
nextStep
echoread
yum install -y vsftpd
echo "---------------------------02.创建ftp用并设置密码，密码请记住-----------------------------"
nextStep
echoread
useradd ftpuser
passwd ftpuser
echo "---------------------03.设置开机自启-------------------------------"
nextStep
echoread
systemctl enable vsftpd
systemctl start vsftpd
echo "---------------------04.查看状态------------------------------"
echo "---------------------05.配置ftp-----------------------------"
nextStep

echo ''
chmod 777 -R /home/ftpuser/
echoread
echo "---------------配置ftp结束---------------------------------"

