class Product {
  final String name;
  final String desc;
  final String price;
  final String imgUrl;
  Product(
      {required this.name,
      required this.desc,
      required this.price,
      required this.imgUrl});
}

List<Product> products = [
  Product(
      imgUrl: 'plant2.jpg',
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
      imgUrl: 'plant4.jpg',
      desc: 'large group of beautiful tropical perennials'),
  Product(
      imgUrl: 'plant.jpg',
      name: 'Plantagenia',
      desc: 'Grown for their foliage rather than blooms',
      price: '\$9')
];
