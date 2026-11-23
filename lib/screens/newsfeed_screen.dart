import 'package:flutter/material.dart';
import 'package:dolosa_mobprog/widgets/newsfeed_card.dart';

class NewsfeedScreen extends StatelessWidget {
  const NewsfeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        // Post WITHOUT image
        NewsfeedCard(
          userName: 'Steve Rogers',
          postContent: 'I can do this all day! #AvengersAssemble',
          date: '2 hours ago',
          numOfLikes: 10,
        ),
        // Post WITH image
        NewsfeedCard(
          userName: 'Crisanta',
          postContent: 'Meet my rainbow pup! #MyDog',
          date: 'November 23, 2026',
          numOfLikes: 3000,
          hasImage: true,
          imagePath: 'assets/images/mydog.jpg',
        ),
      ],
    );
  }
}