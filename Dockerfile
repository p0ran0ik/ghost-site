# Используем официальный образ nginx
FROM nginx:alpine

# Устанавливаем переменную окружения для директории сайта
ENV SITE_DIR=/root/site

# Создаем директорию для сайта
RUN mkdir -p $SITE_DIR

# Клонируем репозиторий с вашим сайтом
RUN git clone https://github.com/p0ran0ik/ghost-site $SITE_DIR

# Удаляем стандартную конфигурацию Nginx
RUN rm /etc/nginx/conf.d/default.conf

# Копируем нашу конфигурацию Nginx в контейнер
COPY nginx.conf /etc/nginx/conf.d/

# Открываем порт 80 для доступа к Nginx
EXPOSE 80

# Запускаем Nginx
CMD ["nginx", "-g", "daemon off;"]
