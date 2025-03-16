import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whats_app/constatnts.dart';
import 'package:whats_app/core/utils/styles.dart';
import 'package:whats_app/core/utils/widgets/custom_iconButton.dart';

class CustomAppbarChat extends StatelessWidget {
  const CustomAppbarChat({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: 150,
              child: Text(
                name,
                style: Styles.textStyle30.copyWith(
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                    fontFamily: kCarosFont),
              )),
          CustomIconButton(
            icon: FontAwesomeIcons.phoneFlip,
            color: const Color.fromARGB(255, 40, 18, 91),
            size: 45,
            iconSize: 18,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
