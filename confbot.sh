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

ayuda_fun () {
clear
msg -bar
echo -e "            \033[1;41m Instrucciones rapidas \033[0m"
msg -bar
echo -e "\033[1;37m   Es necesario crear un bot en \033[1;32m@BotFather "
msg -bar
echo -e "\033[1;32m1- \033[1;37mEn su apps telegram ingrese a @BotFather"
echo -e "\033[1;32m2- \033[1;37mDigite el comando \033[1;31m/newbot"
echo -e "\033[1;32m3- @BotFather \033[1;37msolicitara que\n   asigne un nombre a su bot"
echo -e "\033[1;32m4- @BotFather \033[1;37msolicitara que asigne otro nombre,\n   esta vez deve finalizar en bot eje: \033[1;31mXXX_bot"
echo -e "\033[1;32m5- \033[1;37mObtener token del bot creado.\n   En \033[1;32m@BotFather \033[1;37mdigite el comando \033[1;31m/token\n   \033[1;37mseleccione el bot y copie el token."
echo -e "\033[1;32m6- \033[1;37mIngrese el token\n   en la opcion \033[1;32m[1] \033[1;31m> \033[1;37mTOKEN DEL BOT"
echo -e "\033[1;32m7- \033[1;37mPoner en linea el bot\n   en la opcion \033[1;32m[2] \033[1;31m> \033[1;37mINICIAR/PARAR BOT"
echo -e "\033[1;32m8- \033[1;37mEn su apps telegram, inicie el bot creado\n   digite el comando \033[1;31m/id \033[1;37mel bot le respondera\n   con su ID de telegran (copie el ID)"
echo -e "\033[1;32m9- \033[1;37mIngrese el ID en la\n   opcion \033[1;32m[3] \033[1;31m> \033[1;37mID DE USUARIO TELEGRAM"
echo -e "\033[1;32m10-\033[1;37mcomprueve que tiene acceso a\n   las opciones avanzadas de su bot."
msg -bar
read foo
bot_gen
}

bot_gen () {
clear

unset PID_GEN
PID_GEN=$(ps x|grep -v grep|grep "BotGen.sh")
[[ ! $PID_GEN ]] && PID_GEN="\033[1;31moffline" || PID_GEN="\033[1;32monline"

CIDdir=/etc/ADM-db && [[ ! -d ${CIDdir} ]] && mkdir ${CIDdir}
msg -bar
echo -e "     \033[1;41m \033[1;37m>>>>>>  BotGen by \033[1;36mRufu99\033[1;37m  v1.0 <<<<<< \033[0m"
msg -bar
echo -e "\033[1;32m[1] \033[1;31m> \033[1;37mTOKEN DEL BOT"
echo -e "\033[1;32m[2] \033[1;31m> \033[1;37mINICIAR/PARAR BOT $PID_GEN\033[0m"
echo -e "\033[1;32m[3] \033[1;31m> \033[1;37mID DE USUARIO TELEGRAM"
echo -e "\033[1;32m[4] \033[1;31m> \033[1;37mMANUAL"
msg -bar && echo -ne "$(msg -verd "[0]") $(msg -verm2 ">") "&& msg -bra "\033[1;41m\033[1;37m <<ATRAS "
msg -bar
echo -n "Opcion: "
read opcion
case $opcion in
0);;
1) ini_token;;
2) start_bot;;
3) ini_id;;
4)ayuda_fun;;
*)bot_gen;;
esac
}
