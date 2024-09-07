import 'package:flutter/material.dart';
import 'package:project/const/constant.dart';
import 'package:project/helper/custom_text_card.dart';
import 'package:share_plus/share_plus.dart';

class TextPostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Post',style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: ListView.builder(
        itemCount: SampleData.textPosts.length,
        itemBuilder: (context, index) {
          final post = SampleData.textPosts[index];
          return CustomTextCard(
            content: post.content,
            onShare: () {
              Share.share('Check out this post: https://socialmediaapp-e4ecb.web.app://textPost/$index');
            },
             cardColor: post.colors,
          );
        },
      ),
    );
  }
}
