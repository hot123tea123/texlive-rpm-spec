#!/bin/sh
#
# 将 TLCore, Package, Collection, Scheme 分开
sed -e '/./{H;$!d;}' -e 'x;/category TLCore/!d;' texlive.tlpdb.orig > TLCore.stanza
sed -e '/./{H;$!d;}' -e 'x;/category Package/!d;' texlive.tlpdb.orig > Package.stanza
sed -e '/./{H;$!d;}' -e 'x;/category Collection/!d;' texlive.tlpdb.orig > Collection.stanza
sed -e '/./{H;$!d;}' -e 'x;/category Scheme/!d;' texlive.tlpdb.orig > Scheme.stanza
# 获取名称列表
# TLCore
sed '/^name /!d' TLCore.stanza > TLCore.list
sed -i 's/name //' TLCore.list
sed -i '/^$/d' TLCore.list
# 00texlive.config, 00texlive.image, 00texlive.installation, 00texlive.installer 这几个是安装配置什么的，不需要
sed -i '/^00texlive.config$\|^00texlive.image$\|^00texlive.installation$\|^00texlive.installer$/d' TLCore.list
# 删除所有的 name.ARCH，只需要获得名称列表
sed -i '/\./d' TLCore.list
sed -i '/^$/d' TLCore.list
# Package
sed '/^name /!d' Package.stanza > Package.list
sed -i 's/name //' Package.list
sed -i '/^$/d' Package.list
# Collection
sed '/^name /!d' Collection.stanza > Collection.list
sed -i 's/name //' Collection.list
sed -i '/^$/d' Collection.list
# Scheme
sed '/^name /!d'  Scheme.stanza > Scheme.list
sed -i 's/name //' Scheme.list
sed -i '/^$/d' Scheme.list
#
# 处理 .stanza 文件
# TLCore
# 删除 00texlive.config, 00texlive.image, 00texlive.installation, 00texlive.installer 的 stanza
sed -i -e '/./{H;$!d;}' -e 'x;/00texlive.config\|00texlive.image\|00texlive.installation\|00texlive.installer/d;' TLCore.stanza
# 提取 i386-linux 的 stanza
sed -e '/./{H;$!d;}' -e 'x;/i386-linux/!d;' TLCore.stanza > TLCore.i386-linux.stanza
# 删除 x86_64-linux 的 stanza
sed -e '/./{H;$!d;}' -e 'x;/x86_64-linux/!d;' TLCore.stanza > TLCore.x86_64-linux.stanza
# 删除所有包含架构相关的 stanza，只保留架构无关了。大部分都是文档包
sed -e '/./{H;$!d;}' -e 'x;/i386-linux\|x86_64-linux\|alpha-linux\|amd64-freebsd\|amd64-kfreebsd\|amd64-netbsd\|armel-linux\|armhf-linux\|i386-cygwin\|i386-freebsd\|i386-kfreebsd\|i386-netbsd\|i386-solaris\|mipsel-linux\|powerpc-linux\|sparc-solaris\|universal-darwin\|win32\|x86_64-cygwin\|x86_64-darwin\|x86_64-solaris/d;' TLCore.stanza > TLCore.noarch.stanza













