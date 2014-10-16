alias goDown='cl /mnt/Downloads'
alias goFiles='cl /mnt/Files'
alias goProg='cl /mnt/Files/Programming'

alias update='sudo pacman -Syyu;sudo aura -Au --noconfirm'
alias vpn-restart='sudo systemctl restart openvpn@london'
alias vpn-stop='sudo systemctl stop openvpn@london'
alias vpn-start='sudo systemctl start openvpn@london'
alias clearUnused='sudo pacman -Rns $(pacman -Qqtd)'

alias eclimd='sh /usr/share/eclipse/eclimd'

cl()
{
cd "$@" && ls
}
