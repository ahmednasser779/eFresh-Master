import 'package:efresh/shared/bloc/app_cubit.dart';
import 'package:efresh/shared/widgets/cart_item.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map> products = AppCubit.get(context).items;
    print(products);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Your Cart'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: ListView.builder(
          itemBuilder: (context, index){
            return CartItem(products[index]);
          },
          itemCount: products.length,
        ),
      )
    );
  }
}
