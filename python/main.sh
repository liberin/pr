#!/bin/bash
export PATH="~/nginx/sbin:~/${REPL_SLUG}/python:$PATH"
green(){ echo -e "\033[32m\033[01m$1\033[0m";}
yellow(){ echo -e "\033[33m\033[01m$1\033[0m";}
blue(){ echo -e "\033[36m\033[01m$1\033[0m";}
chmod a+x ./python/nginx.sh
./python/nginx.sh
uuid=$(grep -oE -m1 '[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}' /tmp/config.json)
echo
green "========================================="
echo
blue "Установлен! Нажмите на белую веб-ссылку ниже, чтобы просмотреть соответствующую информацию о настройках клиентов."
echo 
echo "https://${REPL_SLUG}.${REPL_OWNER}.repl.co/$uuid.html" 
echo "или"
echo "http://${REPL_SLUG}.${REPL_OWNER}.repl.co/$uuid.html" 
echo
yellow "
видеоурок：https://www.youtube.com/@ygkkk
блог：https://ygkkk.blogspot.com"
echo
while true; do curl -s --user-agent "${UA_Browser}" "https://${REPL_SLUG}.${REPL_OWNER}.repl.co" >/dev/null 2>&1 && echo "$(date +'%Y%m%d%H%M%S') активен ..."; sleep 600; done &
./python/$(cat ./python/xr.log) -c /tmp/config.json >/dev/null 2>&1 &
./nginx/sbin/nginx -g 'daemon off;'
tail -f
