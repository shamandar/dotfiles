#!/bin/sh

##  [x] Sudoer
        # COMMENT-OUT LINES "Defaults targetpw" and "ALL ALL=(ALL) ALL"
        # ADD LINE "%wheel ALL=(ALL) /usr/bin/zypper, /usr/bin/rpm, /usr/sbin/shutdown"
##  [x] NTP Configuration
        # Start NTP Daemon: Now and on Boot
        # Synchronization Servers: time.nrc.ca
        # Synchronization Servers: time.chu.nrc.ca
##  [x] Network Settings (DNS)
        # Static Hostname: darkstar
        # Set Hostname vis DHCP: no
        # Custom Policy Rule: STATIC (no FALLBACK)
        # Name Server 1: 149.112.121.10     # private.canadianshield.cira.ca
        # Name Server 2: 149.112.122.10     # private.canadianshield.cira.ca

##  [x] Audio
##      [x] Disable pulseaudio
##      [x] Install pipewire
sudo zypper remove --clean-deps pulseaudio
sudo zypper addlock pulseaudio pavucontrol

##  [x] NVidia repository and driver
##      Key Fingerprint: 9B763D49 D8A5C892 FC178BAC F5113243 C66B6EAE
##      [x] Disable Mesa-dri-nouveau
##      [x] Install nvidia driver
sudo zypper remove --clean-deps Mesa-dri-nouveau
sudo zypper addlock Mesa-dri-nouveau xf86-video-nouveau
sudo zypper addrepo --refresh 'https://download.nvidia.com/opensuse/leap/${releasever}/' NVIDIA
sudo zypper install --no-recommends x11-video-nvidiaG05 nvidia-glG05 Mesa-demo-x
#sudo shutdown -r now

##  [x] Packman repositories
##      Key Fingerprint:  F8875B88 0D518B6B 8C530D13 45A1D067 1ABD1AFB
sudo zypper addrepo --check --refresh --priority 90 'https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Leap_${releasever}/Essentials' packman-essentials
sudo zypper addrepo --check --refresh --priority 90 'https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Leap_${releasever}/Multimedia' packman-multimedia
sudo zypper addrepo --check --refresh --priority 90 'https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Leap_${releasever}/Extra' packman-extra

##  [x] VLC repository (and vendor change)
##      Key Fingerprint: BC8D780D E3308581 B2E07085 33DE8FB7 C8DA93D2
##      [x] Install VLC and codecs
sudo zypper addrepo --refresh 'https://download.videolan.org/SuSE/${releasever}' VLC
sudo zypper install --no-recommends vlc vlc-codecs libdvdcss2

##  [x] Un-install LANG packages
rpm -qa | grep -- "-lang" | xargs sudo rpm -e

##  [x] Un-install unused packages
unused_packages="
    PackageKit
    PackageKit-gstreamer-plugin
    gnome-online-accounts
    libgnomesu
    libroffice
    mutter
    polkit
    postfix
    screen
"
sudo zypper rm --clean-deps ${unused_packages}

##  [x] Install LightDM before removing GNOME Display Manager
sudo zypper install --no-recommends lightdm
sudo zypper rm --clean-deps gdm

##  [x] Useful Development Tools
devtools="
    fd
    git
    patch
    ripgrep
    ghc
    ghc-xmonad
    ghc-xmonad-devel
    ghc-xmonad-contrib
    ghc-xmonad-contrib-devel
    xmonad
    dmenu
    twm
    google-inconsolata-fonts
    xlsfonts
    qiv
    evince
    evince-plugin-pdfdocument
    memtest86+
    htop
    chromium
    noto-coloremoji-fonts
    flac
    sox
    dvdbackup
"
sudo zypper install --no-recommends ${devtools}
