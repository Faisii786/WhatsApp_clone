import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsapp_clone/auth/otp_page.dart';
import 'package:whatsapp_clone/ui/button.dart';

class PhoneNumber extends StatefulWidget {
  const PhoneNumber({super.key});

  @override
  State<PhoneNumber> createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController countrycontroller = TextEditingController();
  final SnakBarKey = GlobalKey<ScaffoldMessengerState>();
  bool loading = false;
  String countryvalue = '';

  // snackbar function
  void showSnakBar(String message) {
    final snakbar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: 4),
    );
    SnakBarKey.currentState?.showSnackBar(snakbar);
  }

  void LoginWithNumbe() {
    if (phonecontroller.text.isEmpty) {
      showSnakBar("Phone is Empty");
    } else {
      phoneNumber();
    }
  }

  Future phoneNumber() async {
    setState(() {
      loading = true;
    });
    String fullphonenumber = '+' + countryvalue + phonecontroller.text;

    print("$fullphonenumber");
    FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: fullphonenumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          showSnakBar("$e");
          setState(() {
            loading = false;
          });
        },
        codeSent: (String verificationId, int? token) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      VerifyPhoneNumber(verificationIddd: verificationId)));
        },
        codeAutoRetrievalTimeout: (e) {
          showSnakBar("$e");
          setState(() {
            loading = false;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        child: ScaffoldMessenger(
          key: SnakBarKey,
          child: Scaffold(
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Verify Your Number",
                    style: GoogleFonts.alatsi(
                        fontSize: 22, color: Color.fromARGB(255, 61, 50, 204)),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    "Please enter your country and your phone number.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.alatsi(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 1),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 50,
                            child: TextFormField(
                              controller: countrycontroller,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: TextButton(
                                    onPressed: () {
                                      showCountryPicker(
                                        favorite: ['PK'],
                                        countryListTheme: CountryListThemeData(
                                            backgroundColor: Colors.grey[300],
                                            bottomSheetHeight: 400,
                                            flagSize: 20,
                                            inputDecoration: InputDecoration(
                                                hintText: 'Enter Country Name',
                                                labelText: 'Search Country'),
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(5),
                                              topLeft: Radius.circular(5),
                                            )),
                                        context: context,
                                        onSelect: (Country country) {
                                          countryvalue = country.phoneCode;
                                          setState(() {});
                                        },
                                      );
                                    },
                                    child: Text(
                                      "+$countryvalue",
                                    ),
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 3),
                            child: Text(
                              "|",
                              style: TextStyle(
                                  fontSize: 35,
                                  color: Color.fromARGB(255, 104, 102, 102)),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: phonecontroller,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Phone',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MyButoon(
                      loading: loading,
                      title: 'Request OTP',
                      onPressed: () {
                        LoginWithNumbe();
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
