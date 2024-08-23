
import 'package:ecommercebuying/Views/home_page.dart';
import 'package:ecommercebuying/Views/login_page.dart';
import 'package:ecommercebuying/Widgets/custom_textfield.dart';
import 'package:ecommercebuying/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
const SignUpPage({super.key,});
  static String id='SignUpPage';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
final  GlobalKey<FormState>_globalKey=GlobalKey<FormState>();
late FirebaseAuth _auth;
late String _email,_password;
 // final auth=Auth();
@override
void initState() {
  _auth = FirebaseAuth.instance;
  FirebaseAuth.instance
      .userChanges()
      .listen((User? user) {
    if (user == null) {
      print('^^^^^^^^^^^^^^^^^^^@@@@@@@@@User is currently signed out!');
    } else {
      print('######################################User is signed in!');
    }
  });
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      backgroundColor: kPrimeColor,
      body: Form(
        key: _globalKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
              ),
              child: Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.2,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'lib/Assets/icons/icons8-buy-50.png', fit: BoxFit.cover,
                      width: 140,),
                    const Positioned(
                      bottom: 0,
                      child: Text(
                        'Buy It',
                        style: TextStyle(
                          fontFamily: 'Pacifico',
                          fontSize: 25,
                        ),
                      ),
                    ),

                  ],
                ),

              ),

            ),
            const SizedBox(height: 60),
            const CustomTextField(

              hint: 'Enter Your Name', icond: Icons.personal_injury_outlined,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              onClicked: (value) {
                _email = value!;
              },

              hint: 'Enter Your Email', icond: Icons.email,),
            const SizedBox(height: 20),
            CustomTextField(
              onClicked: (value) {
                _password = value!;
              },
              hint: 'Enter Your Password',
              icond: Icons.lock,
            ),
            SizedBox(height: height * 0.08),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: FilledButton(
                child: Text('Sign Up'),
                onPressed: () async
                {
                  if (_globalKey.currentState!.validate()) {
                    _globalKey.currentState!.save();

                    print(_email);
                    print(_password);
                    // final authResult=await auth.sigUp(_email, _password);
                    // print(authResult.user?.uid);


                  }
                  try {
                    UserCredential userCredential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: _email,
                      password: _password,
                    );
                    Navigator.pushNamed(context, HomePageE.id);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      print('The account already exists for that email.');
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),


                ),
              ),
            ),
            SizedBox(
              height: height * 0.08,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Do you have an account?',
                  style: TextStyle(
                    fontSize: 20,

                    color: Colors.white,
                  ),
                ),
                TextButton(onPressed: () {
                  Navigator.pushNamed(context, LoginPage.id);
                }, child: const Text('Login', style:
                TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),)),
              ],
            ),
          ],
        ),
      ),
    );
  }}



