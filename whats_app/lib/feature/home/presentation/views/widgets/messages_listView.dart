import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whats_app/feature/home/presentation/views/widgets/message_item.dart';

class MessagesListview extends StatefulWidget {
  const MessagesListview({super.key, required this.notify});
  final int notify;

  @override
  State<MessagesListview> createState() => _MessagesListviewState();
}

class _MessagesListviewState extends State<MessagesListview> {
  List<String> names = [
    'Shane Haq',
    'Gualtiero Cea',
    'Maria Zarco',
    'Rosita Marcos',
   'Shane Haq',
    'Gualtiero Cea',
    'Maria Zarco',
    'Rosita Marcos',
    'Shane Haq',
    'Gualtiero Cea',
    'Maria Zarco',
    'Rosita Marcos',
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * ((names.length +1 )/10 ) ,
      child: Padding(
        padding: const EdgeInsets.only(top: 45),
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: names.length,
          itemBuilder: (context, index) {
            return MessageItem(
              onDismissed: (direction) {
                setState(() {
                  names.removeAt(index);
                });
              },
              id: names[index],
              name: names[index],
              notify: widget.notify,
            );
          },
        ),
      ),
    );
  }
}
