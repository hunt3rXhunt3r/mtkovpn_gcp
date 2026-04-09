FROM alpine:latest
# Dito mo ilalagay ang IP o Domain na gagamitin ng proxy mo
ENV SERVER_DOMAIN="iyong-dns-dito.com"
ENV PORT=8080

# (Dito ilalagay ang installation ng xray/v2ray)
COPY config.json /etc/xray/config.json
# Pwede mong gamitin ang 'sed' para palitan ang domain sa config.json habang nagbu-build
RUN sed -i "s/MY_DOMAIN/$SERVER_DOMAIN/g" /etc/xray/config.json

CMD xray run -c /etc/xray/config.json
