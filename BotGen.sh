#!/bin/bash

CIDdir=/etc/ADM-db && [[ ! -d ${CIDdir} ]] && mkdir ${CIDdir}
CID="${CIDdir}/User-ID" && [[ ! -e ${CID} ]] && echo > ${CID}
keytxt="${CIDdir}/keys" && [[ ! -d ${keytxt} ]] && mkdir ${keytxt}
[[ $(dpkg --get-selections|grep -w "jq"|head -1) ]] || apt-get install jq -y &>/dev/null
[[ ! -e "/bin/ShellBot.sh" ]] && wget -O /bin/ShellBot.sh https://raw.githubusercontent.com/rudi9999/TeleBotGen/master/ShellBot.sh &> /dev/null
[[ -e /etc/texto-bot ]] && rm /etc/texto-bot
LINE="==========================="

SRC="${CIDdir}/sources" && [[ ! -d ${SRC} ]] && mkdir ${SRC}
[[ ! -e "${SRC}/menu" ]] && wget -O ${SRC}/menu https://raw.githubusercontent.com/rudi9999/TeleBotGen/master/menu &> /dev/null
[[ ! -e "${SRC}/ayuda" ]] && wget -O ${SRC}/ayuda https://raw.githubusercontent.com/rudi9999/TeleBotGen/master/ayuda &> /dev/null
[[ ! -e "${SRC}/cache" ]] && wget -O ${SRC}/cache https://raw.githubusercontent.com/rudi9999/TeleBotGen/master/cache &> /dev/null
[[ ! -e "${SRC}/invalido" ]] && wget -O ${SRC}/invalido https://raw.githubusercontent.com/rudi9999/TeleBotGen/master/invalido &> /dev/null
[[ ! -e "${SRC}/status" ]] && wget -O ${SRC}/status https://raw.githubusercontent.com/rudi9999/TeleBotGen/master/status &> /dev/null
[[ ! -e "${SRC}/reinicio" ]] && wget -O ${SRC}/reinicio https://raw.githubusercontent.com/rudi9999/TeleBotGen/master/reinicio &> /dev/null
[[ ! -e "${SRC}/myip" ]] && wget -O ${SRC}/myip https://raw.githubusercontent.com/rudi9999/TeleBotGen/master/myip &> /dev/null
[[ ! -e "${SRC}/id" ]] && wget -O ${SRC}/id https://raw.githubusercontent.com/rudi9999/TeleBotGen/master/id &> /dev/null
[[ ! -e "${SRC}/back_ID" ]] && wget -O ${SRC}/back_ID https://raw.githubusercontent.com/rudi9999/TeleBotGen/master/back_ID &> /dev/null
[[ ! -e "${SRC}/link" ]] && wget -O ${SRC}/link https://raw.githubusercontent.com/rudi9999/TeleBotGen/master/link &> /dev/null
[[ ! -e "${SRC}/listID" ]] && wget -O ${SRC}/listID https://raw.githubusercontent.com/rudi9999/TeleBotGen/master/listID &> /dev/null
[[ ! -e "${SRC}/gerar_key" ]] && wget -O ${SRC}/gerar_key https://raw.githubusercontent.com/rudi9999/TeleBotGen/master/gerar_key &> /dev/null
[[ ! -e "${SRC}/power" ]] && wget -O ${SRC}/power https://raw.githubusercontent.com/rudi9999/TeleBotGen/master/power &> /dev/null
[[ ! -e "${SRC}/comandos" ]] && wget -O ${SRC}/comandos https://raw.githubusercontent.com/rudi9999/TeleBotGen/master/comandos &> /dev/null

# Importando API
source ShellBot.sh
source ${SRC}/menu
source ${SRC}/ayuda
source ${SRC}/cache
source ${SRC}/invalido
source ${SRC}/status
source ${SRC}/reinicio
source ${SRC}/myip
source ${SRC}/id
source ${SRC}/back_ID
source ${SRC}/link
source ${SRC}/listID
source ${SRC}/gerar_key
source ${SRC}/power
source ${SRC}/comandos

# Token del bot
bot_token="$(cat ${CIDdir}/token)"

# Inicializando el bot
ShellBot.init --token "$bot_token" --monitor --return map
ShellBot.username

download_file () {
# shellbot.sh editado linea 3986
user=User-ID
[[ -e ${CID} ]] && rm ${CID}
local file_id
          ShellBot.getFile --file_id ${message_document_file_id[$id]}
          ShellBot.downloadFile --file_path "${return[file_path]}" --dir "${CIDdir}"
local bot_retorno="ID user botgen\n"
		bot_retorno+="$LINE\n"
		bot_retorno+="Se restauro con exito!!\n"
		bot_retorno+="$LINE\n"
		bot_retorno+="${return[file_path]}\n"
		bot_retorno+="$LINE"
			ShellBot.sendMessage	--chat_id "${message_chat_id[$id]}" \
									--reply_to_message_id "${message_message_id[$id]}" \
									--text "<i>$(echo -e $bot_retorno)</i>" \
									--parse_mode html
return 0
}

msj_add () {
	      ShellBot.sendMessage --chat_id ${1} \
							--text "<i>$(echo -e $bot_retor)</i>" \
							--parse_mode html
}

upfile_fun () {
          ShellBot.sendDocument --chat_id ${message_chat_id[$id]}  \
                             --document @${1}
}

invalido_fun () {
local bot_retorno="$LINE\n"
         bot_retorno+="Comando invalido!\n"
         bot_retorno+="$LINE\n"
	     ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
							--text "<i>$(echo -e $bot_retorno)</i>" \
							--parse_mode html
	return 0	
}

msj_fun () {
	      ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
							--text "<i>$(echo -e $bot_retorno)</i>" \
							--parse_mode html
	return 0
}

# Ejecutando escucha del bot
while true; do
    ShellBot.getUpdates --limit 100 --offset $(ShellBot.OffsetNext) --timeout 30
    for id in $(ShellBot.ListUpdates); do
	    chatuser="$(echo ${message_chat_id[$id]}|cut -d'-' -f2)"
	    echo $chatuser >&2
	    comando=(${message_text[$id]})
	    [[ ! -e "${CIDdir}/Admin-ID" ]] && echo "null" > ${CIDdir}/Admin-ID
	    permited=$(cat ${CIDdir}/Admin-ID)
	    comand
    done
done
