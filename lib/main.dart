import 'package:flutter/material.dart';
import 'package:model_test/pages/home/home.dart';
import 'package:model_test/pages/login/login_page.dart';
import 'package:model_test/pages/view_models/login_view_model.dart';
import 'package:model_test/pages/view_models/profile_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProfileViewModel()),
        ChangeNotifierProvider(create: (context) => LoginViewModel())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
