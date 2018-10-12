# Hackintosh-Aero15

## Device 

Referred from [this](https://www.gigabyte.com/Laptop/AERO-15--i7-7700HQ#sp)

### Yes 

- CPU: i7-7700HQ

- Display: 15.6" FHD1920*1080

- Video Graphics: Intel HD630([works by Intel Framebuffer patching using WhateverGreen.kext](https://www.tonymacx86.com/threads/guide-intel-framebuffer-patching-using-whatevergreen.256490/)); 
NVIDIA GTX 1060(disabled by SSDT-DDGPU)

- Storage: 2 x M.2 SSD (Type 2280, supports NVMe PCIe X4 & SATA),[native](https://github.com/RehabMan/patch-nvme)

- Memory: 2 x 8GB DDR4 2400 

- USB(XHC): 100 series Chipset,works by USBinjectAll.kext,patched by SSDT-UIAC-ALL(combined with [SSDT-UIAC](https://www.tonymacx86.com/threads/guide-creating-a-custom-ssdt-for-usbinjectall-kext.211311/) and [SSDT-USBX](https://www.tonymacx86.com/threads/guide-usb-power-property-injection-for-sierra-and-later.222266/))
  - USB 3.0(OK)
  - USB Type-C(OK): only works plugged in during boot
  - Webcam(OK)

- SD Card Reader(OK): works with SD icon by AppleSDInjector.kext

- Audio(OK): Realtek ALC255,works by AppleALC.kext,patched by SSDT-HDEF and SSDT-RMCF with layout id =3

- Ethernet(OK): works by RealtekRTL8111.kext

- Battery(OK): patched by [SSDT-BATT](https://blog.neroxps.cn/2017/02/25/Hotpatch/)

- Backlight Control(OK): works by AppleBacklightInjector.kext,patched by SSDT-PNLF

### NO

- Wireless LAN: Intel Wireless 8265, Of course not

- Bluetooth: Intel ,sometimes works

- HDMI 2.0,mini DP 1.3: No tested

- Fan RPM(OK): failed patch after replacing FakeSMC with VirtualSMC
