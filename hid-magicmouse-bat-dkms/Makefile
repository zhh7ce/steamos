obj-m += hid-magicmouse-bat.o
hid-magicmouse-bat-objs := hid-magicmouse.o

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

install:
	install -D -m 644 hid-magicmouse-bat.ko /lib/modules/$(shell uname -r)/extra/hid-magicmouse-bat.ko
	depmod
