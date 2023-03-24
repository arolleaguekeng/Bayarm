import 'package:bayarm/constants/constants.dart';
import 'package:bayarm/screens/components/forms/costum_text_field.dart';
import 'package:bayarm/screens/profiles/profiles_screen.dart';
import 'package:bayarm/screens/profiles/widgets/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../components/forms/custom_button.dart';
//import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

//import 'widgets/profile_menu.dart';

class UpdateProfileContent extends StatefulWidget {
  const UpdateProfileContent({Key? key}) : super(key: key);

  @override
  State<UpdateProfileContent> createState() => _UpdateProfileContent();
}

class _UpdateProfileContent extends State<UpdateProfileContent> {
  String _date = "Not set";
  //final TextEditingController genderController = TextEditingController();
  final genders = ['Male', 'Female'];
  String? gender = 'Male';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    TextEditingController nameControler = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => ProfileScreen()));
          },
        ),
        title: Text("Edit Profile",
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.apply(color: Colors.black, fontWeightDelta: 5)),
        elevation: 0,
      ),
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 80),
                Form(
                    child: Column(
                  children: [
                    TextFormField(
                        decoration: const InputDecoration(
                            label: Text("First name"),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            hoverColor: Colors.grey)),
                    const SizedBox(height: 20),
                    TextFormField(
                        decoration: const InputDecoration(
                            label: Text("Last name"),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            hoverColor: Colors.grey)),
                    const SizedBox(height: 20),
                    TextFormField(
                        decoration: const InputDecoration(
                            label: Text("Birthday"),
                            prefixIcon: Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            hoverColor: Colors.grey)),
                    const SizedBox(height: 20),
                    TextFormField(
                        decoration: const InputDecoration(
                            label: Text("Email"),
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            hoverColor: Colors.grey)),
                    const SizedBox(height: 20),
                    IntlPhoneField(
                      decoration: const InputDecoration(
                          labelText: 'Phone Number',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                      initialCountryCode: 'CM',
                    ),
                    const SizedBox(height: 20),
                    Container(
                      //margin: EdgeInsets.all(2),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey, width: 1)),
                      child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                        value: gender,
                        iconSize: 36,
                        icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                        isExpanded: true,
                        items: genders.map(buildMenuGender).toList(),
                        onChanged: (value) =>
                            setState(() => this.gender = value),
                      )),
                    ),
                    const SizedBox(height: 200),
                    CustomButton(
                        text: "Update",
                        width: size.width * 0.8,
                        onPressed: () {})
                  ],
                ))
              ],
            )),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuGender(String gender) => DropdownMenuItem(
        value: gender,
        child: Text(
          gender,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      );
}
