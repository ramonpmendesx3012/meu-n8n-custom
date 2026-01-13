# Usa a imagem oficial
FROM n8nio/n8n:latest

# Muda para root para ter permissão de escrita
USER root

# 1. Cria a pasta de configuração do n8n explicitamente
RUN mkdir -p /home/node/.n8n

# 2. Define ela como diretório de trabalho temporário
WORKDIR /home/node/.n8n

# 3. Instala as bibliotecas AQUI DENTRO (Removido o -g)
# Isso cria uma pasta node_modules dentro de /home/node/.n8n
RUN npm install jimp jsqr

# 4. Garante que o usuário 'node' seja dono desses arquivos
# (Sem isso, o n8n trava por erro de permissão ao iniciar)
RUN chown -R node:node /home/node/.n8n

# 5. Define a variável NODE_PATH para garantir que o Node ache os módulos
ENV NODE_PATH=/home/node/.n8n/node_modules

# Volta para o usuário padrão de segurança
USER node
