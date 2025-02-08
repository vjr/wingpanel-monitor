<p align="center">
  <img src="data/icons/128/com.github.plugarut.wingpanel-monitor.svg" alt="Icon" />
</p>
<h1 align="center">Wingpanel Monitor</h1>

<!-- <p align="center">
  <a href="https://appcenter.elementary.io/com.github.plugarut.wingpanel-monitor"><img src="https://appcenter.elementary.io/badge.svg" alt="Get it on AppCenter" /></a>
</p> -->

![Screenshot](data/screenshot_1.png)


## Building and Installation

You'll need the following dependencies:

```
libglib2.0-dev
libgtop2-dev
libgudev-1.0-dev
libgranite-dev
libgtk-3-dev
libwingpanel-dev
libhandy-1-dev 
meson
valac
```

You can install them: 

- elementary Odin 6.x.x:
```bash
sudo apt install libgtop2-dev libgudev-1.0-dev libgranite-dev libgtk-3-dev libwingpanel-dev meson valac libhandy-1-dev
```
Run `meson` to configure the build environment and then `ninja` to build

```
meson build --prefix=/usr
cd build
ninja
```

To install, use `ninja install`

```
sudo ninja install
com.github.plugarut.wingpanel-monitor
```

## Special Thanks
 - [Nararyans R.I.](https://github.com/Fatih20) for the icon
