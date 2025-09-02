#!/bin/bash

sudo apt-get update

DOWNLOAD_PATH=$HOME/Downloads/tmp
mkdir -p $DOWNLOAD_PATH

gdbus call --session --dest org.gnome.Shell.Extensions --object-path /org/gnome/Shell/Extensions --method org.gnome.Shell.Extensions.InstallRemoteExtension "AlphabeticalAppGrid@stuarthayhurst"
gdbus call --session --dest org.gnome.Shell.Extensions --object-path /org/gnome/Shell/Extensions --method org.gnome.Shell.Extensions.InstallRemoteExtension "Always-Show-Titles-In-Overview@gmail.com"
gdbus call --session --dest org.gnome.Shell.Extensions --object-path /org/gnome/Shell/Extensions --method org.gnome.Shell.Extensions.InstallRemoteExtension "appindicatorsupport@rgcjonas.gmail.com"
gdbus call --session --dest org.gnome.Shell.Extensions --object-path /org/gnome/Shell/Extensions --method org.gnome.Shell.Extensions.InstallRemoteExtension "batterytimepercentagecompact@sagrland.de"
gdbus call --session --dest org.gnome.Shell.Extensions --object-path /org/gnome/Shell/Extensions --method org.gnome.Shell.Extensions.InstallRemoteExtension "caffeine@patapon.info"
gdbus call --session --dest org.gnome.Shell.Extensions --object-path /org/gnome/Shell/Extensions --method org.gnome.Shell.Extensions.InstallRemoteExtension "dash-to-panel@jderose9.github.com"
gdbus call --session --dest org.gnome.Shell.Extensions --object-path /org/gnome/Shell/Extensions --method org.gnome.Shell.Extensions.InstallRemoteExtension "mediacontrols@cliffniff.github.com"
gdbus call --session --dest org.gnome.Shell.Extensions --object-path /org/gnome/Shell/Extensions --method org.gnome.Shell.Extensions.InstallRemoteExtension "tiling-assistant@leleat-on-github"
gdbus call --session --dest org.gnome.Shell.Extensions --object-path /org/gnome/Shell/Extensions --method org.gnome.Shell.Extensions.InstallRemoteExtension "mute-unmute@mcast.gnomext.com"
gdbus call --session --dest org.gnome.Shell.Extensions --object-path /org/gnome/Shell/Extensions --method org.gnome.Shell.Extensions.InstallRemoteExtension "tilingshell@ferrarodomenico.com"
gdbus call --session --dest org.gnome.Shell.Extensions --object-path /org/gnome/Shell/Extensions --method org.gnome.Shell.Extensions.InstallRemoteExtension "Vitals@CoreCoding.com"
gdbus call --session --dest org.gnome.Shell.Extensions --object-path /org/gnome/Shell/Extensions --method org.gnome.Shell.Extensions.InstallRemoteExtension "BingWallpaper@ineffable-gmail.com"
gdbus call --session --dest org.gnome.Shell.Extensions --object-path /org/gnome/Shell/Extensions --method org.gnome.Shell.Extensions.InstallRemoteExtension "just-perfection-desktop@just-perfection"

echo "Press any key to continue..."
read -n 1 -s -r
echo "Continuing..."

sleep 30

# tray icons
dconf write /org/gnome/shell/extensions/appindicator/tray-pos "'left'"

gsettings set org.gnome.desktop.app-folders folder-children "[]"

