
import 'package:ecommercebuying/constants.dart';
import 'package:flutter/material.dart';

class HomeAdminPage extends StatelessWidget {
  const HomeAdminPage({super.key});
 static String id='HomeAdminPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:kPrimeColor,
      appBar: AppBar(
        title: const Text('Admin Page'),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            ElevatedButton(
              onPressed: (){},

                child:const Text("Add Product",
                style: TextStyle(
                  fontSize: 25,
                ),),),
            SizedBox(height: 20,),
            ElevatedButton(
            onPressed: (){},
            child:const Text("Edit Product",
              style: TextStyle(
                fontSize: 25,
              ),),),
            SizedBox(height: 20,),
            ElevatedButton(
            onPressed: (){},
            child:const Text("Delete Product",
              style: TextStyle(
                fontSize: 25,
              ),),),
          ],
        ),
      )
      );
  }
}
