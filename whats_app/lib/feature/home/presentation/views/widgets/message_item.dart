import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:whats_app/constatnts.dart';
import 'package:whats_app/core/utils/app_route.dart';
import 'package:whats_app/core/utils/styles.dart';
import 'package:whats_app/core/utils/widgets/custom_iconButton.dart';
import 'package:whats_app/feature/home/presentation/views/widgets/story_item.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({
    super.key,
    required this.notify,
    required this.name,
    required this.id,
    this.onDismissed,
  });
  final int notify;
  final String name, id;
  final Function(DismissDirection)? onDismissed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Dismissible(
        onDismissed: (direction) {},
        key: Key(id),
        secondaryBackground: Container(
          padding: const EdgeInsets.only(right: 20),
          alignment: Alignment.centerRight,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: const CustomIconButton(
            size: 40,
            iconSize: 25,
            background: kNotifyColor,
            icon: Icons.delete_rounded,
          ),
        ),
        background: Container(
          padding: const EdgeInsets.only(left: 30),
          alignment: Alignment.centerLeft,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: const CustomIconButton(
            size: 40,
            iconSize: 25,
            background: kNotifyColor,
            icon: Icons.delete_rounded,
          ),
        ),
        child: Column(
          children: [
            ListTile(
              onTap: () {
                GoRouter.of(context).push(AppRoute.kChatPath, extra: name);
              },
              leading: const StoryItem(
                size: 40,
                 sizeImage: 40,
              ),
              title: Text(
                name,
                style: Styles.textStyle18.copyWith(
                    fontWeight: FontWeight.w600, fontFamily: kCarosFont),
              ),
              subtitle: const Text('hi how are you, see you soon',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle16),
              trailing: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    DateFormat('h:mm').format(DateTime.now()),
                    style: Styles.textStyle16,
                  ),
                  notification()
                ],
              ),
            ),
            Divider(
              color: kContainerColor,
              indent: 110,
            )
          ],
        ),
      ),
    );
  }

  Widget notification() {
    if (notify == 0) {
      return const SizedBox();
    } else {
      return Container(
        height: 25,
        width: 25,
        decoration:
            const BoxDecoration(color: kNotifyColor, shape: BoxShape.circle),
        child: Center(
          child: Text('$notify', style: Styles.textStyle14),
        ),
      );
    }
  }
}
