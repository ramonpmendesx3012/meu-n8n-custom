# Usa a imagem oficial do n8n como base
FROM n8nio/n8n:latest

# Muda para usuário root para ter permissão de instalar pacotes
USER root

# Instala as bibliotecas necessárias globalmente
RUN npm install -g jimp jsqr

# Define a variável de ambiente para permitir o uso delas
ENV NODE_FUNCTION_ALLOW_EXTERNAL=jimp,jsqr

# Volta para o usuário padrão do n8n (segurança)
USER node