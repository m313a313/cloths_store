import 'dart:convert';

import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:store2/Features/home/data/models/product_model.dart';
import 'package:store2/core/services/api_service.dart';
part 'products_provider.g.dart';

@Riverpod(keepAlive: true)
class ProductsNotifier extends _$ProductsNotifier {
  @override
  FutureOr<List<ProductModel>> build() async {
    return [];
  }

  void fetchProducts() async {
    List<ProductModel> products = [];
    state = await AsyncValue.guard(() async {
      final Response jsonData =
          await ApiService().getRequest('https://fakestoreapi.com/products');
      final data = json.decode(jsonData.body);
     ;
      for (var i in data) {
        final product = ProductModel.fromJson(i);
        products.add(product);
      }

      return products;
    });
  }
}
