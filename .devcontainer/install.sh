#!/bin/sh

set -e

echo "📥 Downloading Xray Core v26.3.27..."
wget -O /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/download/v26.3.27/Xray-linux-64.zip

echo "📂 Installing Xray..."
unzip -o /tmp/xray.zip -d /tmp/xray_dist
chmod +x /tmp/xray_dist/xray
mv /tmp/xray_dist/xray /usr/local/bin/xray

echo "🧹 Cleaning up..."
rm -rf /tmp/xray.zip /tmp/xray_dist

# Generate random UUID
UUID=$(cat /proc/sys/kernel/random/uuid)
echo "🔑 Generated UUID: $UUID"

# Patch config.json with UUID
sed -i "s/__UUID__/$UUID/" /etc/config.json

echo "✅ Xray installed!"

# Write print-configs script
cat > /usr/local/bin/print-configs.sh << SCRIPT
#!/bin/sh
UUID=\$(grep -o '"id": *"[^"]*"' /etc/config.json | grep -o '[0-9a-f-]\{36\}')
SNI="\${CODESPACE_NAME}-443.app.github.dev"
IRAN_TIME=\$(TZ='Asia/Tehran' date +'%H:%M')

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🎮 G-Tunnel GAMING CONFIGS (XHTTP)"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "vless://\${UUID}@63.141.252.203:443?encryption=none&security=tls&type=xhttp&sni=\${SNI}&host=\${SNI}&path=%2F&mode=stream-up#G-Tunnel US1 - \${IRAN_TIME}"
echo ""
echo "vless://\${UUID}@142.54.178.211:443?encryption=none&security=tls&type=xhttp&sni=\${SNI}&host=\${SNI}&path=%2F&mode=stream-up#G-Tunnel US2 - \${IRAN_TIME}"
echo ""
echo "vless://\${UUID}@204.12.196.34:443?encryption=none&security=tls&type=xhttp&sni=\${SNI}&host=\${SNI}&path=%2F&mode=stream-up#G-Tunnel US3 - \${IRAN_TIME}"
echo ""
echo "vless://\${UUID}@50.7.87.2:443?encryption=none&security=tls&type=xhttp&sni=\${SNI}&host=\${SNI}&path=%2F&mode=stream-up#G-Tunnel DE1 - \${IRAN_TIME}"
echo ""
echo "vless://\${UUID}@50.7.87.5:443?encryption=none&security=tls&type=xhttp&sni=\${SNI}&host=\${SNI}&path=%2F&mode=stream-up#G-Tunnel DE2 - \${IRAN_TIME}"
echo ""
echo "vless://\${UUID}@50.7.87.4:443?encryption=none&security=tls&type=xhttp&sni=\${SNI}&host=\${SNI}&path=%2F&mode=stream-up#G-Tunnel DE3 - \${IRAN_TIME}"
echo ""
echo "vless://\${UUID}@138.201.54.122:443?encryption=none&security=tls&type=xhttp&sni=\${SNI}&host=\${SNI}&path=%2F&mode=stream-up#G-Tunnel DE4 - \${IRAN_TIME}"
echo ""
echo "vless://\${UUID}@94.130.50.12:443?encryption=none&security=tls&type=xhttp&sni=\${SNI}&host=\${SNI}&path=%2F&mode=stream-up#G-Tunnel DE5 - \${IRAN_TIME}"
echo ""
echo "vless://\${UUID}@94.130.13.19:443?encryption=none&security=tls&type=xhttp&sni=\${SNI}&host=\${SNI}&path=%2F&mode=stream-up#G-Tunnel DE6 - \${IRAN_TIME}"
echo ""
echo "vless://\${UUID}@50.7.87.3:443?encryption=none&security=tls&type=xhttp&sni=\${SNI}&host=\${SNI}&path=%2F&mode=stream-up#G-Tunnel DE7 - \${IRAN_TIME}"
echo ""
echo "vless://\${UUID}@85.10.207.48:443?encryption=none&security=tls&type=xhttp&sni=\${SNI}&host=\${SNI}&path=%2F&mode=stream-up#G-Tunnel DE8 - \${IRAN_TIME}"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
SCRIPT

chmod +x /usr/local/bin/print-configs.sh
