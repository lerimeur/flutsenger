import 'package:flutter/material.dart';

List conversationList = [
  {
    "name": "Novac",
    "imageUrl": "<https://randomuser.me/api/portraits/men/31.jpg>",
    "message": "Where are you?",
    "time": "5:00 pm"
  },
  {
    "name": "Derick",
    "imageUrl": "<https://randomuser.me/api/portraits/men/81.jpg>",
    "message": "It's good!!",
    "time": "7:00 am"
  },
  {
    "name": "Mevis",
    "imageUrl": "<https://randomuser.me/api/portraits/women/49.jpg>",
    "message": "I love You too!",
    "time": "6:50 am"
  },
  {
    "name": "Emannual",
    "imageUrl": "<https://randomuser.me/api/portraits/men/35.jpg>",
    "message": "Got to go!! Bye!!",
    "time": "yesterday"
  },
  {
    "name": "Gracy",
    "imageUrl": "<https://randomuser.me/api/portraits/women/56.jpg>",
    "message": "Sorry, I forgot!",
    "time": "2nd Feb"
  },
  {
    "name": "Robert",
    "imageUrl": "<https://randomuser.me/api/portraits/men/36.jpg>",
    "message": "No, I won't go!",
    "time": "28th Jan"
  },
  {
    "name": "Lucy",
    "imageUrl": "<https://randomuser.me/api/portraits/women/56.jpg>",
    "message": "Hahahahahaha",
    "time": "25th Jan"
  },
  {
    "name": "Emma",
    "imageUrl": "<https://randomuser.me/api/portraits/women/56.jpg>",
    "message": "Been a while!",
    "time": "15th Jan"
  }
];

conversations(BuildContext context) {
  return Column(
    children: List.generate(conversationList.length, (index) {
      return InkWell(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            children: <Widget>[
              Container(
                width: 60,
                height: 60,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    conversationList[index]['name'],
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 135,
                    child: Text(
                      conversationList[index]['message'] +
                          " - " +
                          conversationList[index]['time'],
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF000000).withOpacity(0.7)),
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
  );
}
