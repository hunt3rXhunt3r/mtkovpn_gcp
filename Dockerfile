FROM nginx:alpine
# I-set ang IP ng sarili mong server dito
ENV MY_SERVER_IP="202.1xx.xxx.xx" 
# I-configure ang Nginx para i-point ang traffic sa server mo
RUN echo 'server { \
    listen 8080; \
    location / { \
        proxy_pass http://'$MY_SERVER_IP':1194; \
        proxy_http_version 1.1; \
        proxy_set_header Upgrade $http_upgrade; \
        proxy_set_header Connection "upgrade"; \
    } \
}' > /etc/nginx/conf.d/default.conf

EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
