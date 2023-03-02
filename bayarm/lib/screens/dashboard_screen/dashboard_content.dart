import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imap_fe/controllers/api/salle_api.dart';
import 'package:imap_fe/screens/components/forms/costum_text_field.dart';

import '../../constants/constants.dart';
import '../../models/salle.dart';
import '../components/forms/custom_text.dart';

class DashboardContent extends StatefulWidget {
  const DashboardContent({Key? key}) : super(key: key);

  @override
  State<DashboardContent> createState() => _DashboardContent();
}

class _DashboardContent extends State<DashboardContent> {
  static List<Salle> sallelist = <Salle>[];
  bool isLoading = true;
  Future<List<Salle>> getAllSalles() async {
    var liste = await SalleApi.getAllSalles();
    sallelist = liste;
    setState(() {
      isLoading = false;
    });

    return liste;
  }

  void initState() {
    getAllSalles();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController tec_depart = TextEditingController();
    TextEditingController tec_destination = TextEditingController();
    var size = MediaQuery.of(context).size;
    double iconSize = 40;
    var iconColor = white;
    return Container(
        height: size.height,
        decoration: const BoxDecoration(color: primaryColor),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  const SizedBox(height: appPadding * 3),
                  const CostumText(
                    text: "Vous pouvez rechercher : ",
                    size: 20,
                    color: white,
                  ),
                  const SizedBox(height: appPadding + 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: appPadding),
                      MaterialButton(
                          minWidth: 60,
                          onPressed: () {},
                          child: Container(
                            width: size.width * 0.2,
                            height: 80,
                            decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.meeting_room_sharp,
                                  size: iconSize,
                                  color: iconColor,
                                ),
                                const Text(
                                  'Salles',
                                  style: TextStyle(color: white),
                                )
                              ],
                            ),
                          )),
                      const SizedBox(width: appPadding),
                      MaterialButton(
                          minWidth: 60,
                          onPressed: () {},
                          child: Container(
                            width: size.width * 0.2,
                            height: 80,
                            decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.room_preferences_outlined,
                                  size: iconSize,
                                  color: iconColor,
                                ),
                                const Text(
                                  'Toilettes',
                                  style: TextStyle(color: white),
                                )
                              ],
                            ),
                          )),
                      const SizedBox(width: appPadding),
                      MaterialButton(
                          minWidth: 60,
                          onPressed: () {},
                          child: Container(
                            width: size.width * 0.2,
                            height: 80,
                            decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.desk_sharp,
                                  size: iconSize,
                                  color: iconColor,
                                ),
                                const Text(
                                  'Bureaux',
                                  style: TextStyle(color: white),
                                )
                              ],
                            ),
                          )),
                      const SizedBox(width: appPadding),
                    ],
                  ),
                  const SizedBox(height: appPadding * 3),
                  Container(
                    height: size.height * 0.7,
                    width: size.width,
                    decoration: const BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    child: Column(
                      children: [
                        const SizedBox(height: appPadding),
                        const CostumText(
                          text: "Recherche Rapide",
                          size: 20,
                          weight: FontWeight.bold,
                        ),
                        const SizedBox(height: appPadding * 2),
                        const Text("N° Salle de Destination"),
                        Container(
                          padding: EdgeInsets.all(appPadding),
                          child: CustomTextField(
                            hintText: "Ex: CE134",
                            onChanged: (value) {
                              print(tec_destination.text);
                              print("object");
                              for (var salle in sallelist) {
                                if (salle.numero == tec_destination.text) {
                                  print(
                                      "********************************************");
                                  print(salle);
                                }
                              }
                            },
                            controller: tec_destination,
                            fillColor: white,
                            border: true,
                          ),
                        ),
                        MaterialButton(
                            minWidth: 60,
                            onPressed: () {},
                            child: Container(
                              width: size.width * 0.3,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(100)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.place_outlined,
                                        color: white,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
