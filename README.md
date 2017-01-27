# Install Mconf-Live

This is a Chef cookbook to install Mconf-Live.

Install Mconf-Live 0.7.5:

```bash
./configure
sudo chef-client -z -c solo.rb -j mconf-live-standalone.json
```

Install FFmpeg 2.4.2 (Mconf-Live dependency):

```bash
./configure
sudo chef-client -z -c solo.rb -j ffmpeg-standalone.json
```

## Configure a domain name

If your server is responding only to an IP and you wish to configure a domain name, edit `mconf-live-standalone.json` and add the `ip` attribute with your domain name inside the `bbb` block. See the example below:

```
  ...
  "bbb": {
    "ip": "my-server.institution.org",
    "demo": {
    ...
  },
  ...
```

Then execute the steps to install Mconf-Live again. It will not install everything, it will only set your new domain name where it has to be set.

## Disable the demo pages

The demo pages are used for development and testing. If you have another web portal connected to your Mconf-Live, you might wish to disable the demos.

To do so, edit `mconf-live-standalone.json` and set `false` to add the `enabled` attribute inside `demo`. See the example below:

```
  "bbb": {
    "demo": {
      "enabled": false
    }
  }
```
