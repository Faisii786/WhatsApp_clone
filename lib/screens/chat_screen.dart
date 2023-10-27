import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/profile.dart';
import 'package:whatsapp_clone/utilities/colors.dart';
import 'package:whatsapp_clone/screens/home.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                icon: Icon(Icons.arrow_back)),
            CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage("assets/images/man.png"),
            ),
          ],
        ),
        leadingWidth: 78,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: appBarColor,
        title: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfileScreen()));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Faisal ",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Text(
                "last seen today at 9:26 pm",
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.call,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              )),
        ],
      ),
      body: Container(
        color: lightGrey,
      ),
      bottomNavigationBar: Container(
        height: 65,
        child: BottomAppBar(
          color: lightGrey,
          surfaceTintColor: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    height: 40,
                    child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.emoji_emotions_sharp),
                          isDense: true,
                          hintText: 'Message',
                          border: InputBorder.none),
                    ),
                  )),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    child: Icon(
                      Icons.mic,
                      color: Colors.white,
                    ),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: AuthBtnColor,
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
