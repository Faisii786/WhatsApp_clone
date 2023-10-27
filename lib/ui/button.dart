import 'package:flutter/material.dart';
import 'package:whatsapp_clone/utilities/colors.dart';

class MyButoon extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final bool loading;
  const MyButoon(
      {super.key,
      required this.title,
      required this.onPressed,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310,
      height: 45,
      decoration: BoxDecoration(
          //color: const Color.fromARGB(255, 26, 114, 29),
          color: AuthBtnColor,
          //color: const Color.fromARGB(255, 36, 9, 83),
          borderRadius: BorderRadius.circular(300)),
      child: TextButton(
          onPressed: onPressed,
          child: loading
              ? const CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Colors.white,
                )
              : Center(
                  child: Text(
                    title,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )),
    );
  }
}
