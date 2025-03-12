import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  List<String> messageList = [];
  List<DateTime> timeList = [];

  void sendMessage({required String message, required DateTime time}) {
    messageList.insert(0,message);
    timeList.insert(0,time);

    emit(ChatSucess(messageList: messageList, timeList: timeList));
  }
}
