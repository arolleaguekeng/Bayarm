
import 'dart:io';
import 'dart:typed_data';

import 'package:bayarm/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class DataBaseService {
  CollectionReference _products =
      FirebaseFirestore.instance.collection('products');


  CollectionReference _cars = FirebaseFirestore.instance.collection('cars');
  FirebaseStorage _storage = FirebaseStorage.instance;

  // upload de l'image vers Firebase Storage
  Future<String> uploadFile(File file, XFile fileWeb) async {
    Reference reference = _storage.ref().child('products/${DateTime.now()}.png');
    Uint8List imageTosave = await fileWeb.readAsBytes();
    SettableMetadata metaData = SettableMetadata(contentType: 'image/jpeg');
    UploadTask uploadTask = kIsWeb
        ? reference.putData(imageTosave, metaData)
        : reference.putFile(file);
    TaskSnapshot taskSnapshot = await uploadTask;
    return await taskSnapshot.ref.getDownloadURL();
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

    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('products').get();

    for (DocumentSnapshot documentSnapshot in querySnapshot.docs) {
      ProductModel objet = ProductModel.fromFirestore(documentSnapshot);
      listeDesObjets.add(objet);
    }
    print("************************ Liste of products********************");
    print(listeDesObjets);
    return listeDesObjets;
  }
}

