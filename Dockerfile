# Sử dụng image Node.js để build ứng dụng
FROM node:18-alpine AS build

# Thiết lập thư mục làm việc
WORKDIR /app

# Sao chép file cấu hình package.json và cài đặt dependencies
COPY package.json package-lock.json ./
RUN npm install

# Sao chép toàn bộ mã nguồn và build ứng dụng
COPY . ./
RUN npm run build

# Sử dụng Nginx để phục vụ ứng dụng trong môi trường production
FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html

# Mở cổng 80
EXPOSE 80

# Khởi động Nginx
CMD ["nginx", "-g", "daemon off;"]
