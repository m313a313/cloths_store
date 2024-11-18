import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:store2/Features/auth/presentation/pages/sign_in.dart';
import 'package:store2/Features/auth/providers/auth_provider.dart';
import 'package:store2/Features/home/presentation/pages/home_page.dart';
import 'package:store2/core/constants/enums/auth_enum.dart';

class SplachViewBody extends ConsumerStatefulWidget {
  const SplachViewBody({super.key});

  @override
  ConsumerState<SplachViewBody> createState() => _SplachViewBodyState();
}

class _SplachViewBodyState extends ConsumerState<SplachViewBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    listener();
    // WidgetsBinding.instance.addPostFrameCallback((d) {
    //   Navigator.push(context, MaterialPageRoute(builder: (context) {
    //     return HomePage();
    //   }));
    // });

    return const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Splach Screen'),
        ]);
  }

  void executeNavigation(AuthEnum isAuthenticated) {
    switch (isAuthenticated) {
      case AuthEnum.authenticated:
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return const HomePage();
        }));
      case AuthEnum.unauthenticated:
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return const SignInPage();
        }));
    }
  }

  void listener() {
    ref.listen(authNotifierProvider, (_, state) {
      print('state: $state');
      if (state.hasError && !state.isLoading) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const SignInPage();
        }));
      } else if (state.hasValue) {
        executeNavigation(state.requireValue);
      }
    });
  }
}
