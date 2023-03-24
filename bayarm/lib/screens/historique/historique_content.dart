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
              ListView.builder(
                itemBuilder: ((context, index) {
                  return cardHistorique(
                    historique: historiques[index],
                  );
                }),
                itemCount: historiques.length,
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
      child: ListTile(
        title: CustumText(
          text: historique.transaction.nom,
          size: 18,
        ),
      ),
    );
  }
}
