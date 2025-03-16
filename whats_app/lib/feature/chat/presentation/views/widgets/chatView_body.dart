import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:whats_app/constatnts.dart';
import 'package:whats_app/feature/chat/presentation/manager/chat_cubit.dart';
import 'package:whats_app/feature/chat/presentation/views/widgets/chat_listView.dart';
import 'package:whats_app/feature/chat/presentation/views/widgets/custom_appBarChat.dart';
import 'package:whats_app/feature/chat/presentation/views/widgets/custom_textField.dart';

class ChatviewBody extends StatefulWidget {
  const ChatviewBody({super.key});

  @override
  State<ChatviewBody> createState() => _ChatviewBodyState();
}

class _ChatviewBodyState extends State<ChatviewBody> {
  GlobalKey<FormState> formKey1 = GlobalKey();
  List<String> messages = [];
  List<DateTime> time = [];
  ScrollController controller = ScrollController();

  TextEditingController textEditingController = TextEditingController();

  String? text;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String name = GoRouterState.of(context).extra as String;
    return Form(
      key: formKey1,
      child: Column(
        children: [
          const SizedBox(height: 40),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    width: 40,
                    child: Divider(color: kContainerColor, thickness: 4),
                  ),
                  const SizedBox(height: 15),
                  CustomAppbarChat(name: name),
                  const SizedBox(height: 20),
                  BlocBuilder<ChatCubit, ChatState>(
                    builder: (context, state) {
                      messages =
                          BlocProvider.of<ChatCubit>(context).messageList;
                      time = BlocProvider.of<ChatCubit>(context).timeList;
                      return ChatListview(
                        controller: controller,
                        messages: messages,
                        name: name,
                        time: time,
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                      left: 20,
                      bottom: 15,
                      top: 20,
                    ),
                    child: CustomTextfield(
                      controller: textEditingController,
                      onSubmitted: (data) {
                        if (formKey1.currentState!.validate()) {
                          BlocProvider.of<ChatCubit>(
                            context,
                          ).sendMessage(message: data, time: DateTime.now());

                          textEditingController.clear();

                          controller.animateTo(
                            0,
                            duration: const Duration(microseconds: 500),
                            curve: Curves.easeIn,
                          );
                        }
                      },
                      onChanged: (value) {
                        text = value;
                      },
                      onTap: () {
                        if (formKey1.currentState!.validate()) {
                          BlocProvider.of<ChatCubit>(
                            context,
                          ).sendMessage(message: text!, time: DateTime.now());

                          textEditingController.clear();
                          controller.animateTo(
                            0,
                            duration: const Duration(microseconds: 500),
                            curve: Curves.easeIn,
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
