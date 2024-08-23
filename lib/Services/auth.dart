import 'package:firebase_auth/firebase_auth.dart';
class Auth{
  final _auth=FirebaseAuth.instance;
Future<UserCredential> sigUp(String email,String password)async{
 final authResult= await  _auth.createUserWithEmailAndPassword(
     email: email, password: password);
 return authResult;

 }
  Future<UserCredential>login (String email,String password)async{
    final authResult= await  _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return authResult;

  }
}