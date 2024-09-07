import 'package:flutter/material.dart';

class SampleData {
  static List<TextPost> textPosts = [
    TextPost("In a future where AI has become self hidden resistance movement and must choose between conformity and rebellion.",const Color.fromARGB(255, 255, 246, 160)),
    TextPost("A detective in 19ers linked to a mysterious artifact rumored to hold ancient secrets.",const Color.fromARGB(255, 175, 255, 179)),
    TextPost("A young dragon rider muore it falls into the wrong hands and unleashes chaos upon the land.",const Color.fromARGB(255, 165, 248, 255)),
    TextPost("Psychological Thriller",const Color.fromARGB(255, 184, 192, 255)),
    TextPost("Two polar opposites are forced to woh their own personal quirks and insecurities.",const Color.fromARGB(255, 255, 191, 240)),
  ];

  static List<VideoPost> videoPosts = [
    VideoPost("https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4", "Bee ",const Color.fromARGB(255, 255, 246, 160)),
    VideoPost("https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4", "Bee",const Color.fromARGB(255, 175, 255, 179)),
    VideoPost("https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4", "bee",const Color.fromARGB(255, 165, 248, 255)),
    VideoPost("https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4", "bee",const Color.fromARGB(255, 184, 192, 255)),
    VideoPost("https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4", "bee",const Color.fromARGB(255, 255, 191, 240)),
  ];

  static List<PhotoPost> photoPosts = [
    PhotoPost("https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg", "Owl ",const Color.fromARGB(255, 255, 246, 160)),
    PhotoPost("https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg", "Owl ",const Color.fromARGB(255, 175, 255, 179)),
    PhotoPost("https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg", "Owl ",const Color.fromARGB(255, 255, 191, 240)),
    PhotoPost("https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg", "Owl ",const Color.fromARGB(255, 165, 248, 255)),
    PhotoPost("https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg", "Owl ",const Color.fromARGB(255, 184, 192, 255)),
  ];
}

class TextPost {
  final String content;
  final Color colors;
  TextPost(this.content,this.colors);
}

class VideoPost {
  final String videoUrl;
  final String title;
  final Color color;
  VideoPost(this.videoUrl, this.title, this.color);
}

class PhotoPost {
  final String imageUrl;
  final String title;
  final Color color;
  PhotoPost(this.imageUrl, this.title, this.color);
}
