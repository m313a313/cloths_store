import 'package:flutter/material.dart';
import 'package:store2/Features/home/data/models/product_model.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF0F2F4),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Your cart',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: const Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          )
        ],
      ),
      backgroundColor: Color(0xFFF0F2F4),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Container(
              color: Colors.white,
              width: double.infinity,
              //  height: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                        width: 300,
                        height: 200,
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(
                                    width: 2,
                                    color: Colors.black.withOpacity(.4))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(product.image),
                            ))),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.favorite_border),
                          Row(
                            //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 216, 218, 220),
                                    borderRadius: BorderRadius.circular(50)),
                                height: 8,
                                width: 8,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(50)),
                                height: 8,
                                width: 8,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: const Color(0xFFF0F2F4),
                                    borderRadius: BorderRadius.circular(50)),
                                height: 8,
                                width: 8,
                              )
                            ],
                          ),
                          const Icon(Icons.share)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${product.title}',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  '${product.category}',
                ),
              ],
            ),
            Text('${product.price}\$'),
          ]),
          SizedBox(
            height: 30,
          ),
          const Text(
            'Product details',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 8),
            child: Text(product.description),
          ),
        const  Spacer(
            flex: 2,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Container(
                width: 360,
                height: 50,
                color: Colors.white,
                child: const Center(
                  child: Text('Add to Cart',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ),
              )),
          Spacer(
            flex: 1,
          )
        ],
      ),
    );
  }
}
