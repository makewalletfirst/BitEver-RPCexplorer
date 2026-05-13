# 1. Base 이미지 설정
FROM node:18-slim

# 2. 작업 디렉토리 설정
WORKDIR /app

# 3. 필수 패키지 설치 (git 추가)
# slim 이미지에는 git이 없으므로, npm install 시 git 의존성이 있는 패키지를 위해 설치가 필요합니다.
RUN apt-get update && \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/*

# 4. npm 설정 최적화
RUN npm config set fetch-retries 5
RUN npm config set fetch-retry-mintimeout 20000

# 5. 의존성 파일 복사 및 설치
COPY package*.json ./

# progress bar를 끄면 빌드 속도가 약간 더 빨라집니다.
RUN npm install --omit=dev --no-audit --progress=false

# 6. 소스 코드 복사
COPY . .

# 7. 앱 실행 (기존 설정에 맞춰 포트 및 실행 명령어를 확인해 주세요)
EXPOSE 3000
CMD ["node", "app.js"]
