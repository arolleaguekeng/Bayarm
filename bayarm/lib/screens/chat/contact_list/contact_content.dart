import 'package:bayarm/screens/chat/contact_list/contact_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class ContactContent extends StatefulWidget {
  const ContactContent({Key? key}) : super(key: key);

  @override
  State<ContactContent> createState() => _ContactContent();
}

class _ContactContent extends State<ContactContent> {
  bool isLoading = true;

  void initState() {
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) => ContactCard(
          onTap: () {},
        ),
      ),
    );
  }
}
