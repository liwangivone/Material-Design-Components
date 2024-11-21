import 'package:flutter/material.dart';

import 'views/pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fleurish Onboarding',
      routes: {
        '/': (context) => const OnboardingPage(),
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/detail': (context) => const DetailPage(
            image: 'assets/bouquet1.jpg',
            title: 'blush bloom bouquet',
            description: 'A delicate bouquet of pink blooms, perfect for celebrating love and life’s sweetest moments',
        )
      },
      initialRoute: '/', // Halaman awal adalah onboarding
      );
    
    
  }

}
