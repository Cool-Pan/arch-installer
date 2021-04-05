#!/usr/bin/env bash

#
# pkg-arch.sh
# @version: v12.0.0
#

# This color requires special attention from the user (显示此颜色需要特别注意).
green='\033[32m'
# This color is used to display the process of script execution (用于标示执行过程).
red='\033[31m'
# This color is used to display additional information. (备用颜色)
yellow='\033[33m'
# Color End Flag (结束标志).
reset='\033[0m'

echo -e "$green >>>>> Make sure that the \"multilib\" and \"archlinuxcn\" repositories are enabled before running this script. $reset"
echo -e "$green >>>>> 运行此脚本前，请确定已启用 \"multilib\" 和 \"archlinuxcn\" 仓库。 $reset"
sudo pacman -Syyuu

echo -e "$red >>>>> Start installation (开始安装). $reset"
sudo pacman -S $(echo '

##### Graphical (图形) #####
    # 显卡驱动
        # AMD 显卡
        AMDGPU="mesa xf86-video-amdgpu"
        # NVIDIA 显卡
        NVIDIA="nvidia-dkms nvidia-utils"
        # Vulkan
        Vulkan="vulkan-icd-loader amdvlk"
    # X Window 系统
        # Xorg 实现
        Xorg_Server="xorg-server xorg-xev"
        # 屏幕管理
        Screen_Manager="xorg-xrandr arandr"
    # 桌面环境
        # Xfce4 桌面
        XFCE_DE="xfce4 xfce4-clipman-plugin xfce4-datetime-plugin xfce4-notifyd xfce4-pulseaudio-plugin"
        # 显示管理器
        Display_Manager="lightdm lightdm-gtk-greeter"
        # 程序启动器
        APP_Launcher="rofi"
    # 字体
        # 拉丁与 CJK 字体                         [---------ArchCN--------]
        Latin_CJK_Font="noto-fonts noto-fonts-cjk nerd-fonts-jetbrains-mono"
        # 符号与表情
        Symbol_Emoji="noto-fonts-emoji ttf-joypixels"
    # 主题
        # 光标主题    [--ArchCN--]
        Cursor_Theme="vimix-cursors"
        # 图标主题
        Icon_Theme="papirus-icon-theme"
        # GTK2/3 主题   [------ArchCN------]
        GTK_XFWM_Theme="mojave-gtk-theme-git"
        # QT5 主题
        QT_Theme="kvantum-qt5 qt5ct"
        # GRUB2 主题
        GRUB_Theme="grub-theme-vimix"


##### Internet (互联网) #####
    # 网络连接
        # 网络管理
        Network_Manager="networkmanager nm-connection-editor network-manager-applet"
        # 蓝牙管理
        Bluetooth_Manager="bluez bluez-utils blueman"
        # 网络检测
        Network_Detection="bind proxychains-ng"
    # 网络服务
        # 网络浏览
        Web_Browser="chromium"
        # 邮件        [------ArchCN------]
        Email_Client="thunderbird-beta-bin"
        # 下载管理
        Download_Manager="aria2"
        # 博客引擎
        Blog_Engines="hugo opencc"
    # 娱乐
        # 数字发行平台
        Distribution_Platform="steam lib32-amdvlk lib32-nvidia-utils"


##### Multimedia (多媒体) #####
    # 图像
        # 图像浏览
        Image_Viewer="ristretto"
        # 图像处理
        Image_Processing="imagemagick"
        # 图形编辑
        Graphics_Editor="krita"
        # 截图
        Screenshot="flameshot"
        # 颜色拾取
        Color_Picker="gcolor2"
    # 音频
        # 驱动和接口
        Drivers_Interface="alsa-utils alsa-plugins"
        # 声音服务
        Sound_Server="pulseaudio pavucontrol"
        # 音频标签编辑
        Tag_Editor="thunar-media-tags-plugin"
    # 视频
        # 音视频播放
        Media_Player="parole gst-libav"
        # 视频转换
        Video_Converter="ffmpeg"
        # 录屏
        Screencast="simplescreenrecorder"


##### Utilities (实用程序) #####
    # 文字输入
        # 输入法
        Input_Method="fcitx5-im fcitx5-rime"
    # 磁盘
        # 格式化工具
    	Format_Tool="dosfstools exfatprogs ntfs-3g"
        # 挂载工具
        Mount_Tool="android-file-transfer libmtp"
        # 文件监测
        File_Monitoring="lsof"
    # 系统
        # 任务管理
        Task_Manager="htop"
        # 信息查看
        SysInfo_Viewer="usbutils neofetch"
        # man 手册
        Help_Viewer="man-db man-pages"
        # 电源管理
        Power_Manager="tlp tlp-rdw"
        # pacman 工具 [-----ArchCN-----]
        Pacman_Tool="archlinuxcn-keyring expac"
    # 数学
        # 计算器
        Calculator="bc"


##### Documents (文件) #####
    # 文件
        # 文件管理
        File_Manager="ranger atool highlight"
        # 文件同步
        Synchronization="rsync"
        # 文件转换
        Doc_Converter="dos2unix"
        # 压缩工具
        Compression_Tool="p7zip unrar brotli"
    # 文字
        # grep 替代品
        GREP_Alternatives="ripgrep fzf"
        # 文本编辑
        Text_Editor="gvim xclip"
        # 办公套件     [------------Local------------] [--ArchCN---]
        Office_suites="wps-office wps-office-mui-zh-cn ttf-wps-fonts"
    # 电子书
        # CHM 浏览
        CHM_Viewer="kchmviewer"
    # 笔记
        # 笔记管理
        Note_Manager="xfce4-notes-plugin"
        # 思维导图   [Local]
        Mind-Mapping="xmind"


##### Security (安全) #####
    # 系统安全
        # 微码
        Microcode="amd-ucode"
        # 安全 Shell
        Secure_Shell="openssh"
        # 屏幕锁
        Screen_Locker="xfce4-screensaver"
    # 网络安全
        # DNS over HTTPS    [-----------Local-----------]
        DoH="dnscrypt-proxy dnscrypt-proxy-china-list-git"
    # 密码学
        # 密码管理
        Password_Manager="gnome-keyring keepassxc"
        # 文件加密
        Encryption="gocryptfs"
    # 隔离
        # 虚拟化                                                             [------ArchCN------]
        Virtualization="virtualbox virtualbox-host-dkms virtualbox-guest-iso virtualbox-ext-oracle"
        # 沙盒化
        Sandboxing="firejail"


##### Programming (编程) #####
    # 语言及工具
        Android="jadx"
        __C_CPP="gdb"
        _____JS="nodejs npm"
        ___JSON="jq"
        ___Java="jdk-openjdk jre-openjdk jdk8-openjdk jre8-openjdk"
        ____Lua="lua"
        __MySQL="mariadb"
        _Python="python-pip"
        ___Ruby="ruby rubygems"
        __Shell="zenity"
    # 效率工具
        # API 浏览   [ArchCN]
        API_Browser="zeal-git"
        # 版本控制
        Ver_Control="git"
        # 自动化构建
        Build_Automation="gradle cmake"
    # 集成开发环境   [--------------------------ArchCN|Local--------------------------]
        Android_IDE="android-studio"
        ___Java_IDE="intellij-idea-ultimate-edition intellij-idea-ultimate-edition-jre"
        ____Web_IDE="webstorm webstorm-jre"
        __C_CPP_IDE="clion clion-jre clion-cmake clion-gdb"
        _Python_IDE="pycharm-professional"
        __DB_Client="datagrip datagrip-jre"

' | grep '=' | cut -d '=' -f 2 | xargs echo)
sync

echo -e "$red >>>>> Start configuring the PKG (开始配置软件包). $reset"

# lightdm
sudo systemctl enable lightdm.service

# networkmanager
sudo systemctl enable NetworkManager.service
sudo systemctl disable NetworkManager-wait-online.service
sudo systemctl enable NetworkManager-dispatcher.service

# alsa-utils
alsamixer

# tlp
sudo systemctl enable tlp.service
sudo systemctl mask systemd-rfkill.service
sudo systemctl mask systemd-rfkill.socket

# amd-ucode
sudo grub-mkconfig -o /boot/grub/grub.cfg

# dnscrypt-proxy
sudo systemctl enable dnscrypt-proxy.service

# virtualbox
sudo gpasswd -a $USER vboxusers
sudo gpasswd -a $USER storage

# firejail
#为 apparmor 添加内核参数：lsm=lockdown,yama,apparmor,bpf
sudo apparmor_parser -r /etc/apparmor.d/firejail-default

# jdk8-openjdk
sudo archlinux-java set java-8-openjdk

# mariadb
sudo mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
sudo systemctl start mariadb.service
sudo mysql_secure_installation

# Others
sudo systemctl disable remote-fs.target

echo -e "$red >>>>> Software installation script has been quit. $reset"
sync
exit
