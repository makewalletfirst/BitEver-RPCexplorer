FROM node:18-slim
WORKDIR /app

# 네트워크 Stall 방지를 위해 npm 타임아웃 및 시도 횟수 설정
RUN npm config set fetch-retries 5
RUN npm config set fetch-retry-mintimeout 20000

COPY package*.json ./

# progress bar를 끄면 빌드 속도가 약간 더 빨라집니다.
RUN npm install --omit=dev --no-audit --progress=false

COPY . .
EXPOSE 3002
CMD ["npm", "start"]
