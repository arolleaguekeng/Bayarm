import 'package:flutter/material.dart';

class CartContent extends StatefulWidget {
  const CartContent({Key? key}) : super(key: key);

  @override
  State<CartContent> createState() => _CartContent();
}

class _CartContent extends State<CartContent> {
  bool isLoading = true;
  var productList = [];
  void initState() {}

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0.4,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: const Text(
              "My Cart",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          body: Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height / 1.8,
                    child: isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: _repasList.length,
                            itemBuilder: (context, index) {
                              return MyRepasCard(
                                nom: _repasList[index].nom,
                                description: _repasList[index].description,
                                price: _repasList[index].price,
                                rating: _repasList[index].rating,
                                image: api_services.baseImageUrlRepas +
                                    _repasList[index].image,
                                onTap: () {
                                  double totalAmound = 0;
                                  int quantity = 0;
                                  bool isfavorite = false;
                                  showModalBottomSheet(
                                      context: context,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(25.0)),
                                      ),
                                      builder: (context) {
                                        return Container(
                                          height: size.height * 2,
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(100),
                                                  topRight:
                                                      Radius.circular(130))),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: size.width * 0.05),
                                          child: Column(
                                            children: [
                                              //Boutton en haut a droite
                                              Align(
                                                  alignment: Alignment.topRight,
                                                  child: Container(
                                                    width: size.width * 0.2,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              7),
                                                      child: ElevatedButton(
                                                        onPressed: () {},
                                                        child: const Text(
                                                          "Non Veg",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                  )),
                                              //in formations sur le restaurant
                                              Row(
                                                children: [
                                                  Container(
                                                    height: size.width * 0.3,
                                                    width: size.width * 0.3,
                                                    decoration: BoxDecoration(
                                                      color: Colors.black,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            _repasList[index]
                                                                .image),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  //nom du repas
                                                  Column(
                                                    children: [
                                                      Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          _repasList[index].nom,
                                                          style:
                                                              const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 18,
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                      ),
                                                      //description du repas
                                                      Text(
                                                        _repasList[index]
                                                            .description,
                                                        style: const TextStyle(
                                                            fontSize: 14,
                                                            color:
                                                                kPrimaryColor),
                                                      ),
                                                      //rating du repas
                                                      SmoothStarRating(
                                                          allowHalfRating:
                                                              false,
                                                          onRatingChanged:
                                                              (v) {},
                                                          starCount: 5,
                                                          rating:
                                                              _repasList[index]
                                                                  .rating,
                                                          size: 30.0,
                                                          color: Colors.orange,
                                                          borderColor:
                                                              Colors.blueGrey,
                                                          spacing: 0.0),
                                                      Text(
                                                        '${_repasList[index].price} XAF',
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 25,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                      width:
                                                          size.height * 0.02),
                                                  IconButton(
                                                      onPressed: () {},
                                                      icon: const Icon(
                                                        Icons.favorite_border,
                                                        color: kPrimaryColor,
                                                        size: 38,
                                                      )),
                                                ],
                                              ),
                                              //le Texte "description de repas"
                                              SizedBox(
                                                height: size.height * 0.013,
                                              ),
                                              const Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  "Description",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 25,
                                                      color: Colors.black),
                                                ),
                                              ),
                                              SizedBox(
                                                height: size.height * 0.013,
                                              ),
                                              //la description du repas
                                              const Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  "Un plat 100% camerounais qui vous ferras sourrir de plaisir et de bonne humeure",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                      color: Colors.grey),
                                                ),
                                              ),
                                              SizedBox(
                                                height: size.height * 0.013,
                                              ),
                                              //la quantité
                                              Row(
                                                children: [
                                                  const Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      "Quantity",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18,
                                                          color: Colors.grey),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: size.width * 0.4,
                                                  ),
                                                  //augmenter diminuer quantité
                                                  Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Row(
                                                        children: [
                                                          //boutton moin
                                                          IconButton(
                                                              onPressed: () {
                                                                setState(() {
                                                                  // quantity --;
                                                                  // totalAmound = CalculTotalAmound(
                                                                  //     quantity,
                                                                  //     _repasList[index].prix
                                                                  // );
                                                                });
                                                              },
                                                              icon: const Icon(
                                                                Icons
                                                                    .remove_circle,
                                                                color: Colors
                                                                    .blueGrey,
                                                              )),
                                                          Text(
                                                            quantity.toString(),
                                                            style: const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 18,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                          //boutton plus
                                                          IconButton(
                                                              onPressed: () {
                                                                // quantity --;
                                                                // totalAmound = CalculTotalAmound(
                                                                //     quantity,
                                                                //     _repasList[index].prix
                                                                // );
                                                              },
                                                              icon: const Icon(
                                                                Icons
                                                                    .add_circle,
                                                                color:
                                                                    kPrimaryColor,
                                                              )),
                                                        ],
                                                      )),
                                                ],
                                              ),
                                              SizedBox(
                                                height: size.height * 0.013,
                                              ),
                                              //total Amound
                                              Row(
                                                children: [
                                                  const Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      "ToTal Amount",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18,
                                                          color: Colors.red),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      " $totalAmound XAF",
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18,
                                                          color: kPrimaryColor),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: size.height * 0.013,
                                              ),
                                              //bouttons du bas (Add to card)
                                              Row(
                                                children: [
                                                  Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Material(
                                                        // needed
                                                        color:
                                                            Colors.transparent,
                                                        child: InkWell(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(7),
                                                          onTap:
                                                              () {}, // needed
                                                          child: Image.asset(
                                                            "assets/icons/ic_market.png",
                                                            width: size.width *
                                                                0.13,
                                                            height: size.width *
                                                                0.13,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      )),
                                                  SizedBox(
                                                    width: size.width * 0.03,
                                                  ),
                                                  Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Container(
                                                        width: size.width * 0.7,
                                                        height:
                                                            size.width * 0.13,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(7),
                                                          child: ElevatedButton(
                                                            onPressed: () {},
                                                            child: const Text(
                                                              "Add To Cart",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                        ),
                                                      )),
                                                ],
                                              )
                                            ],
                                          ),
                                        );
                                      });

                                  print(_repasList[index]);
                                },
                              );
                            }),
                  ),
                  Container(
                      width: size.width,
                      child: Row(
                        children: [
                          Text(
                            "ItemPrice",
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: size.height * 0.10,
                  ),
                  Text(
                    "400 000.00 XAF",
                    style: TextStyle(fontSize: 20, color: kPrimaryColor),
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: size.width * 0.7,
                        height: size.width * 0.13,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              "Buy All",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )),
                ],
              ))),
    );
  }
}
