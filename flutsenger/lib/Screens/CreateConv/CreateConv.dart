import 'package:chat/Api/Apirequest.dart';
import 'package:chat/components/primary_button.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class CreateConv extends StatefulWidget {
  CreateConv({Key? key}) : super(key: key);

  @override
  _CreateConvState createState() => _CreateConvState();
}

class _CreateConvState extends State<CreateConv> {
  TextEditingController _title = TextEditingController();
  TextEditingController _user_username = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              children: [
                Spacer(
                  flex: 3,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Title of your Conv",
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontWeight: FontWeight.normal),
                    textAlign: TextAlign.left,
                  ),
                ),
                TextField(controller: _title),
                Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "the username of your contact",
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontWeight: FontWeight.normal),
                    textAlign: TextAlign.left,
                  ),
                ),
                TextField(controller: _user_username),
                Spacer(
                  flex: 3,
                ),
                Spacer(),
                PrimaryButton(
                  press: () {
                    if (_title.text.length == 0 ||
                        _user_username.text.length == 0) return;
                    createConv(_title.text, _user_username.text);
                    Navigator.pop(context);
                    // Login_usage(_username.text, _password.text, context);
                  },
                  text: "Create",
                ),
                Spacer(
                  flex: 4,
                )
              ],
            ),
          ),
        ));
  }

  AppBar buildAppBar(context) {
    return AppBar(
      // automaticallyImplyLeading: false,
      title: Text("Create Conv"),
    );
  }
}
