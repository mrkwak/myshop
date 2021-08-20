import 'package:flutter/material.dart';
import 'package:myshop/models/Product.dart';

class ProductDetailWidget extends StatelessWidget {
  final Product product;
  const ProductDetailWidget({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: productDetailAppbar(context, product),
      body: ProductDetailScreen(product: product),
    );
  }
}

AppBar productDetailAppbar(BuildContext context, Product product) {
  return AppBar(
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(Icons.arrow_back),
        color: Colors.black,
      ),
      title: Text(product.title, style: TextStyle(color: Colors.black54)),
      actions: [
        Icon(
          Icons.person,
          color: Colors.black,
          size: 30,
        ),
      ]);
}

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: AspectRatio(
            aspectRatio: 1.3,
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(product.image),
                  ],
                ),
                Positioned(bottom: -20, child: _counterWidget()),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(product.title,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    Text('\$${product.price.toString()}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        )),
                  ],
                ),
              ),
              AspectRatio(
                aspectRatio: 1.05,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(product.description,
                          style: TextStyle(
                              color: Colors.grey, fontSize: 16, height: 2)),
                    ),
                    Container(
                      width: size.width - 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ))),
                        onPressed: () {},
                        child: Text('Add To Cart'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Container _counterWidget() {
    return Container(
      width: 140,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(0),
            width: 40,
            decoration: const ShapeDecoration(
              color: Colors.amber,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: const Icon(Icons.remove),
              color: Colors.grey,
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text('1'),
          ),
          Container(
            padding: EdgeInsets.all(0),
            width: 40,
            decoration: const ShapeDecoration(
              color: Colors.amber,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: const Icon(Icons.add),
              color: product.color,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({Key? key, required this.product, required this.press})
      : super(key: key);
  final Function press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => press(),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Expanded(
                  child: Image.asset(product.image,
                      width: double.maxFinite, fit: BoxFit.contain)),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title, style: TextStyle(color: Colors.black)),
                    Text('Size : ${product.size.toString()}',
                        style: TextStyle(color: Colors.grey)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$${product.price.toString()}',
                            style: TextStyle(color: Colors.black)),
                        Icon(Icons.add_circle),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              )
            ],
          )),
    );
  }
}
