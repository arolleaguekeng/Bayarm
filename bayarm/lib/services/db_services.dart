import 'dart:io';
import 'dart:typed_data';

import 'package:bayarm/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

/// Data operations manager.
///
/// You can upload image on firebase by calling [uploadFile].
/// For example:
///
/// ```dart
/// DataBaseService database =DataBaseService();
/// database.uploadFile(file, fileWeb);
///
/// database.addProduct(productModel);
/// ```
class DataBaseService {
  final CollectionReference _products =
      FirebaseFirestore.instance.collection('products');
  final FirebaseStorage _storage = FirebaseStorage.instance;

  /// Upload a [File] to Firebase Starage.
  Future<String> uploadFile(File file, XFile fileWeb) async {
    Reference reference =
        _storage.ref().child('products/${DateTime.now()}.png');
    Uint8List imageTosave = await fileWeb.readAsBytes();
    SettableMetadata metaData = SettableMetadata(contentType: 'image/jpeg');
    UploadTask uploadTask = kIsWeb
        ? reference.putData(imageTosave, metaData)
        : reference.putFile(file);
    TaskSnapshot taskSnapshot = await uploadTask;
    return await taskSnapshot.ref.getDownloadURL();
  }

  // Add products in FireStore Database
  /// Write a [ProductModel] to Firebase Firestore.
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

  /// Get all products in Firestore and map to  [ProductModel] to Firebase Firestore.
  Future<List<ProductModel>> getAllProducts() async {
    List<ProductModel> listeDesObjets = [];

    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('products').get();

    for (DocumentSnapshot documentSnapshot in querySnapshot.docs) {
      ProductModel objet = ProductModel.fromFirestore(documentSnapshot);
      listeDesObjets.add(objet);
    }
    print("************************ products list********************");
    print(listeDesObjets);
    return listeDesObjets;
  }
}
