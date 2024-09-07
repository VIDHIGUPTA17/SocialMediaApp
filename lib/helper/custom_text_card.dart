import 'package:flutter/material.dart';

class CustomTextCard extends StatefulWidget {
  final String content;
  final VoidCallback onShare;
  final Color cardColor; 

  const CustomTextCard({
    Key? key,
    required this.content,
    required this.onShare,
    required this.cardColor, 
  }) : super(key: key);

  @override
  _CustomTextCardState createState() => _CustomTextCardState();
}

class _CustomTextCardState extends State<CustomTextCard> {
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
      child: ListTile(
        
        title: Column(
          children: [
            Row(
              children: [CircleAvatar(child: Image.asset("assets/profile.png",scale:8,),backgroundColor: const Color.fromARGB(255, 250, 242, 219),),
              SizedBox(width: 9,),
            
            Text("Vidhi Gupta")],),
            Text(widget.content),
          ],
        ),
        subtitle: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [ 
          
            IconButton(
              icon:
               Icon(
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
      ),
    );
  }
}
