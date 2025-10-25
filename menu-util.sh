#!/bin/bash
# Funções
atualizar_pacotes() {
    echo " Atualizar pacotes."
    sudo apt update
    sudo apt list --upgradable
    sudo apt upgrade --simulate

}
ver_kernel() {
    echo " Kernel atual:"
    uname -r
}
ver_data() {
    echo " Data-Hora atual: "
    date
}
ver_hostname() {
    echo "Hostname: "
    hostname
}
buscar_logs() {
   echo "🔍 Procurar erros no syslog "
    grep -i "error" /var/log/syslog | awk '{print $1, $2, $3, $5}' | sed 's/\[//g' | head -n 10
}
uso_disco () {
    echo " Verificar uso do disco: "
    df -h | awk '{print $1, $5}'
}
# Loop do menu
    while true;  do
    clear
    echo "================================="
    echo "      🧭 MENU DE ADMIN LINUX     "
    echo "================================="
    echo "1) Atualizar pacotes"
    echo "2) Ver versão do Kernel"
    echo "3) Mostrar data/hora"
    echo "4) Ver hostname"
    echo "5) Buscar erros em logs"
    echo "6) Uso do disco"
    echo "0) Sair"
    echo "---------------------------------"
    read -p " Escolha uma opção: " opcao

case $opcao in
    1) atualizar_pacotes ;;
    2) ver_kernel ;;
    3) ver_data ;;
    4) ver_hostname ;;
    5) buscar_logs ;;
    6) uso_disco ;;
    0) echo " A sair..."; exit 0 ;;
    *)  echo "❌ Opção inválida!" ;;
esac

echo
read -p "Pressione Enter para continuar..."
done