#panel customizations
monitor=`dconf read /org/gnome/shell/extensions/dash-to-panel/primary-monitor`
monitor_clean="${monitor//\'/}"
dconf write /org/gnome/shell/extensions/dash-to-panel/panel-positions "'{\"$monitor_clean\":\"TOP\"}'"
dconf write /org/gnome/shell/extensions/dash-to-panel/panel-sizes "'{\"$monitor_clean\":48}'"
dconf write /org/gnome/shell/extensions/dash-to-panel/panel-element-positions "'{\"$monitor_clean\":[{\"element\":\"showAppsButton\",\"visible\":false,\"position\":\"stackedTL\"},{\"element\":\"taskbar\",\"visible\":true,\"position\":\"stackedTL\"},{\"element\":\"centerBox\",\"visible\":true,\"position\":\"stackedBR\"},{\"element\":\"rightBox\",\"visible\":true,\"position\":\"stackedBR\"},{\"element\":\"leftBox\",\"visible\":true,\"position\":\"stackedBR\"},{\"element\":\"systemMenu\",\"visible\":true,\"position\":\"stackedBR\"},{\"element\":\"dateMenu\",\"visible\":true,\"position\":\"stackedBR\"},{\"element\":\"activitiesButton\",\"visible\":true,\"position\":\"stackedTL\"},{\"element\":\"desktopButton\",\"visible\":false,\"position\":\"stackedBR\"}],\"GSM-506TFSS0L142\":[{\"element\":\"showAppsButton\",\"visible\":false,\"position\":\"stackedTL\"},{\"element\":\"taskbar\",\"visible\":true,\"position\":\"stackedTL\"},{\"element\":\"centerBox\",\"visible\":true,\"position\":\"stackedBR\"},{\"element\":\"rightBox\",\"visible\":true,\"position\":\"stackedBR\"},{\"element\":\"leftBox\",\"visible\":true,\"position\":\"stackedBR\"},{\"element\":\"systemMenu\",\"visible\":true,\"position\":\"stackedBR\"},{\"element\":\"dateMenu\",\"visible\":true,\"position\":\"stackedBR\"},{\"element\":\"activitiesButton\",\"visible\":true,\"position\":\"stackedTL\"},{\"element\":\"desktopButton\",\"visible\":false,\"position\":\"stackedBR\"}]}'"
dconf write /org/gnome/shell/extensions/dash-to-panel/multi-monitors false
dconf write /org/gnome/shell/extensions/dash-to-panel/appicon-margin 4
dconf write /org/gnome/shell/extensions/dash-to-panel/appicon-padding 5
dconf write /org/gnome/shell/extensions/dash-to-panel/trans-dynamic-anim-target 0.95000000000000007
dconf write /org/gnome/shell/extensions/dash-to-panel/trans-panel-opacity 0.59999999999999998
dconf write /org/gnome/shell/extensions/dash-to-panel/trans-use-custom-opacity true
dconf write /org/gnome/shell/extensions/dash-to-panel/trans-use-dynamic-opacity true
dconf write /org/gnome/shell/extensions/dash-to-panel/tray-padding -1
dconf write /org/gnome/shell/extensions/dash-to-panel/tray-size 0
dconf write /org/gnome/shell/extensions/dash-to-panel/window-preview-title-position "'TOP'"
dconf write /org/gnome/shell/extensions/dash-to-panel/click-action "'TOGGLE-SHOWPREVIEW'"
dconf write /org/gnome/shell/extensions/dash-to-panel/dot-style-focused "'SEGMENTED'"
dconf write /org/gnome/shell/extensions/dash-to-panel/dot-style-unfocused "'SEGMENTED'"
dconf write /org/gnome/shell/extensions/dash-to-panel/dot-color-dominant true
dconf write /org/gnome/shell/extensions/dash-to-panel/focus-highlight-dominant true
dconf write /org/gnome/shell/extensions/dash-to-panel/dot-color-override false
dconf write /org/gnome/shell/extensions/dash-to-panel/dot-color-unfocused-different false
dconf write /org/gnome/shell/extensions/dash-to-panel/dot-position "'TOP'"
dconf write /org/gnome/shell/extensions/dash-to-panel/dot-size 3
dconf reset -f /org/gnome/desktop/app-folders/

