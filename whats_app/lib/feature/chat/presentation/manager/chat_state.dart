part of 'chat_cubit.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}
class ChatSucess extends ChatState {
  final List<String> messageList;
  final List<DateTime> timeList;

  ChatSucess({required this.messageList,required this.timeList});
}


