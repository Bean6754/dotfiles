# Stop Kdenlive on Windows

## How to stop all Kdenlive processes on Windows, thanks to Matthew Moore.

### [Kill Script for Kdenlive - YouTube](https://www.youtube.com/watch?v=7nRe_48vgRs)

Save as 'kdenlive_stop.bat':

```
taskkill /IM "kioslave.exe" /T /F
taskkill /IM "kdenlive.exe" /T /F
taskkill /IM "dbus-daemon.exe" /T /F
wmic process where name='kdenlive.exe' delete
wmic process where name='kioslave.exe' delete
wmic process where name='dbus-daemon.exe' delete
```
