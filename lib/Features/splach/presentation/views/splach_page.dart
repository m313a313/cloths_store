import 'package:flutter/material.dart';
import 'package:store2/Features/splach/presentation/widgets/splach_page_body.dart';

class SplachView extends StatelessWidget {
  const SplachView({super.key});
  static const routeName = 'splach';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: SplachViewBody()),
    );
  }
}
