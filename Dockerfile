# Simple static site served by nginx
FROM nginx:stable-alpine
COPY app /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