# tiling customizations
dconf write /org/gnome/shell/extensions/tilingshell/show-indicator false
dconf write /org/gnome/shell/extensions/tilingshell/active-screen-edges false
dconf write /org/gnome/shell/extensions/tilingshell/enable-screen-edges-windows-suggestions false
dconf write /org/gnome/shell/extensions/tilingshell/enable-snap-assist true
dconf write /org/gnome/shell/extensions/tilingshell/enable-snap-assistant-windows-suggestions false
dconf write /org/gnome/shell/extensions/tilingshell/enable-tiling-system-windows-suggestions false
dconf write /org/gnome/shell/extensions/tilingshell/layouts-json "'[{\"id\":\"Layout 4\",\"tiles\":[{\"x\":0,\"y\":0,\"width\":0.67,\"height\":1,\"groups\":[1]},{\"x\":0.67,\"y\":0,\"width\":0.33,\"height\":1,\"groups\":[1]}]},{\"id\":\"30233458\",\"tiles\":[{\"x\":0,\"y\":0,\"width\":0.5,\"height\":1,\"groups\":[1]},{\"x\":0.5,\"y\":0,\"width\":0.49999999999999944,\"height\":1,\"groups\":[1]}]},{\"id\":\"30256698\",\"tiles\":[{\"x\":0.5,\"y\":0,\"width\":0.49999999999999967,\"height\":0.5,\"groups\":[4,1]},{\"x\":0,\"y\":0,\"width\":0.5,\"height\":0.5,\"groups\":[1,3]},{\"x\":0,\"y\":0.5,\"width\":0.5,\"height\":0.4999999999999999,\"groups\":[3,1]},{\"x\":0.5,\"y\":0.5,\"width\":0.49999999999999967,\"height\":0.4999999999999999,\"groups\":[4,1]}]},{\"id\":\"30463913\",\"tiles\":[{\"x\":0,\"y\":0,\"width\":0.5,\"height\":1,\"groups\":[1]},{\"x\":0.5,\"y\":0,\"width\":0.5000000000000006,\"height\":0.5,\"groups\":[2,1]},{\"x\":0.5,\"y\":0.5,\"width\":0.5000000000000006,\"height\":0.5,\"groups\":[2,1]}]}]'"
dconf write /org/gnome/shell/extensions/tilingshell/outer-gaps 'uint32 0'
dconf write /org/gnome/shell/extensions/tilingshell/inner-gaps 'uint32 0'

# shell custo
dconf write /org/gnome/shell/extensions/just-perfection/notification-banner-position 2

# app indicator customizations
dconf write /org/gnome/shell/extensions/appindicator/icon-size 22
dconf write /org/gnome/shell/extensions/mediacontrols/extension-index 'uint32 0'
dconf write /org/gnome/shell/extensions/mediacontrols/show-player-icon false
dconf write /org/gnome/shell/extensions/mediacontrols/show-control-icons-seek-backward false
dconf write /org/gnome/shell/extensions/mediacontrols/show-control-icons-seek-forward false

# vitals customizations
dconf write /org/gnome/shell/extensions/vitals/use-higher-precision true
dconf write /org/gnome/shell/extensions/vitals/hot-sensors "['_processor_usage_', '_memory_usage_', '__network-rx_max__', '__network-tx_max__']"

# caffine customizations
dconf write /org/gnome/shell/extensions/caffeine/show-indicator "'always'"
dconf write /org/gnome/shell/extensions/caffeine/enable-mpris true

# jb font
wget https://github.com/howzitcal/morbian/raw/refs/heads/main/assets/jetbrains-fonts.tar -O $DOWNLOAD_PATH/jetbrains-fonts.tar
sudo tar -xf $DOWNLOAD_PATH/jetbrains-fonts.tar -C /usr/share/fonts/truetype/ --wildcards "*.ttf"
fc-cache -f

