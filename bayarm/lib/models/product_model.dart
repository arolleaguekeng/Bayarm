class ProductModel {
  final String id;
  final String name;
  final String description;
  final String price;
  List<String> images = ["assets/images/png/plant2.jpg"];

  ProductModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.images});
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
    required super.name,
    required super.description,
    required super.price,
    required super.images,
    this.quantity = 1,
  });
}

List<ProductModel> products2 = [
  ProductModel(
      id: '1',
      images: [
        'assets/images/png/plant2.jpg',
        'assets/images/png/plant3.jpg',
        'assets/images/png/plant4.jpg',
      ],
      name: 'Boston Ivy',
      description: 'Climbs their storied walls.',
      price: '\$13'),
  ProductModel(
      id: '1',
      images: [
        'assets/images/png/plant3.jpg',
        'assets/images/png/plant4.jpg',
        'assets/images/png/plant3.jpg'
      ],
      name: 'Green Succulent',
      price: '\$11',
      description: 'Store water in arid climates.'),
  ProductModel(
      id: '1',
      name: 'Dieffenbachia Bonsa',
      price: '\$10',
      images: [
        'assets/images/png/plant4.jpg',
        'assets/images/png/plant3.jpg',
        'assets/images/png/plant4.jpg',
      ],
      description: 'large group of beautiful tropical perennials'),
  ProductModel(
      id: '1',
      images: [
        'assets/images/png/plant3.jpg',
        'assets/images/png/plant4.jpg',
        'assets/images/png/plant.jpg'
      ],
      name: 'Plantagenia',
      description: 'Grown for their foliage rather than blooms',
      price: '\$9')
];
