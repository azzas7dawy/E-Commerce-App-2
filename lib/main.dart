
import 'dart:io';

import 'package:ecommercebuying/Views/home_admin_page.dart';
import 'package:ecommercebuying/Views/home_page.dart';
import 'package:ecommercebuying/Views/login_page.dart';
import 'package:ecommercebuying/Views/signUp_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main()async {
   WidgetsFlutterBinding.ensureInitialized();
   Platform.isAndroid ? await Firebase.initializeApp(
     options: const FirebaseOptions(
       apiKey: 'AIzaSyC_99ZsDWmEsTycOplIG5OJ6MEha-tuVaY',
       appId: '1:965801906492:android:981a69232ca815f17dce39',
       messagingSenderId: '965801906492',
       projectId: 'e-commerce-26748',
       storageBucket: 'e-commerce-26748.appspot.com',
     ),
   ) : await Firebase.initializeApp(

       );


  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      initialRoute: LoginPage.id,
      routes:{
        LoginPage.id:(context)=>LoginPage(),
      SignUpPage.id:(context)=> SignUpPage(),
        HomePageE.id:(context)=>HomePageE(),
        HomeAdminPage.id:(context)=>HomeAdminPage(),
      },
    );
  }
}
