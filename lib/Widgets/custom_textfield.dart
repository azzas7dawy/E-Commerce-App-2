
import 'package:ecommercebuying/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hint, required this.icond, this.onClicked});
  final String hint;
  final IconData icond;
  final void Function(String?)? onClicked;
  // ignore: body_might_complete_normally_nullable
  String? checkField(){
    if(hint=='Enter Your Name'){
      return 'Please Enter Your Name';
    }
    else if(hint=='Enter Your Email'){
      return 'Please Enter Your Password';
    }
    else if(hint=='Enter Your Password'){
      return 'Please Enter Your Name';
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: TextFormField(
        obscureText:hint=='Enter Your Password'? true:false,
        validator: (value)
    // ignore: body_might_complete_normally_nullable
    {
      if(value!.isEmpty)
        {
          return checkField();
        }

        },
        onSaved: onClicked,
        cursorColor: kPrimeColor,
        decoration: InputDecoration(
          prefixIcon: Icon(icond,
          color: kPrimeColor,),
          filled: true,
          fillColor: kSecondColor,
          focusedBorder:const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(
              color: Colors.white,
          ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:const BorderSide(
              color: Colors.white,
            ),
          ),
          border:const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          // ignore: unnecessary_string_interpolations
          hintText: hint,
        ),
      ),
    );
  }
}
