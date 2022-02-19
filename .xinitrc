export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS=@im=fcitx5

[[ -f ~/.Xmodmap  ]] && xmodmap ~/.Xmodmap
[[ -f ~/.Xresources  ]] && xrdb ~/.Xresources

exec startxfce4
