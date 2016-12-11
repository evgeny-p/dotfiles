# Wait DE and override its setttings
# http://superuser.com/questions/644521/linux-mint-mate-use-xkbcomp-to-load-a-keyboard-layout-on-startup
sleep 5

xkbcomp ~/.config/xkb/personal $DISPLAY
