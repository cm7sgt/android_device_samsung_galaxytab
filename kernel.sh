export LOCALVERSION=
export PROJECT_NAME=GT-P1000
export HW_BOARD_REV="03"
export CPU_JOB_NUM=4

export TOOLCHAIN=/opt/toolchains/arm-2009q3/bin
export TOOLCHAIN_PREFIX=arm-none-eabi-
export ARCH=arm

export LD_LIBRARY_PATH=.:${TOOLCHAIN}/../lib


export OUT_DIR=`readlink -f ../../../out`
export OUT_DIR=${OUT_DIR}/target/product/galaxytab
echo out dir is ${OUT_DIR}
mkdir -p ${OUT_DIR}
export KERNEL_SOURCE_DIR=`readlink -f ../../../kernel/samsung/2.6.35-tab`
export KERNEL_BUILD_DIR=${OUT_DIR}/kernel_build
mkdir -p $KERNEL_BUILD_DIR

echo kernel build is $KERNEL_BUILD_DIR
echo kernel source $KERNEL_SOURCE_DIR

KERNEL_DEFCONFIG()
{
	echo running defconfig
	make -C $KERNEL_SOURCE_DIR O=$KERNEL_BUILD_DIR LOCALVERSION= ARCH=arm p1_cm7_defconfig
}

KERNEL_MENUCONFIG()
{
	echo running menuconfig
	make -C $KERNEL_SOURCE_DIR O=$KERNEL_BUILD_DIR LOCALVERSION= ARCH=arm CROSS_COMPILE=$TOOLCHAIN/$TOOLCHAIN_PREFIX menuconfig
}

KERNEL_BUILD()
{
	echo running build
	make -j$CPU_JOB_NUM -C $KERNEL_SOURCE_DIR O=$KERNEL_BUILD_DIR LOCALVERSION= ARCH=arm CROSS_COMPILE=$TOOLCHAIN/$TOOLCHAIN_PREFIX
	cp -v $KERNEL_BUILD_DIR/arch/arm/boot/zImage kernel
}

KERNEL_BUILD_MODULES()
{
	echo running build modules
	make -j$CPU_JOB_NUM -C $KERNEL_SOURCE_DIR O=$KERNEL_BUILD_DIR LOCALVERSION= ARCH=arm CROSS_COMPILE=$TOOLCHAIN/$TOOLCHAIN_PREFIX modules
	mkdir -p prebuilt/modules
	cp -v ${KERNEL_BUILD_DIR}/fs/cifs/cifs.ko prebuilt/modules
	cp -v ${KERNEL_BUILD_DIR}/drivers/net/tun.ko prebuilt/modules
	cp -v ${KERNEL_BUILD_DIR}/crypto/ansi_cprng.ko prebuilt/modules
	cp -v ${KERNEL_BUILD_DIR}/drivers/scsi/scsi_wait_scan.ko prebuilt/modules
	cp -v ${KERNEL_BUILD_DIR}/drivers/misc/vibtonz/vibrator.ko prebuilt/modules
	cp -v ${KERNEL_BUILD_DIR}/drivers/bluetooth/bthid/bthid.ko prebuilt/modules
	cp -v ${KERNEL_BUILD_DIR}/drivers/net/wireless/bcm4329/bcm4329.ko prebuilt/modules
	cp -v ${KERNEL_BUILD_DIR}/drivers/net/wireless/bcm4329/hotspot_event_monitoring.ko prebuilt/modules
}

case $1 in
    defconfig)
        KERNEL_DEFCONFIG
        ;;
    defconfigl)
        KERNEL_DEFCONFIGL
        ;;
    menuconfig)
        KERNEL_MENUCONFIG
        ;;
    modules)
        KERNEL_BUILD_MODULES
        ;;
    kernel)
        KERNEL_BUILD
        ;;
    *)
esac

