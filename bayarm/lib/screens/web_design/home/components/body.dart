
import 'package:flutter/material.dart';
import 'package:bayarm/constants/constants.dart';
import 'package:bayarm/constants/responsive.dart';
import 'package:bayarm/models/categories.dart';
import '../../../../models/product_model.dart';
import '../../../../services/db_services.dart';
import '../../../home/special_offers/special_offers.dart';
import 'email_banner.dart';
import 'most_popular.dart';
import 'services_card.dart';

class BodyContainer extends StatefulWidget {
  const BodyContainer({Key? key}) : super(key: key);

  @override
  State<BodyContainer> createState() => _BodyContainerState();
}

class _BodyContainerState extends State<BodyContainer> {
  DataBaseService db = DataBaseService();
  bool isLoading = true;
  List<Categorie> selectedCategorie = [];
  List<ProductModel> products = [];

  Future<void> getMupesInsurees() async {
    var liste = await db.getListeDesObjets();
    products =  <ProductModel>[];
    products = liste;
    setState(() {
      isLoading = false;
    });
  }
  void initState() {
    getMupesInsurees();
    print("############################# Liste of products ############################");
    // print(products[0]);
  }
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(appPadding*2),
      child: Column(
        children: [
          ServicesCard(),

          SpecialOfferCard(),

          Container(
            margin: const EdgeInsets.symmetric(vertical: 2),
            height: 30,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return buildCard(
                  cplant: categories[index],
                  isSelected: categories[index].isSelected,
                  index: index,
                );
              },
              separatorBuilder: (_, __) {
                return const Divider();
              },
              itemCount: categories.length,
            ),
          ),
          Responsive(
            desktop: MostPopular(
              crossAxiscount: _size.width < 650 ? 2 : 3,
              aspectRatio: _size.width < 650 ? 0.85 : 1.1,
            ),
            tablet: MostPopular(
              crossAxiscount: _size.width < 825 ? 2 : 3,
              aspectRatio: _size.width < 825 ? 0.85 : 1.1,
            ),
            mobile: MostPopular(
              crossAxiscount: _size.width < 690 ? 2 : 3,
              aspectRatio: _size.width < 560 ? 0.85 : 1.1,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          EmailBanner(),
        ],
      ),
    );
  }

  Widget buildCard({
    required Categorie cplant,
    required bool isSelected,
    required int index,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          categories[index].isSelected = !categories[index].isSelected;
          if (categories[index].isSelected == true) {
            selectedCategorie.add(
              Categorie(
                product: categories[index].product,
                name: categories[index].name,
                isSelected: true,
              ),
            );
          } else if (categories[index].isSelected == false) {
            selectedCategorie.removeWhere(
                    (element) => element.name == categories[index].name);
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: cplant.isSelected ? green : Colors.transparent,
          border: Border.all(width: 2, color: green),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(5),
        width: 50,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: Center(
          child: Text(
            cplant.name,
            style: TextStyle(
              fontSize: 12,
              color: cplant.isSelected ? white : green,
            ),
          ),
        ),
      ),
    );
  }
}





