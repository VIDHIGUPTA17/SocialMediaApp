import 'package:flutter/material.dart';

class CustomPhotoCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final VoidCallback onShare;
  final Color cardColor; 
  const CustomPhotoCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.onShare,
    required this.cardColor, 
  }) : super(key: key);

  @override
  _CustomPhotoCardState createState() => _CustomPhotoCardState();
}

class _CustomPhotoCardState extends State<CustomPhotoCard> {
  bool isLiked = false;

  void _toggleLike() {
    setState(() {
      isLiked = !isLiked;
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

          Image.network(widget.imageUrl),
          
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
}
