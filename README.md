# GL-MT3000 · ImmortalWrt 25.12.2

A focused, Chinese-language ImmortalWrt image for **GL.iNet GL-MT3000 (Beryl AX / MT7981B)**. Built with the official ImmortalWrt 25.12.2 ImageBuilder.

## What is included

- **Proxy:** sing-box core + HomeProxy LuCI app + Simplified Chinese translation.
- **Ad blocking:** Adblock Fast LuCI app. Enable it and choose filter lists after first boot.
- **Themes:** Argon (default), Bootstrap, Material, OpenWrt 2020 and OpenWrt classic. Change under System → Language and Style.
- **Network:** SmartDNS, SQM, DDNS, UPnP, bandwidth monitoring and Wake-on-LAN.
- **VPN:** WireGuard and OpenVPN.
- **Language:** Simplified Chinese by default.
- **No Docker, PassWall or OpenClash:** the image intentionally uses one proxy management stack (HomeProxy) to keep the interface straightforward and avoid overlapping services.

## Build firmware

1. Open the **Actions** tab.
2. Select **Build ImmortalWrt 25.12.2 for GL-MT3000**.
3. Click **Run workflow** and start the build.
4. When it completes, download the firmware from the workflow artifact or the GitHub Release.

The workflow verifies the official ImageBuilder archive checksum, checks that the GL-MT3000 profile exists, and fails if no matching GL-MT3000 sysupgrade image is produced.

## First boot

1. Flash only the GL-MT3000 sysupgrade image to a GL-MT3000.
2. Connect to the router and open LuCI.
3. Set a strong root password immediately.
4. Open **Services → HomeProxy** to import your own subscription or node configuration.
5. Open **Services → Adblock Fast**, select filter lists, then enable and apply it.
6. Choose a preferred theme under **System → Language and Style**.

Ad filtering is included but is not forced on at first boot, so it will not unexpectedly interfere with DNS or proxy configuration. HomeProxy is installed, but no proxy nodes are bundled.

## Important notes

- This is a custom build configuration, not a prebuilt firmware download.
- Theme packages are installed together; Argon is selected as the default theme. Appearance may vary slightly with the installed LuCI version.
- Do not flash images for MT2500, MT6000, generic Filogic devices or other models.
- Back up router settings and keep the vendor recovery method available before flashing.
- Never expose LuCI or SSH directly to the WAN.
