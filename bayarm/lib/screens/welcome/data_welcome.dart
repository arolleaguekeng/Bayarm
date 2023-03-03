class Welcome {
  String title;
  String description;
  String image;

  Welcome(
      {required this.title, required this.description, required this.image});
}

var welcomeDatas = [
  Welcome(
      title: "Bienvenue Sur Bayarm",
      description:
          "Ici, Vous pouvez acheter et vendre des produits agros alimentaire",
      image: "images/svg/performance.svg"),
  Welcome(
      title: "Vous êtes un Producteur ?",
      description:
      "Cette application est faite pour vous",
      image: "images/svg/drone.svg"),
  Welcome(
      title: "Vous êtes clients ?",
      description:
      "Vous pourer parcourrir un large choix de produits",
      image: "images/svg/quality.svg"),
];
