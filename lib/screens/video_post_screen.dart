// // import 'package:flutter/material.dart';
// // import 'package:share_plus/share_plus.dart';
// // import 'package:video_player/video_player.dart';

// // class VideoPostScreen extends StatefulWidget {
// //   @override
// //   _VideoPostScreenState createState() => _VideoPostScreenState();
// // }

// // class _VideoPostScreenState extends State<VideoPostScreen> {
// //   List<VideoPlayerController> _controllers = [];

// //   final List<String> videoUrls = [
// //     'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
// //     'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
// //     'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
// //     'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
// //     'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'
// //   ];

// //   @override
// //   void initState() {
// //     super.initState();
// //     _initializeVideos();
// //   }

// //   void _initializeVideos() {
// //     for (var videoUrl in videoUrls) {
// //       VideoPlayerController controller = VideoPlayerController.network(videoUrl)
// //         ..initialize().then((_) {
// //           setState(() {});
// //         });
// //       _controllers.add(controller);
// //     }
// //   }

// //   @override
// //   void dispose() {
// //     for (var controller in _controllers) {
// //       controller.dispose();
// //     }
// //     super.dispose();
// //   }

// //   void _shareContent(int index) {
// //     Share.share('Check out this video post: myapp://videoPost/$index');
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Video Post'),
// //       ),
// //       body: ListView.builder(
// //         itemCount: _controllers.length,
// //         itemBuilder: (context, index) {
// //           final controller = _controllers[index];
// //           return Card(
// //             child: Column(
// //               children: [
// //                 if (controller.value.isInitialized)
// //                   AspectRatio(
// //                     aspectRatio: controller.value.aspectRatio,
// //                     child: VideoPlayer(controller),
// //                   ),
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
// //                   children: [
// //                     IconButton(
// //                       icon: Icon(controller.value.isPlaying
// //                           ? Icons.pause
// //                           : Icons.play_arrow),
// //                       onPressed: () {
// //                         setState(() {
// //                           controller.value.isPlaying
// //                               ? controller.pause()
// //                               : controller.play();
// //                         });
// //                       },
// //                     ),
// //                     IconButton(
// //                       icon: Icon(Icons.share),
// //                       onPressed: () => _shareContent(index),
// //                     ),
// //                   ],
// //                 ),
// //               ],
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }


// import 'package:flutter/material.dart';
// import 'package:project/helper/custom_video_post.dart';

// class VideoPostScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Video Post'),
//       ),
//       body: ListView.builder(
//         itemCount: 5,
//         itemBuilder: (context, index) {
//           return CustomVideoCard(
//             videoUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4', // Example URL
//             postIndex: index,
//             onShare: () {
//               // Replace this with actual share functionality if needed
//               print('Share Video Post #$index');
//             },
//           );
//         },
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:project/const/constant.dart';
import 'package:project/helper/custom_video_post.dart';
import 'package:share_plus/share_plus.dart';

class VideoPostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Post'),
      ),
      body: ListView.builder(
        itemCount: SampleData.videoPosts.length,
        itemBuilder: (context, index) {
          final post = SampleData.videoPosts[index];
          return CustomVideoCard(
            videoUrl: post.videoUrl,
            postIndex: index,
            onShare: () {
              Share.share('Check out this video post: https://socialmediaapp-e4ecb.web.app/://videoPost/$index');
            }, title: '', cardColor: post.color,
          );
        },
      ),
    );
  }
}
