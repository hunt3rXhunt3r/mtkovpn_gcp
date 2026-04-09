FROM nginx:alpine

# Pinapasa ang IP ng server mo habang nagbi-build
ARG SERVER_IP
ENV SERVER_IP=$SERVER_IP

# Copy ang custom configuration ng Nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Palitan ang placeholder sa config gamit ang totoong IP
RUN sed -i "s/TARGET_IP/$SERVER_IP/g" /etc/nginx/conf.d/default.conf

EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
