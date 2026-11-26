import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dolosa_mobprog/constants.dart';
import 'package:dolosa_mobprog/widgets/custom_text.dart';

class NewsfeedCard extends StatelessWidget {
  const NewsfeedCard({
    super.key,
    required this.name,
    required this.date,
    required this.text,
    required this.likes,
    required this.avatar,
    this.image,
    this.hasPlaceholder = false,
  });

  final String name;
  final String date; // Enhancement 1: may petsa ang bawat post
  final String text;
  final int likes; // Enhancement 1: bilang ng likes
  final String avatar; // Enhancement 2: profile picture ng nag-post
  final String? image; // may picture o wala
  final bool hasPlaceholder; // may placeholder box o wala

  // Enhancement 1: ito ang nagdedesisyon kung may picture, placeholder, o wala
  Widget _buildMedia() {
    if (image != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          image!,
          width: double.infinity,
          fit: BoxFit.cover,
          cacheWidth: 600,
        ),
      );
    }
    if (hasPlaceholder) {
      return Container(
        height: ScreenUtil().setSp(180),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(Icons.image, size: 60, color: Colors.grey),
      );
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.all(ScreenUtil().setSp(10)),
      child: Padding(
        padding: EdgeInsets.all(ScreenUtil().setSp(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER: avatar, pangalan, petsa
            Row(
              children: [
                CircleAvatar(
                  radius: ScreenUtil().setSp(22),
                  backgroundImage: AssetImage(avatar),
                ),
                SizedBox(width: ScreenUtil().setSp(10)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: name,
                      fontSize: ScreenUtil().setSp(16),
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                    Row(
                      children: [
                        CustomText(
                          text: date,
                          fontSize: ScreenUtil().setSp(12),
                          color: Colors.grey,
                        ),
                        SizedBox(width: ScreenUtil().setSp(4)),
                        const Icon(Icons.public, size: 14, color: Colors.grey),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.more_horiz),
              ],
            ),
            SizedBox(height: ScreenUtil().setSp(10)),

            // TEXT NG POST
            CustomText(
              text: text,
              fontSize: ScreenUtil().setSp(14),
              color: Colors.black,
            ),
            SizedBox(height: ScreenUtil().setSp(10)),

            // PICTURE / PLACEHOLDER / WALA
            _buildMedia(),
            SizedBox(height: ScreenUtil().setSp(6)),

            // Enhancement 3: like, comment, share na widget (button)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.thumb_up, color: fbPrimary),
                  label: CustomText(
                    text: '$likes',
                    fontSize: ScreenUtil().setSp(14),
                    color: Colors.black,
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.mode_comment_outlined,
                    color: Colors.black54,
                  ),
                  label: CustomText(
                    text: 'Comment',
                    fontSize: ScreenUtil().setSp(14),
                    color: Colors.black,
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.share_outlined, color: Colors.black54),
                  label: CustomText(
                    text: 'Share',
                    fontSize: ScreenUtil().setSp(14),
                    color: Colors.black,
                  ),
                ),
              ],
            ),

            // COMMENT BOX
            Row(
              children: [
                CircleAvatar(
                  radius: ScreenUtil().setSp(14),
                  backgroundColor: Colors.blue.shade200,
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                SizedBox(width: ScreenUtil().setSp(8)),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setSp(12),
                      vertical: ScreenUtil().setSp(8),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: CustomText(
                      text: 'Write a comment...',
                      fontSize: ScreenUtil().setSp(12),
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: ScreenUtil().setSp(8)),
            CustomText(
              text: 'View all comments',
              fontSize: ScreenUtil().setSp(13),
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
