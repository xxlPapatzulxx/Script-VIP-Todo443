#!/bin/bash
ns_domain_cloudflare() {
	DOMAIN="jerrysbg.com"
	DOMAIN_PATH=$(cat /etc/xray/domain)
	SUB=$(tr -cd 'a-z0-9' < /dev/urandom | fold -w 4 | head -n 1)
	SUB_DOMAIN=${SUB}".jerrysbg.com"
	NS_DOMAIN=sbg.${SUB_DOMAIN}
	CF_ID=pl.ayhackbins@gmail.com
        CF_KEY=54235f28506964af3fa4e8c2be734f50b11ed
	set -euo pipefail
	IP=$(wget -qO- ipinfo.io/ip)
	echo "Updating DNS NS for ${NS_DOMAIN}..."
	ZONE=$(
		curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAIN}&status=active" \
		-H "X-Auth-Email: ${CF_ID}" \
		-H "X-Auth-Key: ${CF_KEY}" \
		-H "Content-Type: application/json" | jq -r .result[0].id
	)

	RECORD=$(
		curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=${NS_DOMAIN}" \
		-H "X-Auth-Email: ${CF_ID}" \
		-H "X-Auth-Key: ${CF_KEY}" \
		-H "Content-Type: application/json" | jq -r .result[0].id
	)

	if [[ "${#RECORD}" -le 10 ]]; then
		RECORD=$(
			curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
			-H "X-Auth-Email: ${CF_ID}" \
			-H "X-Auth-Key: ${CF_KEY}" \
			-H "Content-Type: application/json" \
			--data '{"type":"NS","name":"'${NS_DOMAIN}'","content":"'${DOMAIN_PATH}'","proxied":false}' | jq -r .result.id
		)
	fi

	RESULT=$(
		curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
		-H "X-Auth-Email: ${CF_ID}" \
		-H "X-Auth-Key: ${CF_KEY}" \
		-H "Content-Type: application/json" \
		--data '{"type":"NS","name":"'${NS_DOMAIN}'","content":"'${DOMAIN_PATH}'","proxied":false}'
	)
	echo $NS_DOMAIN >/etc/xray/dns
}

setup_dnstt() {
	cd
	mkdir -p /etc/slowdns
	wget -O dnstt-server "https://raw.githubusercontent.com/JerrySBG/SBG/main/slowdns/dnstt-server" >/dev/null 2>&1
	chmod +x dnstt-server >/dev/null 2>&1
	wget -O dnstt-client "https://raw.githubusercontent.com/JerrySBG/SBG/main/slowdns/dnstt-client" >/dev/null 2>&1
	chmod +x dnstt-client >/dev/null 2>&1
	./dnstt-server -gen-key -privkey-file server.key -pubkey-file server.pub
	chmod +x *
	mv * /etc/slowdns
	wget -O /etc/systemd/system/client.service "https://raw.githubusercontent.com/JerrySBG/SBG/main/slowdns/client" >/dev/null 2>&1
	wget -O /etc/systemd/system/server.service "https://raw.githubusercontent.com/JerrySBG/SBG/main/slowdns/server" >/dev/null 2>&1
	sed -i "s/xxxx/$NS_DOMAIN/g" /etc/systemd/system/client.service 
	sed -i "s/xxxx/$NS_DOMAIN/g" /etc/systemd/system/server.service 
}
ns_domain_cloudflare
setup_dnstt
systemctl daemon-reload
systemctl enable client
systemctl enable server
systemctl start client
systemctl start server
systemctl restart client
systemctl restart server
#install slowdns
sudo apt install squid -y
#configurando Key
echo "\e[1;32m Generando nueva clave"
cd /etc/slowdns
rm -rf server.key server.pub
./dnstt-server -gen-key -privkey-file server.key -pubkey-file server.pub
echo -e "\e[1;32m FINALIZANDO..."
#setting IPtables
#iptables -I INPUT -p udp --dport 5300 -j ACCEPT
#iptables -t nat -I PREROUTING -p udp --dport 53 -j REDIRECT --to-ports 5300
#netfilter-persistent save
#netfilter-persistent reload

#iptables -t nat -A PREROUTING -p tcp --dport 1:8443 -j DNAT --to-destination :5300
iptables -t nat -D PREROUTING -i venet0 -p tcp --dport 1:8443 -j DNAT --to-destination :5300
iptables-save > /etc/iptables/rules.v4
./startdns
clear
#exit