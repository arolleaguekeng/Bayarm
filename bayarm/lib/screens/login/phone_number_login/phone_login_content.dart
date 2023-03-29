import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bayarm/constants/constants.dart';
import 'package:bayarm/screens/components/forms/costum_text_field.dart';
import '../../../services/auth_services.dart';
import 'verification_otp.dart';

class PhoneLoginContent extends StatefulWidget {
  const PhoneLoginContent({Key? key}) : super(key: key);

  @override
  State<PhoneLoginContent> createState() => _PhoneLoginContentState();
}

class _PhoneLoginContentState extends State<PhoneLoginContent> {
  bool loading = false;
  String phoneNumber = '+237695404527';
  void sendOtpCode() {
    loading = true;
    setState(() {});
    final _auth = FirebaseAuth.instance;
    if (phoneNumber.isNotEmpty) {
      AuthService.authWithPhoneNumber(phoneNumber, onCodeSend: (verificationId, v) {
        loading = false;
        setState(() {});
        Navigator.of(context).push(MaterialPageRoute(
            builder: (c) => VerificationOtp(
              verificationId: verificationId,
              phoneNumber: phoneNumber,
            )));
      }, onAutoVerify: (v) async {
        await _auth.signInWithCredential(v);
        Navigator.of(context).pop();
      }, onFailed: (e) {
        loading = false;
        setState(() {});
        print("Le code est erroné");
      }, autoRetrieval: (v) {});
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Container(
          width: 400,
          child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  const Text(
                    "Inscription",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomTextField(
                    onChanged: (value) {
                      phoneNumber = value;
                    }, hintText: '+237xxxxxxxxx', controller: TextEditingController(),icon: Icons.phone,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                            padding: const EdgeInsets.symmetric(vertical: 15)),
                        onPressed: loading ? null : sendOtpCode,
                        child: loading
                            ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.pink),
                        )
                            : const Text(
                          'Envoyer le code',
                          style: TextStyle(fontSize: 20),

                        ),
                      ),
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}