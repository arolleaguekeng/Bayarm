class ProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  List<String> images = [];

  ProductModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.price});
}
