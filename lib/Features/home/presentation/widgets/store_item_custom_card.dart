import 'package:flutter/material.dart';
import 'package:store2/Features/home/data/models/product_model.dart';
import 'package:store2/Features/home/presentation/pages/product__details_page.dart';

class StoreItemCustmCard extends StatelessWidget {
  const StoreItemCustmCard({
    super.key,
    required this.product,
  });
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      height: 120,
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Image.network(
              product.image,
              height: 80,
              width: 90,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 190,
                child: Text(
                  product.title,
                  style: TextStyle(overflow: TextOverflow.ellipsis),
                  //overflow: TextOverflow.,
                ),
              ),
              Text(
                product.category,
                style: const TextStyle(color: Colors.grey),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text('${product.price}\$'),
              ),
            ],
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border,
                size: 30,
              )),
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (
                context,
              ) {
                return ProductDetailsPage(
                  product: product,
                );
              }));
            },
            icon: const Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
