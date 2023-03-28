import 'dart:io';

import 'package:bayarm/main.dart';
import 'package:bayarm/screens/components/forms/custom_button.dart';
import 'package:bayarm/screens/shared_ui/showSnackBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../models/product_model.dart';
import '../../../services/db_services.dart';

class AddProductContent extends StatefulWidget {
  const AddProductContent({Key? key}) : super(key: key);

  @override
  State<AddProductContent> createState() => _AddProductContent();
}

class _AddProductContent extends State<AddProductContent> {
  bool isLoading = true;
  User? user = MyApp.auth.currentUser;
  String _user_id = '';
  File? file;
  XFile? _pickedFile;

  void initState() {}


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    bool imageShow = false;
    final _keyForm1 = GlobalKey<FormState>();
    final _keyForm2 = GlobalKey<FormState>();
    final _keyForm3 = GlobalKey<FormState>();
    String _pName = '';
    String _pDescription = '';
    String _price = '';
    _user_id = _user_id ?? " ";
    _user_id = user!.uid;
    String _formError = "Please Enter Produtc name";
    print("***********************************");
    print(user!.phoneNumber);
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            Container(
              width: 200,
              child: imageShow == false
                  ? IconButton(
                      onPressed: () {
                        setState(() async {
                          _pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                          file = File(_pickedFile!.path);
                          imageShow == true;
                        });
                      },
                      icon: const Icon(
                        Icons.add_photo_alternate_rounded,
                        size: 80,
                      ))
                  : kIsWeb
                  ? Image(
                image: NetworkImage(file!.path),
                fit: BoxFit.cover,
              )
                  : Image(
                image: FileImage(file!),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Form(
                key: _keyForm1,
                child: TextFormField(
                  maxLength: 30,
                  onChanged: (value) => _pName = value,
                  validator: (value) => _pName == '' ? _formError : null,
                  decoration: InputDecoration(
                    labelText: "Enter product name",
                    border: OutlineInputBorder(),
                  ),
                )),
            Form(
                key: _keyForm2,
                child: TextFormField(
                  maxLength: 30,
                  onChanged: (value) => _pDescription = value,
                  validator: (value) => _pDescription == '' ? _formError : null,
                  decoration: InputDecoration(
                    labelText: "enter product description",
                    border: OutlineInputBorder(),
                  ),
                )),
            Form(
                key: _keyForm3,
                child: TextFormField(
                  maxLength: 30,
                  onChanged: (value) => _price = value,
                  validator: (value) => _price == '' ? _formError : null,
                  decoration: InputDecoration(
                    labelText: "Enter price",
                    border: OutlineInputBorder(),
                  ),
                )),
            CustomButton(
                text: "Validate",
                onPressed: () {
                  onSubmit(
                    context: context,
                    price: _price,
                    pDescription: _pDescription,
                    keyForm1: _keyForm1,
                    keyForm2: _keyForm2,
                    keyForm3: _keyForm3,
                    pName: _pName,
                  );
                })
          ],
        ),
      ),
    );
  }

  void onSubmit(
      {context,
      keyForm1,
      keyForm2,
      keyForm3,
      required String pName,
      required String price,
      required String pDescription}) async {
    if (keyForm1.currentState!.validate() &&
        keyForm2.currentState!.validate() &&
        keyForm3.currentState!.validate()) {
      Navigator.of(context).pop();
      showNotification(context, "Loading...");
      DataBaseService _db = DataBaseService();
      String pUrlImg = await _db.uploadFile(file!, _pickedFile!);

      _db.addProduct(ProductModel(
          name: pName,
          userId: user!.uid,
          description: pDescription,
          price: price,
          images: [pUrlImg],
          created_at: Timestamp.now()));
    }
  }

  Form inputForm(GlobalKey<FormState> _keyForm, String _pName,
      String _formError, String labelText) {
    return Form(
        key: _keyForm,
        child: TextFormField(
          maxLength: 30,
          onChanged: (value) => _pName = value,
          validator: (value) => _pName == '' ? _formError : null,
          decoration: InputDecoration(
            labelText: labelText,
            border: OutlineInputBorder(),
          ),
        ));
  }
}
