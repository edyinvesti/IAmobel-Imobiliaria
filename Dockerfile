FROM node:20-slim

WORKDIR /app

# Copiar dependências
COPY package*.json ./
RUN npm install

# Copiar código
COPY . .

# Variáveis de ambiente padrão
ENV PORT=3000
ENV NODE_ENV=production

# Compilar Next.js
RUN npm run build

# Expor portas (Web e Gateway)
EXPOSE 3000
EXPOSE 18789

# Comando para iniciar o servidor principal (que orquestra o hub e o gateway)
CMD ["node", "server/index.js"]
