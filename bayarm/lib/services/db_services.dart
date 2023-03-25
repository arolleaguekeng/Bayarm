import 'dart:io';
import 'dart:typed_data';

import 'package:bayarm/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import 'package:image_picker_web/image_picker_web.dart';

class DataBaseService {
  CollectionReference _products =
      FirebaseFirestore.instance.collection('products');
  FirebaseStorage _storage = FirebaseStorage.instanceFor(bucket: "bayarm.appspot.com");

  // //upload image to Firebase Storage Mobile
  // Future<String> uploadFile() async {
  //   XFile? _pikedFile = await ImagePicker().pickImage(source: source);
  //   File file = File(_pikedFile!.path);
  //   Reference reference =
  //       _storage.ref().child('products/${DateTime.now()}.png');
  //   UploadTask uploadTask = reference.putFile(file);
  //   TaskSnapshot taskSnapshot = await uploadTask;
  //   return await taskSnapshot.ref.getDownloadURL();
  // }

  Future<String> startUpload(Uint8List? imageBytes) async {
    final FirebaseStorage storage = FirebaseStorage.instance;
    final Reference ref = storage.ref().child('products/${DateTime.now()}.png');
    final UploadTask uploadTask = ref.putData(imageBytes!);
    final snapshot = await uploadTask.whenComplete(() => print('Upload complete'));
    final downloadUrl =  snapshot.ref.getDownloadURL();
    return  downloadUrl;
  }

  // Add products in FireStore Database
  void addProduct(ProductModel productModel) {
    _products.add({
      "userId": productModel.userId,
      "name": productModel.name,
      "description": productModel.name,
      "price": productModel.price,
      "images": productModel.images,
      "pCreatedAt": FieldValue.serverTimestamp()
    });
  }

  Future<List<ProductModel>> getListeDesObjets() async {
    List<ProductModel> listeDesObjets = [];

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('products').get();

    for (DocumentSnapshot documentSnapshot in querySnapshot.docs) {
      ProductModel objet = ProductModel.fromFirestore(documentSnapshot);
      listeDesObjets.add(objet);
    }
    print("************************ Liste of products********************");
    print(listeDesObjets);
    return listeDesObjets;
  }
}


//
// required super.id,
// required super.user,
// required super.name,
// required super.description,
// required super.price,
// required super.images,
// this.quantity = 1,
// required super.tarrifModel,
// required super.created_at,
