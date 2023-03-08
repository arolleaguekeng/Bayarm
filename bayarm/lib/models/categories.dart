import 'package:bayarm/models/product.dart';

class Categorie {
  final String name;
  final List<Product> product;
  bool isSelected;
  Categorie(
      {required this.name, required this.product, required this.isSelected});
}

List<Categorie> categories = [
  Categorie(
    name: 'All',
    product: [
      Product(
          imgUrl: 'plant3.jpg',
          name: 'Boston Ivy',
          desc: 'Climbs their storied walls.',
          price: '\$13'),
      Product(
          imgUrl: 'plant3.jpg',
          name: 'Green Succulent',
          price: '\$11',
          desc: 'Store water in arid climates.'),
      Product(
          name: 'Dieffenbachia Bonsa',
          price: '\$10',
          imgUrl: 'plant3.jpg',
          desc: 'large group of beautiful tropical perennials'),
      Product(
          imgUrl: 'plant3.jpg',
          name: 'Plantagenia',
          desc: 'Grown for their foliage rather than blooms',
          price: '\$9'),
    ],
    isSelected: false,
  ),
  Categorie(
    name: 'Monsteria',
    product: [
      Product(
          imgUrl: 'plant3.jpg',
          name: 'Boston Ivy',
          desc: 'Climbs their storied walls.',
          price: '\$13'),
      Product(
          imgUrl: 'plant3.jpg',
          name: 'Green Succulent',
          price: '\$11',
          desc: 'Store water in arid climates.'),
    ],
    isSelected: false,
  ),
  Categorie(
    name: 'Aloe',
    product: [
      Product(
          name: 'Dieffenbachia Bonsa',
          price: '\$10',
          imgUrl: 'plant3.jpg',
          desc: 'large group of beautiful tropical perennials'),
      Product(
          imgUrl: 'plant3.jpg',
          name: 'Plantagenia',
          desc: 'Grown for their foliage rather than blooms',
          price: '\$9'),
    ],
    isSelected: false,
  ),
  Categorie(
    name: 'Palm',
    product: [
      Product(
          imgUrl: 'plant3.jpg',
          name: 'Plantagenia',
          desc: 'Grown for their foliage rather than blooms',
          price: '\$9'),
      Product(
          imgUrl: 'plant3.jpg',
          name: 'Green Succulent',
          price: '\$11',
          desc: 'Store water in arid climates.'),
    ],
    isSelected: false,
  ),
  Categorie(
    name: 'Yamm',
    product: [
      Product(
          imgUrl: 'plant3.jpg',
          name: 'Boston Ivy',
          desc: 'Climbs their storied walls.',
          price: '\$13'),
      Product(
          imgUrl: 'plant3.jpg',
          name: 'Plantagenia',
          desc: 'Grown for their foliage rather than blooms',
          price: '\$9'),
    ],
    isSelected: false,
  ),
  Categorie(
    name: 'Other',
    product: [
      Product(
          imgUrl: 'plant3.jpg',
          name: 'Boston Ivy',
          desc: 'Climbs their storied walls.',
          price: '\$13'),
      Product(
          imgUrl: 'plant3.jpg',
          name: 'Green Succulent',
          price: '\$11',
          desc: 'Store water in arid climates.'),
    ],
    isSelected: false,
  ),
  Categorie(
    name: 'OK',
    product: [
      Product(
          imgUrl: 'plant3.jpg',
          name: 'Boston Ivy',
          desc: 'Climbs their storied walls.',
          price: '\$13'),
      Product(
          name: 'Dieffenbachia Bonsa',
          price: '\$10',
          imgUrl: 'plant3.jpg',
          desc: 'large group of beautiful tropical perennials'),
    ],
    isSelected: false,
  ),
];
