import 'package:flutter/material.dart';
import 'router/app_router.dart';
import 'shared/shared_pref.dart';
import 'shared/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPref().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'Хоол хүргэлтийн апп',
      theme: customTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
