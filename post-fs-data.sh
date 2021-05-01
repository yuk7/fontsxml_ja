#!/system/bin/sh
MODDIR=${0%/*}

cp "/system/etc/fonts.xml" "${MODDIR}/system/etc/"
MODFONTSXML="${MODDIR}/system/etc/fonts.xml"

family_ja_n=`sed -n -e '/<family lang="ja">/,/<\/family>/p' "${MODFONTSXML}" | sed -e ':a' -e 'N' -e '$!ba' -e 's/\n/\\\\n/g' -e 's#^ *##g'`

sed -i -e ':a' -e 'N' -e '$!ba' -e "s#${family_ja_n}##g" "${MODFONTSXML}"
sed -i -e ':a' -e 'N' -e '$!ba' -e "s#<family lang=\"zh-Hans\">#${family_ja_n}\n    <family lang=\"zh-Hans\">#g" "${MODFONTSXML}"