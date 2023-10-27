import 'package:flutter/material.dart';
import 'package:whatsapp_clone/utilities/colors.dart';
import 'package:whatsapp_clone/ui/BotNavBar.dart';
import 'package:whatsapp_clone/ui/contact_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final screens = [
  //   SplashScren(),
  //   Updates(),
  //   Community(),
  //   Calls(),
  // ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: ContactList(),
        // body: screens[currentIndexstate],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: appBarColor,
          //backgroundColor: const Color.fromARGB(255, 35, 151, 39),
          automaticallyImplyLeading: false,
          title: Text(
            "WhatsApp",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
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
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          backgroundColor: AuthBtnColor,
          onPressed: () {},
          child: Icon(
            Icons.comment,
            color: Colors.white,
          ),
        ),

        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
