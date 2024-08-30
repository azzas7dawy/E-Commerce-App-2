import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommercebuying/Models/addproduct.dart';
import 'package:ecommercebuying/Services/store.dart';
import 'package:ecommercebuying/Views/add_product.dart';
import 'package:ecommercebuying/constants.dart';
import 'package:flutter/material.dart';

class MangeProducts extends StatefulWidget {
  const MangeProducts({super.key});
  static String id = 'MangeProducts';

  @override
  State<MangeProducts> createState() => _MangeProductsState();
}

class _MangeProductsState extends State<MangeProducts> {
  final _store = Store();
  //List<Product> products = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //kPrimeColor,
      body: StreamBuilder<QuerySnapshot>(
        stream: _store.loadProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text('Loading...'));
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.hasData) {
            List<Product> products = [];
            // Clear products list before adding new data
            products.clear();

            // Add new data to products list
            for (var doc in snapshot.data!.docs) {
              var data = doc.data() as Map<String, dynamic>;
              doc.id;
              products.add(Product(
                pName: data[kProductName] ?? '',
                pPrice: data[kProductPrice] ?? '',
                pDescription: data[kProductDescription] ?? '',
                pCategory: data[kProductCategory] ?? '',
                pLocation: data[kProductLocation] ?? '',
                docId:doc.id??'',
              ));
            }

            return GridView.builder(
              gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.9,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Padding(
                    padding: const EdgeInsets.symmetric( horizontal: 10.0, vertical: 10.0),
                    child: GestureDetector(
                      onTapUp: (details){
                        double dx=details.globalPosition.dx;
                        double dy=details.globalPosition.dy;
                        double dx2=MediaQuery.of(context).size.width-dx;
                        double dy2=MediaQuery.of(context).size.width-dy;
                         showMenu(context: context, position:RelativeRect.fromLTRB(dx,dy,dx2,dy2), items:[
                           MyPopupMenuItem(
                             onClick: (){
                               // _store.deleteProduct(products[index].pId);
                               _store.deleteProduct(products[index].docId!);
                             },
                               child: Text('Delete')
                           ),
                           MyPopupMenuItem(
                             onClick: (){
                               print('edited');
                             },
                               child: Text('Edit')),
                         ]);
                      },
                      child: Stack(
                        children: [
                          Positioned.fill(
                              child: Image(
                                fit: BoxFit.fill,
                                image: AssetImage(
                      (products[index].pLocation),
                                ),
                              )),
                          Positioned(
                            bottom: 0,
                            child:Opacity(
                              opacity: 0.8,
                              child: Container(
                                width:MediaQuery.of(context).size.width,
                                  height: 60,
                                  color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(products[index].pName,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        )),
                                      Text('\$ ${products[index].pPrice}'),
                                    ],
                                  ),
                                ),

                                ),

                            ),
                          ),
                          ]
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('No products available'));
          }
        },
      ),
    );
  }
}

class MyPopupMenuItem<T> extends PopupMenuItem<T>{
  final Widget child;
  final Function onClick;
  MyPopupMenuItem({
    required this.child,required this.onClick
  }):super(child: child) ;

  @override
  PopupMenuItemState<T, PopupMenuItem<T>> createState()  {
    return MyPopupMenuItemState();
  }
}
class MyPopupMenuItemState<T,PopupMenuItem>extends
PopupMenuItemState<T,MyPopupMenuItem<T>>{
 @override
  void handleTap() {
    widget.onClick();
    Navigator.pop(context);
  }



}









//
// import 'dart:js_interop';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommercebuying/Models/addproduct.dart';
// import 'package:ecommercebuying/Services/store.dart';
// import 'package:ecommercebuying/constants.dart';
// import 'package:flutter/material.dart';
// class EditProduct extends StatefulWidget {
//   const EditProduct({super.key});
// static String id='EditProduct';
//
//   @override
//   State<EditProduct> createState() => _EditProductState();
// }
// final _store=Store();
//
// Map<String, dynamic> _data={};
// class _EditProductState extends State<EditProduct> {
// // getData()async{
// //   QuerySnapshot querySnapshot=await FirebaseFirestore.instance.collection('products').get();
// //
// //   for(var doc in querySnapshot.docs){
// //     print(doc.data());
// //
// //     _data.addAll(doc.data() as Map<String, dynamic>);
// //    //_data.addAll(doc.data());
// //   }
// //   setState(() {
// //   });
// // }
// @override
// void initState() {
//   //getData();
//   super.initState();
// }
// List<Product>products=[];
//   @override
//   Widget build(BuildContext context) {
//   print(_data.length);
//     return Scaffold(
//       backgroundColor:kPrimeColor,
//      body: StreamBuilder<QuerySnapshot>(
//         stream: _store.loadProducts(),
//         builder: ( context,  snapshot) {
//     if (snapshot.hasData) {
//       for (var doc in snapshot.data?.documents) {
//         var data = doc.data();
//         products.add(Product(
//           pName: data[kProductName],
//           pPrice: data[kProductPrice],
//           pDescription: data[kProductDescription],
//           pCategory: data[kProductCategory],
//           pLocation: data[kProductLocation],
//         ));
//       }
//       return  ListView.builder(itemBuilder: (context, index) =>
//     Text(products[index].pName,
//     ),
//     itemCount: products.length ,
//     );
//     }
//     else{
//     return Center(
//     child: Text(' Loading'),);
//     }
//     }),
//     );
// }}
//
//
