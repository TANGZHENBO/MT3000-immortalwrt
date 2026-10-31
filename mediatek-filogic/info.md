## ImmortalWrt 25.12.2 - GL.iNet GL-MT3000

- Target: `mediatek/filogic`
- Profile: `glinet_gl-mt3000`
- ImageBuilder: official ImmortalWrt 25.12.2
- LuCI: Simplified Chinese + Argon theme
- Proxy: sing-box, PassWall, OpenClash
- VPN: WireGuard and OpenVPN
- Utilities: Adblock, SmartDNS, DDNS, SQM, UPnP, nlbwmon, Wake-on-LAN, ttyd
- Docker: excluded

### Theme note
This project uses Argon. iStoreOS is a distribution/application-store environment, not a drop-in LuCI theme; mixing its system components into ImmortalWrt is not recommended.

### Safety
1. This is a custom build project, not a prebuilt firmware image.
2. The workflow verifies the official ImageBuilder SHA256 and checks the GL-MT3000 profile before building.
3. The build must complete successfully before any generated image is considered flashable.
4. No default root password is configured. Set a strong password immediately after first boot.
5. Back up settings and keep a recovery method available. Flash only the GL-MT3000 sysupgrade image to a GL-MT3000.
