
import 'package:ecommercebuying/Services/auth.dart';
import 'package:ecommercebuying/Views/home_admin_page.dart';
import 'package:ecommercebuying/Views/home_page.dart';
import 'package:ecommercebuying/Views/signUp_page.dart';
import 'package:ecommercebuying/Widgets/custom_textfield.dart';
import 'package:ecommercebuying/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
   LoginPage({super.key,});
static String id='LoginPage';


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

   late FirebaseAuth _auth;
  bool isAdmin=false;
  final Color color=Colors.white;
  late String _email,_password;

  @override
  Widget build(BuildContext context) {
  double height = MediaQuery.of(context).size.height ;
    return  Scaffold(
      backgroundColor: kPrimeColor,
      body: Form(
        key:_formKey ,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset('lib/Assets/icons/icons8-buy-50.png',fit: BoxFit.cover,width: 140,),
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
           const  SizedBox(height:60),
            CustomTextField(
               onClicked: (value){
                 _email=value!;
               },
               hint: 'Enter Your Email', icond: Icons.email,),
          const  SizedBox(height:20),
               CustomTextField(
                 onClicked: (value){
                   _password=value!;
                 },
              hint: 'Enter Your Password',
              icond: Icons.lock,
            ),
           SizedBox( height:height *0.08),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: FilledButton(
                  child: const Text('Login'),
    onPressed: ()
    async
    {

      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();}
      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _email,
            password: _password,
        );
        if(_email=='admin@gmail.com' && _password=='admin123'){
          isAdmin=true;
          Navigator.pushNamed(context, HomeAdminPage.id);
        }
        else{
          Navigator.pushNamed(context, HomePageE.id);
          //  Navigator.pushNamed(context, HomePageE.id);
        }
        // Navigator.pushNamed(context, HomePageE.id);
        //Navigator.pushNamed(context, SignUpPage.id);

      } on FirebaseAuthException catch (e) {

        Navigator.pushNamed(context, HomePageE.id);
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }

      //   print(email);
      //   print(password);
      //   final authResult = await auth.login(email!, password!);
      }
,

     // Navigator.pushNamed(context, HomePageE.id);

                  style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),


                  ),
              ),
            ),
          SizedBox(
              height:height *0.08 ,
          ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const  Text('Don\'t have an account?',
                style: TextStyle(
                  fontSize: 20,

                  color: Colors.white,
                  ),
                ),
                TextButton(onPressed: (){
                 Navigator.pushNamed(context, SignUpPage.id);
                }, child:const Text('Sign Up',style:
                TextStyle(
               fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                ),)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child:  GestureDetector(
                    onTap:(){

                      // isAdmin=true;
                      // if(_email=='admin@gmail.com' && _password=='admin123'){
                      //
                      //   Navigator.pushNamed(context, HomeAdminPage.id);
                      // }
                    },
                    child:const Text('I \'m Admin '
                                  ,style: TextStyle(
                                  fontFamily: 'Pasifico',
                         fontSize: 20,

                         color:Colors.white,
                                 // textAlign: TextAlign.center, // Corrected here
                                ),),
                  ),
                ),
    ),


              //SizedBox(width: 20,),
              Expanded(
                child: Center(
                  child: GestureDetector(
                    onTap: (){
                      isAdmin=false;
                    },
                    child:const Text('I \'m User',
                      style: TextStyle(
                        fontSize: 20,
                      //color:Colors.white,
                       color:Colors.white,
                       // textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ],
            )
          ],
        ),
      ),
    );
  }
}
