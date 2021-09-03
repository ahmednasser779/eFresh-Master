import 'package:efresh/shared/bloc/app_cubit.dart';
import 'package:efresh/shared/bloc/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../costants.dart';

class CartItem extends StatelessWidget {
  final Map product;

  CartItem(this.product);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: Key(product[Constants.pId].toString()),
        onDismissed: (direction) {
          AppCubit.get(context).deleteData(id: product[Constants.pId]);
        },
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            final _cubit = AppCubit.get(context);
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              child: Card(
                elevation: 3,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(product[Constants.pImgUrl]))),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product[Constants.pName],
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              '\$${product[Constants.pPrice]}',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          IconButton(
                            icon: Icon(Icons.add_circle),
                            color: Theme.of(context).primaryColor,
                            onPressed: () {
                              // _cubit.increaseItemQuantity();
                            },
                          ),
                          Text(
                            '${_cubit.quantity}',
                            style: TextStyle(fontSize: 16),
                          ),
                          IconButton(
                              icon: Icon(Icons.remove_circle),
                              color: Theme.of(context).primaryColor,
                              onPressed: () {
                                // _cubit.decreaseItemQuantity();
                              } ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
