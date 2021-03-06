import 'package:flutter/material.dart';
import 'package:project_alucar/models/user_model.dart';
import 'package:project_alucar/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project_alucar/screens/login_screen.dart';
import 'package:project_alucar/screens/signup_screen.dart';
import 'package:scoped_model/scoped_model.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());


}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
        child: MaterialApp(
      title: "Locação Alucar",
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          primaryColor: Color.fromARGB(255, 4, 125, 141)
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
    );
  }
}

