# ImmortalWrt MT3000 25.12.2

Custom build scaffold for the GL.iNet GL-MT3000 (Beryl AX), based on the official ImmortalWrt 25.12.2 ImageBuilder.

## Build
1. Open **Actions** and enable workflows if GitHub prompts you.
2. Run **Build ImmortalWrt 25.12.2 for GL-MT3000** using **Run workflow**.
3. Download the workflow artifact, or open the generated GitHub Release after the job succeeds.

## Configuration
- Target: `mediatek/filogic`
- Profile: `glinet_gl-mt3000`
- LuCI language: Simplified Chinese
- Theme: Argon
- Proxy components: sing-box, PassWall, OpenClash
- VPN: WireGuard and OpenVPN
- Docker: excluded

See `mediatek-filogic/packages.txt` for the package selection and `mediatek-filogic/info.md` for build notes.

## Theme clarification
iStoreOS is a distribution/application-store environment, not a drop-in LuCI theme. This project uses Argon rather than mixing iStoreOS system components into ImmortalWrt.

## Flashing safety
- Confirm the device is **GL-MT3000 / Beryl AX**.
- Back up settings and retain the vendor recovery procedure.
- Do not flash MT2500, MT6000, generic Filogic, or initramfs images as substitutes.
- Set a strong root password on first boot; do not expose LuCI/SSH to WAN.
- Only flash a successfully built GL-MT3000 sysupgrade image to a GL-MT3000.
