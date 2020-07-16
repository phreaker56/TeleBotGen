#!/bin/bash
echo ""
echo "========================"
echo "creando archivo swap"
sudo dd if=/dev/zero of=/swapfile bs=1MB count=2048
echo "========================"
sleep 3
echo "comprovando tamaño del archivo"
ls -hl /swapfile
echo "========================"
sleep 3
echo "asignando permisos"
chmod 600 /swapfile
echo "========================"
sleep 3
echo "dando formato al achivo"
mkswap /swapfile
echo "========================"
sleep 3
echo "Activando"
swapon /swapfile
echo "========================"
sleep 3
echo "activado permanente"
echo "/swapfile none swap sw 0 0" >> /etc/fstab
echo "========================"
sleep 3
echo "prioridad permanente"
echo "vm.swappiness=20" >> /etc/sysctl.conf
echo "========================"
sleep 3
