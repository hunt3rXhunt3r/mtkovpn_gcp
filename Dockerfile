# Gamit ang official at lightweight na CoreDNS image
FROM coredns/coredns:latest

# I-copy ang config file sa loob ng container
COPY Corefile /Corefile

# Port 8080 ang default port para sa Google Cloud Run
EXPOSE 8080

# Command para patakbuhin ang DNS server
ENTRYPOINT ["/coredns", "-conf", "/Corefile"]
