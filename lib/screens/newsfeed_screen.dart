import 'package:flutter/material.dart';
import 'package:dolosa_mobprog/widgets/newsfeed_card.dart';

class NewsfeedScreen extends StatelessWidget {
  const NewsfeedScreen({super.key});

  // 10 posts. Each one has: name, date, text, likes, avatar,
  // and (optional) image or hasPlaceholder.
  static const List<Map<String, dynamic>> posts = [
    {
      'name': 'Steve Rogers',
      'date': 'November 26, 2026',
      'text': 'I can do this all day! #AvengersAssemble',
      'likes': 10,
      'avatar': 'assets/images/ava4.jpg',
    },
    {
      'name': 'Crisanta',
      'date': 'November 23, 2026',
      'text': 'Meet my rainbow pup! #MyDog',
      'likes': 3000,
      'avatar': 'assets/images/ava1.jpg',
      'image': 'assets/images/mydog.jpg',
    },
    {
      'name': 'Tony Stark',
      'date': 'November 22, 2026',
      'text': 'Weekend hike done! #Adventure',
      'likes': 245,
      'avatar': 'assets/images/ava2.jpg',
      'image': 'assets/images/post1.jpg',
    },
    {
      'name': 'Natasha Romanoff',
      'date': 'November 21, 2026',
      'text': 'Lunch with the team! #Foodie',
      'likes': 128,
      'avatar': 'assets/images/ava3.jpg',
      'image': 'assets/images/post2.jpg',
    },
    {
      'name': 'Wanda Maximoff',
      'date': 'November 20, 2026',
      'text': 'Quick update today, no picture this time.',
      'likes': 56,
      'avatar': 'assets/images/ava5.jpg',
    },
    {
      'name': 'Crisanta',
      'date': 'November 19, 2026',
      'text': 'Flying over Manila! #Travel',
      'likes': 980,
      'avatar': 'assets/images/ava1.jpg',
      'image': 'assets/images/post3.jpg',
    },
    {
      'name': 'Steve Rogers',
      'date': 'November 18, 2026',
      'text': 'Photo coming soon... (placeholder)',
      'likes': 12,
      'avatar': 'assets/images/ava4.jpg',
      'hasPlaceholder': true,
    },
    {
      'name': 'Tony Stark',
      'date': 'November 17, 2026',
      'text': 'Morning city views #CityLife',
      'likes': 410,
      'avatar': 'assets/images/ava2.jpg',
      'image': 'assets/images/post4.jpg',
    },
    {
      'name': 'Natasha Romanoff',
      'date': 'November 16, 2026',
      'text': 'Studying for my exam later. Wish me luck!',
      'likes': 75,
      'avatar': 'assets/images/ava3.jpg',
    },
    {
      'name': 'Wanda Maximoff',
      'date': 'November 15, 2026',
      'text': 'Sunday vibes #Relax',
      'likes': 320,
      'avatar': 'assets/images/ava5.jpg',
      'hasPlaceholder': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final p = posts[index];
        return NewsfeedCard(
          name: p['name'] as String,
          date: p['date'] as String,
          text: p['text'] as String,
          likes: p['likes'] as int,
          avatar: p['avatar'] as String,
          image: p['image'] as String?,
          hasPlaceholder: (p['hasPlaceholder'] as bool?) ?? false,
        );
      },
    );
  }
}
