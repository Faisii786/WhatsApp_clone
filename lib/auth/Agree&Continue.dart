import 'package:flutter/material.dart';
import 'package:whatsapp_clone/utilities/colors.dart';
import 'package:whatsapp_clone/auth/create_your_profile.dart';

class AgreeAndContine extends StatelessWidget {
  const AgreeAndContine({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 140,
                backgroundImage: AssetImage("assets/images/whatsapp1.jpg"),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Wellcome to Whatsapp",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 300,
                child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                        text: "Tap ",
                        style: TextStyle(
                            color: Color.fromARGB(255, 95, 95, 95),
                            fontSize: 18),
                        children: [
                          TextSpan(
                            text: '"Agree & Continue" ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                          TextSpan(
                            text: 'to accept the whatsapp',
                          ),
                          TextSpan(
                            text: ' "Term of Services"',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: '  and privacy policy',
                          ),
                        ])),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SetupProfile(),
                    ),
                  );
                },
                child: Container(
                  width: 280,
                  height: 38,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(AuthBtnColor)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SetupProfile(),
                          ),
                        );
                      },
                      child: Text(
                        "Agree and Continue",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
