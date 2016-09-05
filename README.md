# Utilities for Mconf using Chef Zero

To install Mconf-Live 0.7.5, execute:

```bash
./configure
sudo chef-client -z -c solo.rb -j mconf-live-standalone.json
```

To install FFmpeg 2.4.2 (Mconf-Live dependency), execute:

```bash
./configure
sudo chef-client -z -c solo.rb -j ffmpeg-standalone.json
```
