for site in `cat tmr-hosted-domains.txt`; do /opt/google/chrome/chrome --headless --disable-gpu --screenshot https://${site} && mv screenshot.png ${site}.png; done

