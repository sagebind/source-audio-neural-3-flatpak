# Source Audio Neuro 3 for Linux

Unofficial [Flatpak](https://flatpak.org) of [Neuro 3](https://www.sourceaudio.net/publicbeta.html) public beta by [Source Audio](https://www.sourceaudio.net) for controlling Source Audio guitar and bass effect pedals.

## Installation

For now this isn't being published or deployed anywhere. To build and install the Flatpak yourself, first make sure you have Flatpak installed and `flatpak-builder`. Then clone this repository onto your machine, and within the repo, run

```sh
make install
```

### Udev rules

On Linux, Neuro needs to be granted read-write permission to the `/dev/hidraw*` device that points to a Source Audio pedal when it is plugged into your machine via USB. To make this easier, a udev rules file is provided that automatically grants permissions to recognized Source Audio devices.

`make install` will install these rules for you automatically via `sudo`.

## License

Neuro is © 2024 Source Audio. This repo has no affiliation with Source Audio.

This repo also includes prebuilt binaries of portions of [JetBrains Skiko](https://github.com/JetBrains/skiko), whose source is available under the [Apache 2.0 license](https://github.com/JetBrains/skiko/blob/master/LICENSE).

Code in this repo is available under the [MIT license](LICENSE).
