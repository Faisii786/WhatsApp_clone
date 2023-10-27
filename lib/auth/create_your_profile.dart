import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp_clone/utilities/colors.dart';
import 'package:whatsapp_clone/auth/initializing.dart';

class SetupProfile extends StatefulWidget {
  const SetupProfile({Key? key}) : super(key: key);

  @override
  _SetupProfileState createState() => _SetupProfileState();
}

class _SetupProfileState extends State<SetupProfile> {
  final GlobalKey<FormState> myKey = GlobalKey();
  final TextEditingController nameController = TextEditingController();

  File? selectedImage;

  Future pickImageFromGallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage == null) return;

    setState(() {
      selectedImage = File(pickedImage.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
          title: Text(
            "Create your Profile",
            style: TextStyle(
                color: AuthBtnColor, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: Container(
                width: 300,
                child: Text(
                  "Please provide your name and optional profile photo",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: lightGrey),
                )),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              selectedImage != null
                  ? InkWell(
                      onTap: () {
                        pickImageFromGallery();
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 90,
                        backgroundImage: FileImage(selectedImage!),
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        pickImageFromGallery();
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 90,
                        child: Icon(
                          Icons.person,
                          size: 100,
                        ),
                      ),
                    ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Icon(
                        Icons.person,
                        color: lightGrey,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Form(
                          key: myKey,
                          child: TextFormField(
                            controller: nameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Name is required Please enter your full name';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                hintText: 'Type your name here'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          surfaceTintColor: Colors.transparent,
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  if (myKey.currentState!.validate()) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Indicator()));
                  }
                },
                child: Container(
                  width: 130,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(profileBtnColor)),
                      onPressed: () {
                        if (myKey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Indicator()));
                        }
                      },
                      child: Text(
                        "Next",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
