import 'package:bayarm/models/product_tarrif_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProductModel {
  final String id;
  final String name;
  final String description;
  final String price;
  final String userId;
  final Timestamp created_at;
  List<dynamic> images = ["assets/images/png/plant2.jpg"];

  factory ProductModel.fromFirestore(DocumentSnapshot documentSnapshot) {
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;


    return ProductModel(
      id: documentSnapshot.id,
      name: data['name'] as String,
      description: data['description'] as String,
      price: data['price'] as String,
      userId: data['userId'] as String,
      created_at: data['pCreatedAt'] as Timestamp,
      images: data['images'] as List<dynamic>,
    );
  }

  ProductModel(
      {this.id='',
      required this.userId ,
      required this.name,
      required this.description,
      required this.price,
      required this.images,
      required this.created_at, });


}

class ProductModelCart extends ProductModel {
  int quantity = 1;
  void setquantity(int quantity) {
    this.quantity = quantity;
  }

  int getquantity() {
    return this.quantity;
  }

  ProductModelCart({
    required super.id,
    required super.userId,
    required super.name,
    required super.description,
    required super.price,
    required super.images,
    this.quantity = 1,
    required super.created_at,
  });
}

DocumentReference<Map<String, dynamic>> _products =
FirebaseFirestore.instance.doc('products');

var productsData =  <ProductModel>[

];

