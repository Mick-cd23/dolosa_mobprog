import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dolosa_mobprog/widgets/notification_widget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // 20 notifications: [name, post, description, avatar number]
  static const List<List<String>> _data = [
    ['Steve Rogers', 'I can do this all day!', 'Liked your post', '4'],
    ['Tony Stark', 'Weekend hike done!', 'Commented: Great view!', '2'],
    ['Natasha Romanoff', 'Lunch with the team!', 'Shared your post', '3'],
    ['Wanda Maximoff', 'Sunday vibes', 'Reacted to your post', '5'],
    ['Bruce Banner', 'Morning city views', 'Liked your post', '1'],
    ['Peter Parker', 'Flying over Manila!', 'Commented: Amazing shot!', '2'],
    ['Carol Danvers', 'Meet my rainbow pup!', 'Reacted to your post', '3'],
    ['Sam Wilson', 'Weekend hike done!', 'Shared your post', '4'],
    ['Bucky Barnes', 'Lunch with the team!', 'Liked your post', '5'],
    ['Clint Barton', 'Sunday vibes', 'Commented: Looks relaxing!', '1'],
    ['Scott Lang', 'Morning city views', 'Reacted to your post', '2'],
    ['Hope Van Dyne', 'Flying over Manila!', 'Liked your post', '3'],
    ['Stephen Strange', 'I can do this all day!', 'Shared your post', '4'],
    ['Pepper Potts', 'Meet my rainbow pup!', 'Commented: So cute!', '5'],
    ['Nick Fury', 'Weekend hike done!', 'Reacted to your post', '1'],
    ['Maria Hill', 'Lunch with the team!', 'Liked your post', '2'],
    ['Happy Hogan', 'Sunday vibes', 'Commented: Nice one!', '3'],
    ['James Rhodes', 'Morning city views', 'Shared your post', '4'],
    ['Shuri', 'Flying over Manila!', 'Reacted to your post', '5'],
    ['Sam Alexander', 'Meet my rainbow pup!', 'Liked your post', '1'],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: ScreenUtil().screenWidth,
      child: ListView.separated(
        itemCount: _data.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final n = _data[index];
          return NotificationWidget(
            name: n[0],
            post: n[1],
            description: n[2],
            image: 'assets/images/ava${n[3]}.jpg',
          );
        },
      ),
    );
  }
}
