import 'package:flutter/material.dart';
import 'package:whats_app/constatnts.dart';
import 'package:whats_app/core/utils/styles.dart';

class SearchTextfield extends StatefulWidget {
  const SearchTextfield({super.key, required this.onChanged});
  final Function(String) onChanged;

  @override
  State<SearchTextfield> createState() => _SearchTextfieldState();
}

class _SearchTextfieldState extends State<SearchTextfield> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textInputAction: TextInputAction.search,
      onChanged: widget.onChanged,
      showCursor: true,
      cursorColor: kPrimarycolor,
      style: Styles.textStyle16.copyWith(
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: kContainerColor,
        suffix: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: IconButton(
            onPressed: () {
              controller.clear();
             
            },
            icon: const Icon(
              Icons.clear_all_rounded,
              color: Colors.black,

             
            ),
          ),
        ),
        prefixIcon: const Icon(
          Icons.search,
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: kContainerColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: kContainerColor)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: kContainerColor)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: kContainerColor)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: kContainerColor)),
        hintText: "Search...",
        hintStyle: Styles.textStyle16
            .copyWith(fontWeight: FontWeight.w600, color: Colors.black),
        errorStyle: Styles.textStyle16.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
