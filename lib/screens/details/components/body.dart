import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:FinDit/constants/constants.dart';
import 'package:FinDit/models/product.dart';

import 'add_to_cart.dart';
import 'product_image.dart';
import 'product_intro.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // It provide us total height and width
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: size.height,
                child: Stack(
                  children: <Widget>[
                    ProductImage(product: product),
                    Container(
                      margin: EdgeInsets.only(top: size.height * 0.5),
                      padding: EdgeInsets.only(
                        top: 30,
                        left: kDefaultPadding,
                        right: kDefaultPadding,
                      ),
                      // height: 500,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      
                      ),
                      child: Column(
                        children: <Widget>[
                          ProductIntro(product: product),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: PurchaseBar(product: product),
            ))
      ],
    );
  }
}
