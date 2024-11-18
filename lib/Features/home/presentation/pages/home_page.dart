import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:store2/Features/auth/presentation/pages/sign_in.dart';
import 'package:store2/Features/auth/providers/auth_provider.dart';
import 'package:store2/Features/home/presentation/widgets/store_item_custom_card.dart';
import 'package:store2/Features/home/providers/products_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    ref.read(productsNotifierProvider.notifier).fetchProducts();
    final products = ref.watch(productsNotifierProvider);
    return Scaffold(
        backgroundColor: const Color(0xffF0F2F4),
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Shop Now',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: const Icon(Icons.menu),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                  onPressed: () {
                    ref.read(authNotifierProvider.notifier).logout();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const SignInPage();
                    }));
                  },
                  icon: const Icon(Icons.logout)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
            )
          ],
        ),
        body: products.when(
            data: (products) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: StoreItemCustmCard(product: products[index]),
                      );
                    }),
              );
            },
            error: (e, st) => Text(e.toString()),
            loading: () => const CircularProgressIndicator()));
  }
}
