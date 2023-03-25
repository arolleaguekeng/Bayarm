import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../constants/responsive.dart';
import '../components/forms/custom_text.dart';
import '../home/home_screen.dart';
import '../web_design/home/home_screen.dart';

class PaiementMethodContent extends StatefulWidget {
  const PaiementMethodContent({Key? key}) : super(key: key);

  @override
  State<PaiementMethodContent> createState() => _PaiementMethodContent();
}

class _PaiementMethodContent extends State<PaiementMethodContent> {
  bool isLoading = true;

  void initState() {}

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Padding(
          padding:  EdgeInsets.only(top: size.height/4),
          child: Container(
            width: size.width,
            height: size.height,
            child: Responsive.isMobile(context)
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: loginContent(size, context),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: loginContent(size, context),
                  ),
          ),
        ),
      ),
    );
  }

  List<Widget> loginContent(Size size, BuildContext context) {
    var size = MediaQuery.of(context).size;
    var paiements = [
      buildConatainerIcons("assets/images/png/orange.png", "Orange Money"),
      buildConatainerIcons("assets/images/png/mtn.png", "Mobile Money"),
      buildConatainerIcons("assets/images/png/paypal.png", "Paypal"),
      buildConatainerIcons("assets/images/png/master.png", "Master Card"),
    ];
    return [
      Container(
        width: Responsive.isMobile(context) ? size.width : size.width / 2,
        child: Column(
          children: [
            Image.asset(
              "assets/images/png/money.png",
              width: size.width / 2.3,
            ),
            const SizedBox(
              height: appPadding,
            ),
            if (Responsive.isMobile(context))
              const CustumText(
                text: "Choisir le mode de paiement",
                size: 35,
                weight: FontWeight.bold,
                color: primaryColor,
              ),
          ],
        ),
      ),
      const SizedBox(
        height: appPadding,
      ),
      Container(
        height: size.height,
        width: Responsive.isMobile(context) ? size.width : size.width / 2,
        child: Column(
          children: [
            if (!Responsive.isMobile(context))
            const CustumText(
              text: "Choisir le mode de paiement",
              size: 35,
              weight: FontWeight.bold,
              color: primaryColor,
            ),
            if (!Responsive.isMobile(context))
            const SizedBox(
              height: appPadding*3,
            ),
            Container(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 2.1,
                mainAxisSpacing: 1,
                shrinkWrap: true,
                children: List.generate(
                  paiements.length,
                  (index) {
                    return Container(
                      width: size.width /6,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: paiements[index],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      )
    ];
  }

  GestureDetector buildConatainerIcons(String iconUrl, String text) {
    Future<void> _showSimpleDialog() async {
      await showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog( // <-- SEE HERE
              title:  const CustumText(text: 'Voulez vous continuer ?', size: 30,color: primaryColor,),
              children: <Widget>[
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> kIsWeb?HomeWebScreen():HomeScreen()));
                  },
                  child: const CustumText(text: "oui j'ai fais mon choix", size: 20),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const CustumText(text: "Non J'ai changé d'avis", size: 20),
                ),
              ],
            );
          });
    }
    return GestureDetector(
        onTap: _showSimpleDialog,
        child: Material(
          borderRadius: BorderRadius.circular(15),
            elevation: 5,
            child: Container(
              height: 40,
              width: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    iconUrl,
                    width: 100,
                  ),
                  const SizedBox(
                    height: appPadding,
                  ),
                  //CustumText(text: text, size: 26)
                ],
              ),
            )));
  }
}
