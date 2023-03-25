import 'package:bayarm/models/historique.dart';
import 'package:flutter/material.dart';
import '../components/forms/custom_text.dart';

class HistoriquePage extends StatefulWidget {
  const HistoriquePage({super.key});

  @override
  State<HistoriquePage> createState() => _HistoriquePageState();
}

class _HistoriquePageState extends State<HistoriquePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: Row(
          children: [
            CustumText(
              text: "Transaction History",
              size: 18,
              weight: FontWeight.bold,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 20,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: MediaQuery.of(context).size.height / 1.2,
                child: ListView.builder(
                  itemBuilder: ((context, index) {
                    return cardHistorique(
                      historique: historiques[index],
                    );
                  }),
                  itemCount: historiques.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardHistorique({
    required Historiquetransaction historique,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListTile(
            title: CustumText(
              text: historique.transaction.nom,
              size: 18,
            ),
            leading: CircleAvatar(
              child: Image.asset(
                historique.transaction.product.images[0],
                height: 30,
                fit: BoxFit.cover,
              ),
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: CustumText(
                    text: historique.transaction.date.toString(),
                    size: 15,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            trailing: CustumText(
              text: "\$" + historique.transaction.montant,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }
}
