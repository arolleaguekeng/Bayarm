class ProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  List<String> images = ["assets/images/png/plant2.jpg"];

  ProductModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.price});
}

class ProductModelCart extends ProductModel {
   int quantity = 1;
  void setquantity(int quantity){
    this.quantity = quantity;
  }
  int getquantity(){
    return this.quantity;
  }
  ProductModelCart(
      {required super.id,
      required super.name,
      required super.description,
      required super.price,this.quantity = 1,});
}
