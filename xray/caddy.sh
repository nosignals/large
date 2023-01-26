#!/bin/bash
REPO="https://raw.githubusercontent.com/inoyaksorojawi/large/sae/"

curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg --yes  >/dev/null 2>&1
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list  >/dev/null 2>&1
sudo apt install caddy

### Tambah konfigurasi Caddy
function caddy(){
    mkdir -p /etc/caddy
    wget -O /etc/caddy/vmess "${REPO}caddy/vmess" >/dev/null 2>&1
    wget -O /etc/caddy/vless "${REPO}caddy/vless" >/dev/null 2>&1
    wget -O /etc/caddy/trojan "${REPO}caddy/trojan" >/dev/null 2>&1
    wget -O /etc/caddy/ss2022 "${REPO}caddy/ss2022" >/dev/null 2>&1
    wget -O /etc/caddy/socks "${REPO}caddy/socks" >/dev/null 2>&1
    wget -O /etc/caddy/ss "${REPO}caddy/ss" >/dev/null 2>&1
    cat >/etc/caddy/Caddyfile <<-EOF
$domain:443
{
    tls djarumpentol01@gmail.com
    encode gzip

    handle_path /WISNU {
        reverse_proxy localhost:6001

    }

    import vmess
    handle_path /SHANUM {
        reverse_proxy localhost:6002
    }

    handle_path /GANDRING {
        reverse_proxy localhost:6000
    }

    handle_path /GANDRING-WS {
        reverse_proxy localhost:6003
    }
    handle_path /WISNU-WS {
        reverse_proxy localhost:6004
    }
    handle_path /BEKTI-WS {
        reverse_proxy localhost:6066
    }

    handle {
        reverse_proxy https://$domain {
            trusted_proxies 0.0.0.0/0
            header_up Host {upstream_hostport}
        }
    }
}
EOF
}

caddy
systemctl stop caddy
systemctl enable --now caddy
