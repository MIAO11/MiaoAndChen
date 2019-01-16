
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Player extends StatefulWidget {
  /// [AudioPlayer] 播放地址
  final String audioUrl;

  /// 音量
  final double volume;

  /// 错误回调
  final Function(String) onError;

  ///播放完成
  final Function() onCompleted;

  /// 上一首
  final Function() onPrevious;

  ///下一首
  final Function() onNext;

  final Function(bool) onPlaying;

  final Key key;

  final Color color;

  /// 是否是本地资源
  final bool isLocal;

  const Player(
      {@required this.audioUrl,
      @required this.onCompleted,
      @required this.onError,
      @required this.onNext,
      @required this.onPrevious,
      this.key,
      this.volume: 1.0,
      this.onPlaying,
      this.color: Colors.white,
      this.isLocal: false});

  @override
  State<StatefulWidget> createState() {
    return new PlayerState();
  }
}

class PlayerState extends State<Player> {
  AudioPlayer audioPlayer;
  bool isPlaying = false;
  bool isPause = false;
  
  Duration duration;
  Duration position;
  double sliderValue;

  @override
  void initState() {
    super.initState();
    print("audioUrl:" + widget.audioUrl);
    audioPlayer = new AudioPlayer();
    audioPlayer
      ..completionHandler = widget.onCompleted
      ..errorHandler = widget.onError
      ..durationHandler = ((duration) {
        setState(() {
          this.duration = duration;

          if (position != null) {
            this.sliderValue = (position.inSeconds / duration.inSeconds);
          }
        });
      })
      ..positionHandler = ((position) {
        setState(() {
          this.position = position;

          if (duration != null) {
            this.sliderValue = (position.inSeconds / duration.inSeconds);
          }
        });
      });
  }

  @override
  void deactivate() {
    super.deactivate();
    audioPlayer.stop();
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.release();
  }

  String _formatDuration(Duration d) {
    int minute = d.inMinutes;
    int second = (d.inSeconds > 60) ? (d.inSeconds % 60) : d.inSeconds;
    print(d.inMinutes.toString() + "======" + d.inSeconds.toString());
    String format = ((minute < 10) ? "0$minute" : "$minute") +
        ":" +
        ((second < 10) ? "0$second" : "$second");
    return format;
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.end,
      children: _controllers(context),
    );
  }

  Widget _timer(BuildContext context) {
    var style = new TextStyle(color: widget.color);
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        new Text(
          position == null ? "--:--" : _formatDuration(position),
          style: style,
        ),
        new Text(
          duration == null ? "--:--" : _formatDuration(duration),
          style: style,
        ),
      ],
    );
  }

  List<Widget> _controllers(BuildContext context) {
    return [
      const Divider(color: Colors.transparent),
      const Divider(
        color: Colors.transparent,
        height: 32.0,
      ),
      new Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new IconButton(
              onPressed: () {
                widget.onPrevious();
              },
              icon: new Icon(
                Icons.skip_previous,
                size: 32.0,
                color: widget.color,
              ),
            ),
            new IconButton(
              onPressed: () {
                if (isPlaying){
                 audioPlayer.pause();
                 isPause = !isPause;
                }
                else {
                  if(isPause) {
                    audioPlayer.resume();
                    isPause = !isPause;
                  }else{
                    audioPlayer.play(
                    widget.audioUrl,
                    isLocal: widget.isLocal,
                    volume: widget.volume,
                  );
                  }                 
                }
                setState(() {
                  isPlaying = !isPlaying;
                  widget.onPlaying(isPlaying);
                });
              },
              padding: const EdgeInsets.all(0.0),
              icon: new Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
                size: 48.0,
                color: widget.color,
              ),
            ),
            new IconButton(
              onPressed: widget.onNext,
              icon: new Icon(
                Icons.skip_next,
                size: 32.0,
                color: widget.color,
              ),
            ),
          ],
        ),
      ),
      new Slider(
        onChanged: (newValue) {
          if (duration != null) {
            int seconds = (duration.inSeconds * newValue).round();
            print("audioPlayer.seek: $seconds");
            audioPlayer.seek(new Duration(seconds: seconds));
          }
        },
        value: sliderValue ?? 0.0,
        activeColor: widget.color,
      ),
      new Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: _timer(context),
      ),
    ];
  }
}