export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

[[ -f ~/.Xmodmap  ]] && xmodmap ~/.Xmodmap
[[ -f ~/.Xresources  ]] && xrdb ~/.Xresources

exec startxfce4
