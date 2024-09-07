import 'package:flutter/material.dart';
import 'package:project/const/constant.dart';
import 'package:project/helper/custom_phtot_post.dart';
import 'package:share_plus/share_plus.dart';

class PhotoPostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Post'),
      ),
      body: ListView.builder(
        itemCount: SampleData.photoPosts.length,
        itemBuilder: (context, index) {
          final post = SampleData.photoPosts[index];
          return CustomPhotoCard(
            imageUrl: post.imageUrl,
            title: post.title,
            onShare: () {
              Share.share('Check out this photo post: https://socialmediaapp-e4ecb.web.app/://photoPost/$index');
            }, cardColor: post.color,
          );
        },
      ),
    );
  }
}
