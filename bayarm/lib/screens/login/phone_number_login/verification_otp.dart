import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bayarm/constants/responsive.dart';
import 'package:bayarm/screens/navigations/navigation_screen.dart';
import 'package:pinput/pinput.dart';

import '../../../constants/constants.dart';
import '../../../services/auth_services.dart';

class VerificationOtp extends StatefulWidget {
  const VerificationOtp(
      {Key? key, required this.verificationId, required this.phoneNumber})
      : super(key: key);
  final String verificationId;
  final String phoneNumber;

  @override
  State<VerificationOtp> createState() => _VerificationOtpState();
}

class _VerificationOtpState extends State<VerificationOtp> {
  String smsCode = "";
  bool loading = false;
  bool resend = false;
  int count = 20;

  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    decompte();
  }

  late Timer timer;

  void decompte() {
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (count < 1) {
        timer.cancel();
        count = 20;
        resend = true;
        setState(() {});
        return;
      }
      count--;
      setState(() {});
    });
  }

  void onResendSmsCode() {
    resend = false;
    setState(() {});
    AuthService.authWithPhoneNumber(widget.phoneNumber, onCodeSend: (verificationId, v) {
      loading = false;
      decompte();
      setState(() {});
    }, onAutoVerify: (v) async {
      await _auth.signInWithCredential(v);
      Navigator.of(context).pop();
    }, onFailed: (e) {
      loading = false;
      setState(() {});
      print("Le code est erroné");
    }, autoRetrieval: (v) {});
  }

  void onVerifySmsCode() async {
    loading = true;
    setState(() {});
    await AuthService.validateOtp(smsCode, widget.verificationId);
    loading = true;
    setState(() {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> kIsWeb? NavigationScreen() : NavigationScreen()));
    print("Vérification éfectué avec succès");
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              width: Responsive.isMobile(context) ? size.width : 400,
              child: Column(
                children: [
                  const Text(
                    "Verification Otp",
                    style: TextStyle(
                      fontSize: 30,
                      color: primaryColor,
                    ),
                  ),
                  const Text(
                    "Vérifiers vos messages pour valider",
                    style: TextStyle(
                      fontSize: 14,
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Pinput(
                    length: 6,
                    onChanged: (value) {
                      smsCode = value;
                      setState(() {});
                    },
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: !resend ? null : onResendSmsCode,
                      child: Text(!resend
                          ? "00:${count.toString().padLeft(2, "0")}"
                          : "resend code"),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                            padding: const EdgeInsets.symmetric(vertical: 15)),
                        onPressed: smsCode.length < 6 || loading
                            ? null
                            : onVerifySmsCode,
                        child: loading
                            ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        )
                            : const Text(
                          'Verifier',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}