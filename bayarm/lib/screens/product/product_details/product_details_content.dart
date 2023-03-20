import 'package:bayarm/constants/constants.dart';
import 'package:bayarm/models/product_model.dart';
import 'package:bayarm/screens/components/forms/custom_text.dart';
import 'package:flutter/material.dart';

class DetailsCard extends StatefulWidget {
  final ProductModel product;
  const DetailsCard({super.key, required this.product});

  @override
  State<DetailsCard> createState() => _DetailsCardState();
}

class _DetailsCardState extends State<DetailsCard>
    with SingleTickerProviderStateMixin {
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
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 350,
                color: Colors.transparent,
                child: Stack(
                  children: [
                    Image(
                      image: AssetImage(widget.product.images[0]),
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                    const Positioned(
                      top: 10.0,
                      left: 10.0,
                      child: BackButton(color: Colors.black),
                    ),
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustumText(
                      text: widget.product.name,
                      size: 28,
                      weight: FontWeight.bold,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.heart_broken_sharp,
                        color: green,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                        size: 20,
                        color: green,
                      ),
                    ),
                    Icon(
                      Icons.star,
                      color: green,
                      size: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: CustumText(
                        text: '4.8',
                        size: 18,
                        weight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: CustumText(
                        text: '(4.80000à reviews)',
                        size: 18,
                        weight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 10,
                ),
                height: 0.5,
                color: Colors.grey,
                width: MediaQuery.of(context).size.width / 1.2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 5,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustumText(
                          text: 'Description',
                          size: 20,
                          weight: FontWeight.bold,
                        ),
                      ],
                    ),
                    CustumText(
                      text: widget.product.description,
                      size: 15,
                      weight: FontWeight.normal,
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 10,
                ),
                height: 0.5,
                color: Colors.grey,
                width: MediaQuery.of(context).size.width / 1.2,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  children: [
                    CustumText(
                      text: 'Total price',
                      size: 20,
                      weight: FontWeight.bold,
                    ),
                    CustumText(
                      text: widget.product.price,
                      size: 15,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
