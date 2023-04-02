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

  ProductModel({
    this.id = '',
    required this.userId,
    required this.name,
    required this.description,
    required this.price,
    required this.images,
    required this.created_at,
  });
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

var productsData = <ProductModel>[
  ProductModel(
      userId: "ss",
      name: "Douala laying hen",
      description: "30 month old laying chickens",
      price: "56999",
      images: [
        "assets/images/png/poulet1.jpg",
        "assets/images/png/poulet2.jpg",
        "assets/images/png/poulet3.jpg",
      ],
      created_at: Timestamp.now()),
  ProductModel(
      userId: "devpea",
      name: "Bafoussam tomato",
      description: "tomato from the western lands",
      price: "45000",
      images: [
        "assets/images/png/tomate1.jpg",
        "assets/images/png/tomate2.jpg",
        "assets/images/png/tomate3.jpg",
      ],
      created_at: Timestamp.now()),
  
  ProductModel(
      userId: "devpea",
      name: "Kumba Banana",
      description: "good quality banana",
      price: "435100",
      images: [
        "assets/images/png/banane1.jpg",
        "assets/images/png/banane2.jpg",
      ],
      created_at: Timestamp.now()),
  ProductModel(
      userId: "devpea",
      name: "Village papaya",
      description: "natural papayas straight ",
      price: "104500",
      images: [
        "assets/images/png/papaye1.jpg",
        "assets/images/png/papaye2.jpg",
      ],
      created_at: Timestamp.now()),
  ProductModel(
      userId: "devpea",
      name: "Garoua beef",
      description: "Beef straight from farms",
      price: "45000",
      images: [
        "assets/images/png/boeuf1.jpg",
        "assets/images/png/boeuf2.jpg",
      ],
      created_at: Timestamp.now()),
];


var productsDataPop = <ProductModel>[
  ProductModel(
      userId: "devpea",
      name: "Kumba Banana",
      description: "good quality banana",
      price: "435100",
      images: [
        "assets/images/png/banane1.jpg",
        "assets/images/png/banane2.jpg",
      ],
      created_at: Timestamp.now()),
      ProductModel(
      userId: "devpea",
      name: "Garoua beef",
      description: "Beef straight from farms",
      price: "45000",
      images: [
        "assets/images/png/boeuf1.jpg",
        "assets/images/png/boeuf2.jpg",
      ],
      created_at: Timestamp.now()),
  ProductModel(
      userId: "ss",
      name: "Douala laying hen",
      description: "30 month old laying chickens",
      price: "56999",
      images: [
        "assets/images/png/poulet1.jpg",
        "assets/images/png/poulet2.jpg",
        "assets/images/png/poulet3.jpg",
      ],
      created_at: Timestamp.now()),
  ProductModel(
      userId: "devpea",
      name: "Bafoussam tomato",
      description: "tomato from the western lands",
      price: "45000",
      images: [
        "assets/images/png/tomate1.jpg",
        "assets/images/png/tomate2.jpg",
        "assets/images/png/tomate3.jpg",
      ],
      created_at: Timestamp.now()),
  
  
  ProductModel(
      userId: "devpea",
      name: "Village papaya",
      description: "natural papayas straight ",
      price: "104500",
      images: [
        "assets/images/png/papaye1.jpg",
        "assets/images/png/papaye2.jpg",
      ],
      created_at: Timestamp.now()),
  
];
