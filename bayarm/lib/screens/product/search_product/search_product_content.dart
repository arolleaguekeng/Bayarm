import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class SearchProductContent extends StatefulWidget {
  const SearchProductContent({Key? key}) : super(key: key);

  @override
  State<SearchProductContent> createState() => _SearchProductContent();
}

class _SearchProductContent extends State<SearchProductContent> {
  bool isLoading = true;

  void initState() {
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container();
  }
}
