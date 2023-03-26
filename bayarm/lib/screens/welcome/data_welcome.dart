class Welcome {
  String title;
  String description;
  String image;

  Welcome(
      {required this.title, required this.description, required this.image});
}

var welcomeDatas = [
  Welcome(
      title: "Welcome to Bayarm",
      description:
          "Your online food product market",
      image: "assets/images/png/ecommerce.png"),
  Welcome(
      title: "Quick and easy purchase",
      description: "Buy your Agri-food products wholesale directly from the producer",
      image: "assets/images/png/poultry.png"),
  Welcome(
      title: "Are you a reseller?",
      description: "Create a large network of farmers and breeders",
      image: "assets/images/png/online.png"),
];
