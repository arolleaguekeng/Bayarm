import 'dart:io';

import 'package:bayarm/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class CardDialog{
  User? user;
  CardDialog({this.user});

  //display dialog
  void showCardDialog(BuildContext context, ImageSource source ) async{
    XFile? _pikedFile = await ImagePicker().pickImage(source: source);
    File _file = File(_pikedFile!.path);
    var size = MediaQuery.of(context).size;
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: size.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: 300,
                  width: size.width *0.6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: lightTextColor,
                    image: DecorationImage(
                      image: kIsWeb ? Image.network(_file.path).image : FileImage(_file),
                      fit: BoxFit.cover,
                    )
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}