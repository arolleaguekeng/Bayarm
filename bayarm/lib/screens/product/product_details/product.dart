import 'package:bayarm/constants/constants.dart';
import 'package:bayarm/screens/components/forms/custom_text.dart';

import '../../../models/product_model.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  final ProductModel product;
  const Detail({super.key, required this.product});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> with SingleTickerProviderStateMixin {
  bool isOpenened = false;
  AnimationController? _animationController;
  Animation<Color?>? _buttonColor;
  Animation<double>? _animationIcon;
  Animation<double>? _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    )..addListener(
        () {
          setState(
            () {},
          );
        },
      );
    _animationIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController!);
    _buttonColor = ColorTween(begin: Colors.blue, end: Colors.red).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Interval(0.00, 1.00, curve: Curves.linear),
      ),
    );
    _translateButton = Tween<double>(begin: _fabHeight, end: -14.0).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Interval(0.0, 0.75, curve: _curve),
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  Widget buttonAsk() {
    return Container(
      child: FloatingActionButton(
        onPressed: () {},
        tooltip: "Ask",
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }

  Widget buttonEdit() {
    return Container(
      child: FloatingActionButton(
        onPressed: () {},
        tooltip: "Edit",
        child: Icon(
          Icons.edit,
        ),
      ),
    );
  }

  Widget buttonDelete() {
    return Container(
      child: FloatingActionButton(
        onPressed: () {},
        tooltip: "Delete",
        child: Icon(
          Icons.delete,
        ),
      ),
    );
  }

  Widget buttonToggle() {
    return Container(
      child: FloatingActionButton(
          backgroundColor: _buttonColor!.value,
          onPressed: animate,
          tooltip: "Toggle",
          child: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: _animationIcon!,
          )),
    );
  }

  animate() {
    if (isOpenened)
      _animationController!.forward();
    else
      _animationController!.reverse();

    setState(() {
      isOpenened = !isOpenened;
    });
  }

  @override
  Widget build(BuildContext context) {
    String imagePicture = widget.product.images[0];
    return Scaffold(
      /*floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Transform(
            transform: Matrix4.translationValues(
                0.0, _translateButton!.value * 3.0, 0.0),
            child: buttonAsk(),
          ),
          Transform(
            transform: Matrix4.translationValues(
                0.0, _translateButton!.value * 2.0, 0.0),
            child: buttonDelete(),
          ),
          Transform(
            transform:
                Matrix4.translationValues(0.0, _translateButton!.value, 0.0),
            child: buttonEdit(),
          ),
          buttonToggle(),
        ],
      ),*/
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.6,
            elevation: 0,
            snap: true,
            floating: true,
            stretch: true,
            backgroundColor: Colors.grey.shade50,
            foregroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: [
                StretchMode.zoomBackground,
              ],
              background: Hero(
                transitionOnUserGestures: true,
                tag: widget.product.name,
                child: Image.asset(
                  imagePicture,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(45),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Center(
                  child: Container(
                    width: 50,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  height: MediaQuery.of(context).size.height * 0.85,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 30,
                  ),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustumText(
                        text: "Orders pictures",
                        size: 18,
                        color: Colors.black,
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 5),
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  imagePicture = widget.product.images[index];
                                });
                              },
                              child: CardImage(
                                image: widget.product.images[index],
                              ),
                            );
                          },
                          itemCount: widget.product.images.length,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustumText(
                                text: widget.product.name,
                                size: 22,
                                color: Colors.black,
                                weight: FontWeight.bold,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CustumText(
                                text: widget.product.description,
                                size: 20,
                                color: Colors.blueGrey.shade900,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Column(
                          children: [
                            ListTile(
                              leading: const Icon(
                                Icons.list,
                                color: Colors.black,
                              ),
                              title: const CustumText(
                                text: 'Les plus populaires...',
                                size: 15,
                              ),
                              trailing: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_right_alt,
                                  color: Colors.black,
                                  size: 20,
                                ),
                              ),
                            ),
                            ListTile(
                              leading: const Icon(
                                Icons.details,
                                color: Colors.black,
                              ),
                              title: const CustumText(
                                text: 'Détails du produit.',
                                size: 15,
                              ),
                              trailing: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_right_alt,
                                  color: Colors.black,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustumText(
                        text: "Avis sur le produit",
                        size: 18,
                        color: Colors.black,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 5),
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: green),
                              ),
                              child: CustumText(
                                text: '3405 Sold',
                                size: 15,
                                color: green,
                              ),
                            ),
                            Icon(
                              Icons.star,
                              color: green,
                              size: 18,
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              child: CustumText(
                                text: '4.8',
                                size: 15,
                                weight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              child: CustumText(
                                text: '(4.80000à reviews)',
                                size: 15,
                                weight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        height: 50,
                        elevation: 0,
                        splashColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: green,
                        child: Center(
                          child: CustumText(
                            size: 18,
                            text: "Add to Card",
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            height: 40,
                            elevation: 0,
                            splashColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: green,
                            child: Center(
                              child: CustumText(
                                size: 15,
                                text: "Add to Card",
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            height: 40,
                            elevation: 0,
                            splashColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: green,
                            child: Center(
                              child: CustumText(
                                size: 15,
                                text: "Add to Card",
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget CardImage({required String image}) {
    return Card(
      margin: const EdgeInsets.only(left: 10),
      child: Image.asset(
        image,
        fit: BoxFit.cover,
      ),
      elevation: 0.5,
    );
  }
}
