# BlueCandle &nbsp; [![build](https://github.com/Exponent64/BlueCandle/actions/workflows/build.yml/badge.svg)](https://github.com/Exponent64/BlueCandle/actions/workflows/build.yml)

## Installation

> [!WARNING]
> [This is an experimental feature](https://www.fedoraproject.org/wiki/Changes/OstreeNativeContainerStable), try at your own discretion.

To rebase an existing atomic Fedora installation to the latest build:

- First rebase to the unsigned image, to get the proper signing keys and policies installed:
  ```sh
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/exponent64/bluecandle-${IMAGE}:latest
  ```
- Reboot to complete the rebase:
  ```sh
  systemctl reboot
  ```
- Then rebase to the signed image, like so:
  ```sh
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/exponent64/bluecandle-${IMAGE}:latest
  ```
- Reboot again to complete the installation
  ```sh
  systemctl reboot
  ```

  ## Available images
  - bluecandle-main
  - bluecandle-nvidia
  - bluecandle-nvidia-open

  See [here](https://secureblue.dev/images#desktop) for more info.
