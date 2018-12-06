## WebM.

#### Summary: Added 'frame_rate_num=60 frame_rate_den=1' to Parameters to change video from 25fps to 60fps.

Group `Custom`

Profile name `WebM - the widespread free format (VP8/Vorbis)`

Extention `webm`

Parameters (see [MLT documentation](https://www.mltframework.org/plugins/ConsumerAvformat/))

  ```
  f=webm vcodec=libvpx acodec=libvorbis crf=%quality vb=0 quality=good aq=%audioquality max-intra-rate=1000 frame_rate_num=60 frame_rate_den=1
  ```

Video

  * Qualities `15,45`

  * Default quality `0`

Audio

  * Qualities `7,3`

  * Default quality `0`

Speed options

  ```
  cpu-used=2
  cpu-used=3
  cpu-used=4
  cpu-used=5
  ```

#### More [MLT documentation](https://www.mltframework.org/docs/profiles/)
