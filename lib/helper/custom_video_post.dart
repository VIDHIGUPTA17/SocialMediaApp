import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CustomVideoCard extends StatefulWidget {
  final String videoUrl;
  final String title;
  final VoidCallback onShare;
  final Color cardColor;

  const CustomVideoCard({
    Key? key,
    required this.videoUrl,
    required this.title,
    required this.onShare,
    required this.cardColor, required int postIndex, 
  }) : super(key: key);

  @override
  _CustomVideoCardState createState() => _CustomVideoCardState();
}
class _CustomVideoCardState extends State<CustomVideoCard> {
  late VideoPlayerController _controller;
  bool isLiked = false;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  void _toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  void _togglePlay() {
    setState(() {
      if (isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.cardColor, 
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _controller.value.isInitialized
              ? Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: IconButton(
                        icon: Icon(
                          isPlaying ? Icons.pause : Icons.play_arrow,
                          color: Colors.white,
                        ),
                        onPressed: _togglePlay,
                      ),
                    ),
                  ],
                )
              : Center(child: CircularProgressIndicator()), 
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
                              Row(
              children: [CircleAvatar(child: Image.asset("assets/profile.png",scale:8),backgroundColor: Colors.white,),
              SizedBox(width: 9,),
            
            Text("Vidhi Gupta")],),
              IconButton(
                icon: Icon(
                  Icons.thumb_up,
                  color: isLiked ? Colors.red : Colors.grey,
                ),
                onPressed: _toggleLike,
              ),
              IconButton(
                icon: Icon(Icons.share),
                onPressed: widget.onShare,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
