FROM nginx:alpine

# Direkta nating ilalagay ang IP mo dito
ENV SERVER_IP="13.212.5.11"

# Copy ang custom configuration ng Nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Papalitan nito ang 'TARGET_IP' sa loob ng nginx.conf mo
RUN sed -i "s/TARGET_IP/$SERVER_IP/g" /etc/nginx/conf.d/default.conf

EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
