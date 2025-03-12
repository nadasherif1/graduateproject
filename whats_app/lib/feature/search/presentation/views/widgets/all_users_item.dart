import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:whats_app/constatnts.dart';
import 'package:whats_app/core/utils/app_route.dart';
import 'package:whats_app/core/utils/styles.dart';
import 'package:whats_app/feature/home/presentation/views/widgets/story_item.dart';

class AllUsersItem extends StatelessWidget {
  const AllUsersItem({super.key, required this.name});
final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          horizontalTitleGap: 20,
          contentPadding: EdgeInsets.zero,
          onTap: () {
            GoRouter.of(context).push(AppRoute.kChatPath, extra: name);
          },
          leading: const StoryItem(
            size: 40,
            sizeImage: 40,
          ),
          title: Text(
            name,
            style: Styles.textStyle18.copyWith( fontWeight: FontWeight.w600, fontFamily: kCarosFont),
          ),
        ),
        Divider(
          color: kContainerColor,
          indent: 75,
          endIndent: 10,
        )
      ],
    );
  }
}