# gnome customizations
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'
gsettings set org.gnome.desktop.interface accent-color 'blue' #future
gsettings set org.gnome.desktop.interface enable-hot-corners true
gsettings set org.gnome.desktop.interface monospace-font-name 'Jetbrains Mono 13'
gsettings set org.gnome.desktop.notifications show-in-lock-screen true
gsettings set org.gnome.desktop.sound allow-volume-above-100-percent true
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"
gsettings set org.gnome.desktop.interface clock-show-seconds true

sudo apt-get upgrade -yq

sudo apt-get install -yq papirus-icon-theme printer-driver-all gir1.2-gmenu-3.0 gnome-software-plugin-flatpak htop gnome-shell-extension-manager tilix gnome-tweaks gnome-shell-pomodoro kooha vlc
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

sudo apt remove -yq gnome-terminal gnome-console ptyxis totem

# add dark mode support for flatpaks
flatpak install --noninteractive -y org.gtk.Gtk3theme.Adwaita-dark
sudo flatpak override --env=GTK_THEME=Adwaita-dark

# screen record software
# flatpak install --noninteractive -y flathub io.github.seadve.Kooha

# INSTALL: Google Chrome
wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O $DOWNLOAD_PATH/chrome.deb
sudo apt-get install -yq $DOWNLOAD_PATH/chrome.deb

# pinned apps
gsettings set org.gnome.shell favorite-apps "['google-chrome.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Software.desktop']"

# hide bing icon
dconf write /org/gnome/shell/extensions/bingwallpaper/hide true

# terminal shortcut
name="tilix"
binding="<Ctrl><Alt>t"
action="/usr/bin/tilix"
media_keys=org.gnome.settings-daemon.plugins.media-keys
custom_kbd=org.gnome.settings-daemon.plugins.media-keys.custom-keybinding
kbd_path=/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/$name/
new_bindings=`gsettings get $media_keys custom-keybindings | sed -e"s>'\]>','$kbd_path']>"| sed -e"s>@as \[\]>['$kbd_path']>"`
gsettings set $media_keys custom-keybindings "$new_bindings"
gsettings set $custom_kbd:$kbd_path name $name
gsettings set $custom_kbd:$kbd_path binding $binding
gsettings set $custom_kbd:$kbd_path command $action

# screen record
name="kooha"
binding="<Super><Shift>r"
action="/usr/bin/kooha"
media_keys=org.gnome.settings-daemon.plugins.media-keys
custom_kbd=org.gnome.settings-daemon.plugins.media-keys.custom-keybinding
kbd_path=/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/$name/
new_bindings=`gsettings get $media_keys custom-keybindings | sed -e"s>'\]>','$kbd_path']>"| sed -e"s>@as \[\]>['$kbd_path']>"`
gsettings set $media_keys custom-keybindings "$new_bindings"
gsettings set $custom_kbd:$kbd_path name $name
gsettings set $custom_kbd:$kbd_path binding $binding
gsettings set $custom_kbd:$kbd_path command $action

# screen shot
name="screenshot"
binding="<Super><Shift>s"
action="/usr/bin/gnome-screenshot -a"
media_keys="org.gnome.settings-daemon.plugins.media-keys"
custom_kbd="org.gnome.settings-daemon.plugins.media-keys.custom-keybinding"
kbd_path="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/$name/"
new_bindings=$(gsettings get $media_keys custom-keybindings | sed -e "s>'\]>','$kbd_path']>" | sed -e "s>@as \[\]>['$kbd_path']>")
gsettings set $media_keys custom-keybindings "$new_bindings"
gsettings set $custom_kbd:$kbd_path name "$name"
gsettings set $custom_kbd:$kbd_path binding "$binding"
gsettings set $custom_kbd:$kbd_path command "$action"


# tilix fix
dconf write /com/gexperts/Tilix/profiles/2b7c4080-0ddd-46c5-8f23-563fd3ba789d/login-shell true


sudo apt-get autoremove -yq
rm -rf $DOWNLOAD_PATH

touch $HOME/.morbian
echo 1 > $HOME/.morbian

# reset gnome
gnome-shell --replace 

# clear
echo "it's Morbian time!"
