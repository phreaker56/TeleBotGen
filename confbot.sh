#!/bin/bash

ini_token () {
clear
msg -bar
echo -e "  \033[1;37mIngrese el token de su bot"
msg -bar
echo -n "TOKEN: "
read opcion
echo "$opcion" > ${CIDdir}/token
msg -bar
echo -e "  \033[1;32mtoken se guardo con exito!" && msg -bar && echo -e "  \033[1;37mPara tener acceso a todos los comandos del bot\n  deve iniciar el bot en la opcion 2.\n  desde su apps (telegram). ingresar al bot!\n  digite el comando \033[1;31m/id\n  \033[1;37mel bot le respodera con su ID de telegram.\n  copiar el ID e ingresar el mismo en la opcion 3" && msg -bar
read foo
bot_gen
}

ini_id () {
clear
msg -bar
echo -e "  \033[1;37mIngrese su ID de telegram"
msg -bar
echo -n "ID: "
read opcion
echo "$opcion" > ${CIDdir}/Admin-ID
msg -bar
echo -e "  \033[1;32mID guardo con exito!" && msg -bar && echo -e "  \033[1;37mdesde su apps (telegram). ingresar al bot!\n  digite el comando \033[1;31m/menu\n  \033[1;37mprueve si tiene acceso al menu extendido."
read foo
bot_gen
}

start_bot () {
[[ ! -e "${CIDdir}/token" ]] && echo "null" > ${CIDdir}/token
[[ ! -e "${CIDdir}/BotGen.sh" ]] && wget -O ${CIDdir}/BotGen.sh https://raw.githubusercontent.com/rudi9999/TeleBotGen/master/BotGen.sh &> /dev/null && chmod +x ${CIDdir}/BotGen.sh
unset PIDGEN
PIDGEN=$(ps aux|grep -v grep|grep "BotGen.sh")
if [[ ! $PIDGEN ]]; then
screen -dmS teleBotGen ${CIDdir}/BotGen.sh
else
killall BotGen.sh
fi
bot_gen
}

bot_gen () {
clear
info_sys

unset PID_GEN
PID_GEN=$(ps x|grep -v grep|grep "BotGen.sh")
[[ ! $PID_GEN ]] && PID_GEN="\033[1;31moffline" || PID_GEN="\033[1;32monline"

CIDdir=/etc/ADM-db && [[ ! -d ${CIDdir} ]] && mkdir ${CIDdir}
echo -e "\033[1;32m[1] \033[1;31m> \033[1;37mTOKEN DEL BOT"
echo -e "\033[1;32m[2] \033[1;31m> \033[1;37mINICIAR/PARAR BOT $PID_GEN\033[0m"
echo -e "\033[1;32m[3] \033[1;31m> \033[1;37mID DE USUARIO TELEGRAM"
echo -e "\033[1;32m[4] \033[1;31m> \033[1;37mAYUDA"
msg -bar && echo -ne "$(msg -verd "[0]") $(msg -verm2 ">") "&& msg -bra "\033[1;41m<<ATRAS"
msg -bar
echo -n "Opcion: "
read opcion
case $opcion in
0);;
1) ini_token;;
2) start_bot;;
3) ini_id;;
4)echo -e "\033[1;32m[4] \033[1;31m> \033[1;37mAYUDA" && read foo && bot_gen;;
*)bot_gen;;
esac
}
