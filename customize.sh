SKIPUNZIP=1

unzip -o "${ZIPFILE}" -d ${TMPDIR} >&2
cp -af "${TMPDIR}/module.prop" "${TMPDIR}/post-fs-data.sh" "${MODPATH}/" || abort "Failed copy module files."

mkdir -p "${MODPATH}/system/etc"