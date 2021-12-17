import 'package:flutsenger/Page/ChatPage.dart';
import 'package:flutsenger/type/type.dart';
import 'package:flutter/material.dart';

// class ScrollConv extends StatefulWidget {
//   final List<ConvTitle> convTitles;
//   const ScrollConv({Key? key, required this.convTitles}) : super(key: key);

//   @override
//   _ScrollConvState createState() => _ScrollConvState();
// }

// class _ScrollConvState extends State<ScrollConv> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: widget.convTitles.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           title: Text("Conversation $index"),
//         );
//       },
//     );
//   }
// }

class ScrollConv extends StatelessWidget {
  final List<ConvTitle> convTitles;

  const ScrollConv({Key? key, required this.convTitles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: convTitles.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(convTitles[index].title),
          leading: const CircleAvatar(
            backgroundImage: NetworkImage('https://picsum.photos/200/300'),
          ),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ChatScreen(value: convTitles[index].description),
            ),
          ),
        );
      },
    );
  }
}
