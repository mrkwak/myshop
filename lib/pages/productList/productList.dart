import 'package:flutter/material.dart';
import 'package:myshop/models/Product.dart';
import 'package:myshop/productDetail/productDetail.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({Key? key}) : super(key: key);
  final int axisCount = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: productListAppBar('Good Morning', 'Caesar Rincon'),
      body: ProductListBodyScreen(),
    );
  }
}

AppBar productListAppBar(String topText, String bottomText) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                topText,
                style: TextStyle(color: Colors.black),
              ),
              Text(
                bottomText,
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
        Icon(
          Icons.person,
          color: Colors.black,
          size: 30,
        ),
      ],
    ),
  );
}

class ProductListBodyScreen extends StatelessWidget {
  const ProductListBodyScreen({Key? key}) : super(key: key);
  final int axisCount = 2; // axisCount를 상위단에서 받아와서 쓰는방법 확인 필요
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: axisCount,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 0.75),
          itemBuilder: (context, index) => ProductCard(
            product: products[index],
            press: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ProductDetailWidget(product: products[index]),
              ),
            ),
          ),
        ),
      )),
    ]);
  }
}
