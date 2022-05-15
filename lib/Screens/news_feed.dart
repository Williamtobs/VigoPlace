import 'package:flutter/material.dart';

import '../Constant/dummy_list.dart';
import '../Constant/images.dart';
import 'Share/post_card.dart';

class NewsFeedScreen extends StatefulWidget {
  const NewsFeedScreen({Key? key}) : super(key: key);

  @override
  State<NewsFeedScreen> createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          leadingWidth: 0,
          backgroundColor: Colors.white,
          centerTitle: false,
          title: Image.asset(
            vigoLogo,
            width: 120,
            height: 24,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(wallet),
            ),
          ],
        ),
        body: ListView.builder(
            itemCount: newFeeds.length,
            itemBuilder: (context, index) {
              if (newFeeds.isEmpty) {
                const CircularProgressIndicator();
              }
              return NewsCard(
                name: newFeeds[index].name,
                time: newFeeds[index].time,
                image: newFeeds[index].image,
                description: newFeeds[index].description,
                likes: newFeeds[index].likes,
                comments: newFeeds[index].comments,
                postImage: newFeeds[index].postImage,
              );
            }));
  }
}
