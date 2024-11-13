import 'package:flutter/material.dart';
import 'package:free_api_sample_ui_main/controller/home_screen_controller.dart';
import 'package:free_api_sample_ui_main/controller/login_screen_controller.dart';
import 'package:free_api_sample_ui_main/view/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginScreenController(),),
        ChangeNotifierProvider(create: (context) => HomeScreenController(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.green),
        home: SplashScreen(),
      ),
    );
  }
}
