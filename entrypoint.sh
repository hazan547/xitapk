#!/bin/bash

# Inicia o banco de dados do Metasploit
service postgresql start

# Espera um pouco para o serviço iniciar
sleep 5

# Cria o banco de dados do Metasploit (se não existir)
msfdb init || true

# Inicia o console do Metasploit
msfconsole -r /root/.msf4/msfconsole.rc