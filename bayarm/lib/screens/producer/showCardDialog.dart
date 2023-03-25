// import 'dart:io';
//
// import 'package:bayarm/constants/constants.dart';
// import 'package:bayarm/models/product_model.dart';
// import 'package:bayarm/screens/components/forms/custom_button.dart';
// import 'package:bayarm/services/db_services.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:image_picker_web/image_picker_web.dart';
//
// import '../shared_ui/showSnackBar.dart';
//
// class CardDialog {
//   User? user;
//   CardDialog({this.user});
//
//   //display dialog
//   void showCardDialog(BuildContext context, ImageSource source) async {
//     final pickedFile = await ImagePickerWeb.getImageInfo;
//     final String? fileName = pickedFile!.fileName;
//     final imageBytes = pickedFile.data;
//     var size = MediaQuery.of(context).size;
//     final _keyForm = GlobalKey<FormState>();
//     String _pName = '';
//     String _pDescription = '';
//     String _price = '';
//     String _formError = "Please Enter Produtc name";
//     // ignore: use_build_context_synchronously
//     showModalBottomSheet<void>(
//       context: context,
//       builder: (BuildContext context) {
//         return SizedBox(
//           height: size.height,
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Container(
//                   height: 300,
//                   width: size.width * 0.6,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: lightTextColor,
//                       image: DecorationImage(
//                         image: Image.network(pickedFile.fileName!).image,
//                         fit: BoxFit.cover,
//                       )),
//                 ),
//                 Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Form(
//                           key: _keyForm,
//                           child: TextFormField(
//                             maxLength: 30,
//                             onChanged: (value) => _pName = value,
//                             validator: (value) =>
//                                 _pName == '' ? _formError : null,
//                             decoration: const InputDecoration(
//                               labelText: 'Nom de la voiture',
//                               border: OutlineInputBorder(),
//                             ),
//                           )),
//                     ),
//                     Wrap(
//                       children: [
//                         CustomButton(
//                             text: "Back",
//                             onPressed: () {
//                               Navigator.of(context).pop();
//                             }),
//                         CustomButton(text: "Validate", onPressed: () => onSubmit(context, _keyForm, pickedFile, _pName, user!)),
//                       ],
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   void onSubmit(context, keyForm,  file, pName,User user) async {
//     if (keyForm.currentState!.validate()) {
//       Navigator.of(context).pop();
//       showNotification(context, "Loading...");
//       final pickedFile = await ImagePickerWeb.getImageInfo;
//       DataBaseService _db = DataBaseService();
//       String _pUrlImg = await _db.startUpload(pickedFile!.data);
//       _db.addProduct(ProductModel(
//           user: user,
//           name: pName,
//           description: "description",
//           price: "3300",
//           images: [_pUrlImg],
//           tarrifModel: [],
//           created_at: Timestamp.now()));
//     }
//   }
// }
