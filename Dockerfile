# 使用官方 Node 运行环境
FROM node:20-slim

# 设置工作目录
WORKDIR /app

# 将项目文件复制进去
COPY package.json .
COPY index.js .
COPY start.sh .

# 安装依赖（如果 package.json 没有依赖，这步会很快）
RUN npm install || true

# 给 start.sh 权限
RUN chmod +x start.sh

# 暴露端口（index.js 默认是 3000）
EXPOSE 3000

# 容器启动时执行 Node 服务
CMD ["node", "index.js"]
