import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'routes/route_name.dart';
import 'routes/route_generator.dart';

void main() async{


await Firebase.initializeApp(
    options: DefaultFirebaseOpt ions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Shop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      initialRoute: Routes.home,
      onGenerateRoute: GenerateRoute.onGenerateRoute,
    );
  }
}
