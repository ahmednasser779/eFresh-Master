import 'package:efresh/models/product.dart';
import 'package:efresh/shared/bloc/app_cubit.dart';
import 'package:efresh/shared/bloc/app_states.dart';
import 'package:efresh/shared/costants.dart';
import 'package:efresh/shared/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemScreen extends StatelessWidget {
  final Product product;

  ItemScreen({@required this.product});

  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).accentColor,
            title: Text(
              'eFresh',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 32, vertical: 18),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: ProductWidget(
                    product: product,
                    imgHeight: 220,
                  )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                    'Lorem ipsum.Lorem ipsum.Lorem ipsum.Lorem ipsum.Lorem ipsum.Lorem ipsum.Lorem ipsum.Lorem ipsum.'
                    'Lorem ipsum.Lorem ipsum.Lorem ipsum.Lorem ipsum.'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Related Items',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                    ),
                    Card(
                      child: ListTile(
                        leading: Image.asset(product.imageUrl),
                        title: Text(product.name),
                        subtitle: Text('\$${product.price}'),
                        trailing: IconButton(
                          icon: Icon(Icons.favorite_border),
                          onPressed: () {},
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 80,
                child: RaisedButton(
                  onPressed: cubit.isItemAdded && cubit.id == product.id
                      ? null
                      : () {
                          AppCubit.get(context).insertIntoDatabase(
                              name: product.name,
                              imageUrl: product.imageUrl,
                              price: product.price);
                          cubit.changeAddToCartState(isAdded: true, id: product.id);
                        },
                  child: cubit.isItemAdded && cubit.id == product.id
                      ? Text(
                          'Added',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        )
                      : Text(
                          'Add to Cart',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                  color: cubit.isItemAdded && cubit.id == product.id
                      ? Colors.grey
                      : Theme.of(context).primaryColor,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
