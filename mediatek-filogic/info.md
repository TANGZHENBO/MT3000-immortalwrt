## ImmortalWrt 25.12.2 - GL.iNet GL-MT3000

- Target: mediatek/filogic
- Profile: glinet_gl-mt3000
- ImageBuilder: official ImmortalWrt 25.12.2
- LuCI: Simplified Chinese; Argon default, with Bootstrap, Material, OpenWrt 2020 and classic OpenWrt themes
- Proxy: sing-box core + HomeProxy LuCI interface + Chinese translation
- Ad blocking: Adblock Fast LuCI interface (configure filter lists after first boot)
- Network: SmartDNS, DDNS, SQM, UPnP, nlbwmon and Wake-on-LAN
- VPN: WireGuard and OpenVPN
- Docker, PassWall and OpenClash: excluded to keep the image focused and avoid overlapping proxy stacks

### Theme note
Argon is selected as the default theme. Other included themes can be selected in LuCI under System > Language and Style. iStoreOS is a distribution/application-store environment, not a drop-in LuCI theme; mixing its system components into ImmortalWrt is not recommended.

### Safety
1. This is a custom build project, not a prebuilt firmware image.
2. The workflow verifies the official ImageBuilder SHA256 and checks the GL-MT3000 profile before building.
3. The build must complete successfully before any generated image is considered flashable.
4. No default root password is configured. Set a strong password immediately after first boot.
5. Back up settings and keep a recovery method available. Flash only the GL-MT3000 sysupgrade image to a GL-MT3000.
6. HomeProxy is preinstalled, but no proxy credentials or subscriptions are included.
