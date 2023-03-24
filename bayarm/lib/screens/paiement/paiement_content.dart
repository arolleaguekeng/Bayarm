import 'package:bayarm/notfoundPage.dart';
import 'package:bayarm/screens/components/forms/custom_text.dart';
import 'package:flutter/material.dart';

enum Pet { wallet, paypal, googlePay, applePay, orangeM, momo }

class PaiementContent extends StatefulWidget {
  const PaiementContent({super.key});

  @override
  State<PaiementContent> createState() => _PaiementContentState();
}

class _PaiementContentState extends State<PaiementContent> {
  Pet _pet = Pet.momo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        elevation: 0,
        title: CustumText(
          text: 'Paiement Methods',
          size: 20,
          weight: FontWeight.bold,
        ),
        backgroundColor: Colors.white,
        centerTitle: false,
        actions: [
          Container(
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(20),
            ),
            child: IconButton(
              icon: Icon(
                Icons.add_box,
                color: Colors.grey.shade400,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (__) {
                      return NotFoundPage();
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustumText(
                text: 'Select the payment method you want to use',
                size: 16,
                color: Colors.black,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
                height: 400,
                child: ListView(
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Card(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            color: Colors.white,
                            elevation: 1,
                            child: ListTile(
                              leading: Image.asset(
                                "assets/images/png/online.png",
                                height: 40,
                              ),
                              title: CustumText(
                                text: 'My Wallet',
                                size: 18,
                                weight: FontWeight.bold,
                              ),
                              trailing: Radio<Pet>(
                                value: Pet.wallet,
                                groupValue: _pet,
                                onChanged: (Pet? value) {
                                  setState(() {
                                    _pet = value!;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Card(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            color: Colors.white,
                            elevation: 1,
                            child: ListTile(
                              leading: Image.asset(
                                "assets/images/png/online.png",
                                height: 40,
                              ),
                              title: CustumText(
                                text: 'Paypal',
                                size: 18,
                                weight: FontWeight.bold,
                              ),
                              trailing: Radio<Pet>(
                                value: Pet.paypal,
                                groupValue: _pet,
                                onChanged: (Pet? value) {
                                  setState(() {
                                    _pet = value!;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Card(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            color: Colors.white,
                            elevation: 1,
                            child: ListTile(
                              leading: Image.asset(
                                "assets/images/png/online.png",
                                height: 40,
                              ),
                              title: CustumText(
                                text: 'Google Pay',
                                size: 18,
                                weight: FontWeight.bold,
                              ),
                              trailing: Radio<Pet>(
                                value: Pet.googlePay,
                                groupValue: _pet,
                                onChanged: (Pet? value) {
                                  setState(() {
                                    _pet = value!;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Card(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            color: Colors.white,
                            elevation: 1,
                            child: ListTile(
                              leading: Image.asset(
                                "assets/images/png/online.png",
                                height: 40,
                              ),
                              title: CustumText(
                                text: 'Apple Pay',
                                size: 18,
                                weight: FontWeight.bold,
                              ),
                              trailing: Radio<Pet>(
                                value: Pet.applePay,
                                groupValue: _pet,
                                onChanged: (Pet? value) {
                                  setState(() {
                                    _pet = value!;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Card(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            color: Colors.white,
                            elevation: 1,
                            child: ListTile(
                              leading: Image.asset(
                                "assets/images/png/online.png",
                                height: 40,
                              ),
                              title: CustumText(
                                text: 'Orange Money',
                                size: 18,
                                weight: FontWeight.bold,
                              ),
                              trailing: Radio<Pet>(
                                value: Pet.orangeM,
                                groupValue: _pet,
                                onChanged: (Pet? value) {
                                  setState(() {
                                    _pet = value!;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Card(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            color: Colors.white,
                            elevation: 1,
                            child: ListTile(
                              leading: Image.asset(
                                "assets/images/png/online.png",
                                height: 40,
                              ),
                              title: CustumText(
                                text: 'Mobile Money',
                                size: 18,
                                weight: FontWeight.bold,
                              ),
                              trailing: Radio<Pet>(
                                value: Pet.momo,
                                groupValue: _pet,
                                onChanged: (Pet? value) {
                                  setState(() {
                                    _pet = value!;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              MaterialButton(
                onPressed: () {},
                height: 50,
                elevation: 0,
                splashColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.green,
                child: Center(
                  child: CustumText(
                    text: "Confirm Payment",
                    size: 20,
                    color: Colors.white,
                    weight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
