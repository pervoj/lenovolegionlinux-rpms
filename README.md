# lenovolegionlinux-rpms

Automated Fedora RPM builds for [LenovoLegionLinux](https://github.com/johnfanv2/LenovoLegionLinux) — a driver and tooling stack for controlling Lenovo Legion laptops on Linux.

Built packages are published as OCI artifacts to GitHub Container Registry (GHCR) and rebuilt automatically when upstream releases or supported Fedora versions change.

## Packages

| RPM | Description |
|-----|-------------|
| `dkms-LenovoLegionLinux` | DKMS kernel module for Legion laptop features |
| `python-LenovoLegionLinux` | Python library and CLI for fan, power, and keyboard control |
| `python-darkdetect` | Dependency for detecting OS dark mode from Python |

## Download RPMs

Artifacts are tagged by Fedora version and upstream release, for example `f44-v0.0.23`. A rolling `f44` tag always points at the latest build for Fedora 44.

Replace `44` with your Fedora major version:

```bash
# Latest build for your Fedora version
oras pull ghcr.io/pervoj/lenovolegionlinux-rpms:f44

# Or a specific release
oras pull ghcr.io/pervoj/lenovolegionlinux-rpms:f44-v0.0.23
```

Install on Fedora Silverblue / other rpm-ostree systems:

```bash
rpm-ostree install ./dkms-LenovoLegionLinux-*.rpm ./python-LenovoLegionLinux-*.rpm ./python-darkdetect-*.rpm
```

## License

This repository contains only packaging and CI configuration. The built software is licensed under the terms of the [LenovoLegionLinux project](https://github.com/johnfanv2/LenovoLegionLinux).
