#!/usr/bin/env bash

set -euo pipefail

IMAGE_PRETTY_NAME="BlueCandle"
IMAGE_LIKE="fedora"
HOME_URL="https://github.com/Exponent64/BlueCandle"
DOCUMENTATION_URL="https://github.com/Exponent64/BlueCandle/tree/main/docs"
SUPPORT_URL="https://github.com/Exponent64/BlueCandle/issues"
BUG_SUPPORT_URL="https://github.com/Exponent64/BlueCandle/issues"

sed -i --sandbox "s|^VARIANT_ID=.*|VARIANT_ID=${IMAGE_NAME}|" /usr/lib/os-release
sed -i --sandbox "s|^PRETTY_NAME=.*|PRETTY_NAME=\"${IMAGE_PRETTY_NAME} (powered by secureblue)\"|" /usr/lib/os-release
sed -i --sandbox "s|^NAME=.*|NAME=\"${IMAGE_PRETTY_NAME}\"|" /usr/lib/os-release
sed -i --sandbox "s|^HOME_URL=.*|HOME_URL=\"${HOME_URL}\"|" /usr/lib/os-release
sed -i --sandbox "s|^DOCUMENTATION_URL=.*|DOCUMENTATION_URL=\"${DOCUMENTATION_URL}\"|" /usr/lib/os-release
sed -i --sandbox "s|^SUPPORT_URL=.*|SUPPORT_URL=\"${SUPPORT_URL}\"|" /usr/lib/os-release
sed -i --sandbox "s|^BUG_REPORT_URL=.*|BUG_REPORT_URL=\"${BUG_SUPPORT_URL}\"|" /usr/lib/os-release
sed -i --sandbox "s|^CPE_NAME=\"cpe:/o:secureblue:secureblue|CPE_NAME=\"cpe:/o:Exponent64:${IMAGE_PRETTY_NAME,}|" /usr/lib/os-release
sed -i --sandbox "s|^DEFAULT_HOSTNAME=.*|DEFAULT_HOSTNAME=bluecandle|" /usr/lib/os-release
sed -i --sandbox "s|^ID=secureblue|ID=${IMAGE_PRETTY_NAME,}\nID_LIKE=\"${IMAGE_LIKE}\"|" /usr/lib/os-release
sed -i --sandbox '$a\IMAGE_ID='"\"${IMAGE_NAME}\"" /usr/lib/os-release
