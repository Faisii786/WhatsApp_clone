import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/home.dart';
import 'package:whatsapp_clone/utilities/colors.dart';

class Indicator extends StatefulWidget {
  const Indicator({super.key});

  @override
  State<Indicator> createState() => _IndicatorState();
}

class _IndicatorState extends State<Indicator> {
  @override
  void initState() {
    super.initState();

    // Delay for 3 seconds and then navigate to the next page
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    "Initializing...",
                    style: TextStyle(
                        fontSize: 18,
                        color: appBarColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Please wait a moment",
                    style: TextStyle(
                        fontSize: 15,
                        color: lightGrey,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            CircleAvatar(
              radius: 140,
              backgroundImage: AssetImage("assets/images/whatsapp1.jpg"),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
