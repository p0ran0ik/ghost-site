FROM nginx:latest

# Установите рабочий каталог
WORKDIR /root/site

# Скопируйте файлы из репозитория в контейнер
COPY . /root/site

# Экспонировать порт 80
EXPOSE 80

# Настройте nginx
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/

# Запустите nginx
CMD ["nginx", "-g", "daemon off;"]
