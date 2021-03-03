import 'package:flutter/material.dart';
import 'conversation.dart';

class Conversations extends StatefulWidget {
  @override
  _ConversationsState createState() => _ConversationsState();
}

TextEditingController _textController = TextEditingController();

class _ConversationsState extends State<Conversations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 15),
                child: ListView(children: [
                  Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Color(0xFFe9eaec),
                        borderRadius: BorderRadius.circular(15)),
                    child: TextField(
                      cursorColor: Color(0xFF000000),
                      controller: _textController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color(0xFF000000).withOpacity(0.5),
                          ),
                          hintText: "Search",
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: List.generate(conversationList.length, (index) {
                      return InkWell(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 60,
                                height: 60,
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      width: 70,
                                      height: 70,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  conversationList[index]
                                                      ['imageUrl']),
                                              fit: BoxFit.cover)),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    conversationList[index]['name'],
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width - 135,
                                    child: Text(
                                      conversationList[index]['message'] +
                                          " - " +
                                          conversationList[index]['time'],
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Color(0xFF000000)
                                              .withOpacity(0.7)),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  )
                ]))));
  }
}
