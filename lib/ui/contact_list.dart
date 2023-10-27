import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/chat_screen.dart';
import 'package:whatsapp_clone/utilities/colors.dart';
import 'package:whatsapp_clone/utilities/info.dart';

class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: info.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChatScreen()));
            },
            child: ListTile(
              leading: CircleAvatar(
                child: Text(
                  "P",
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: const Color.fromARGB(255, 43, 16, 90),
                // backgroundImage:
                //     NetworkImage(info[index]['profilePi'].toString()),
              ),
              title: Text(
                info[index]['name'].toString(),
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text(
                info[index]['message'].toString(),
                style: TextStyle(fontSize: 16, color: lightGrey),
              ),
              trailing: Text(info[index]['time'].toString()),
            ),
          );
        });
  }
}
