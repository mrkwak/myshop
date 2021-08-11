import 'package:flutter/material.dart';
import 'models/Product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey,
      ),
      home: ScreenProductList(),
    );
  }
}

class ScreenProductList extends StatelessWidget {
  const ScreenProductList({Key? key}) : super(key: key);
  final int axisCount = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: productListAppBar('Good Morning', 'Caesar Rincon'),
      body: ProductListBody(),
    );
  }
}

class ProductListBody extends StatelessWidget {
  const ProductListBody({Key? key}) : super(key: key);
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
          ),
        ),
      )),
    ]);
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                child: Image.asset(
                  product.image,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(product.title),
              ],
            ),
          ],
        ));
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
            //이게 왜 크로스로 해야 왼쪽 정렬되는지 모르겠음
            children: <Widget>[
              Text(
                topText,
                style: TextStyle(color: Colors.grey),
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
