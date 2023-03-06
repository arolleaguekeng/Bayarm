import 'package:bayarm/screens/home/homes_pages/popular_allPage.dart';
import 'package:flutter/material.dart';

class DetailsCard extends StatefulWidget {
  const DetailsCard({super.key});

  @override
  State<DetailsCard> createState() => _DetailsCardState();
}

class _DetailsCardState extends State<DetailsCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
