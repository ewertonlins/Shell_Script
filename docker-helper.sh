#!/bin/bash

while true; do
  echo "===== DOCKER HELPER MENU ====="
  echo "1. Listar containers (ativos e inativos)"
  echo "2. Ver logs de um container"
  echo "3. Remover containers parados"
  echo "4. Remover imagens não utilizadas"
  echo "5. Ver uso de disco pelo Docker"
  echo "6. Reiniciar um container"
  echo "7. Acessar terminal de um container"
  echo "0. Sair"
  echo "==============================="
  read -p "Escolha uma opção: " opcao

  case $opcao in
    1)
     sudo docker ps -a
      ;;
    2)
      read -p "Nome ou ID do container: " cid
     sudo docker logs -f $cid
      ;;
    3)
	sudo docker container prune -f
      ;;
    4)
      sudo docker image prune -a -f
      ;;
    5)
      sudo docker system df
      ;;
    6)
      read -p "Nome ou ID do container: " cid
      sudo docker restart $cid
      ;;
    7)
      read -p "Nome ou ID do container: " cid
      sudo docker exec -it $cid /bin/bash
      ;;
    0)
      echo "Saindo..."
      break
      ;;
    *)
      echo "❌ Opção Inválida!"
      ;;
  esac

  echo
  read -p "Pressione Enter para continuar..."
done
