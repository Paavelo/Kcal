#!/system/bin/sh
# KTSR™ & King Xvision™ by pedro (pedrozzz0 @ GitHub)

KXLOG=/data/media/0/KTSR/kxvision.log

[[ -e ${KXLOG} ]] && rm -rf "${KXLOG}"

# King Xvision
echo "1" >"/sys/devices/platform/kcal_ctrl.0/kcal_enable"
echo "229 229 229" >"/sys/devices/platform/kcal_ctrl.0/kcal"
echo "265" >"/sys/devices/platform/kcal_ctrl.0/kcal_sat"
echo "255" >"/sys/devices/platform/kcal_ctrl.0/kcal_val"
echo "255" >"/sys/devices/platform/kcal_ctrl.0/kcal_cont"

[[ $? == "0" ]] && {
	echo "[*] KCAL Xvision preset executed without any errors!" >"${KXLOG}"
	exit 0
} || {
	service call SurfaceFlinger 1023 i32 0 >/dev/null 2>&1
	service call SurfaceFlinger 1022 f 1.5 >/dev/null 2>&1
	echo "[!] KCAL Xvision preset executed with errors, using SF native saturation boost function instead." >"${KXLOG}"
	exit $?
}
