import 'package:efresh/models/product.dart';
import 'package:efresh/screens/item_screen.dart';
import 'package:efresh/shared/widgets/custom_button.dart';
import 'package:efresh/shared/widgets/product_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Product> _products = [
      Product(
          id: 1,
          name: 'Apples',
          imageUrl: 'assets/images/apples.png',
          price: 4.50),
      Product(
          id: 2,
          name: 'Bananas',
          imageUrl: 'assets/images/bananas.png',
          price: 3.65),
      Product(
          id: 3,
          name: 'Broccoli',
          imageUrl: 'assets/images/brocolli.png',
          price: 1.40),
      Product(
          id: 4,
          name: 'Carrots',
          imageUrl: 'assets/images/carrots.png',
          price: 2.37),
      Product(
          id: 5, name: 'Corn', imageUrl: 'assets/images/corn.png', price: 7.00),
      Product(
          id: 6,
          name: 'Potatoes',
          imageUrl: 'assets/images/potato.png',
          price: 2.25),
      Product(
          id: 7,
          name: 'Pepper',
          imageUrl: 'assets/images/pepper.png',
          price: 1.90),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        title: Text(
          'eFresh',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => print('search'),
            color: Colors.black54,
          )
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/fruits.jpg'),
                    fit: BoxFit.fill)),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 20),
            child: Row(
              children: [
                CustomButton(
                  title: 'Free Deleviry',
                  color: Colors.lightGreen,
                ),
                CustomButton(
                  title: 'Near Me',
                  color: Colors.amber,
                ),
                CustomButton(
                  title: 'Popular',
                  color: Colors.red,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 20),
            child: Text(
              'Fresh Sale',
              style: TextStyle(
                  fontSize: 18, color: Theme.of(context).primaryColor),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, top: 16),
            height: 260,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(
                      builder: (_) => ItemScreen(product: _products[index])
                    )),
                    child: ProductWidget(product: _products[index], imgHeight: 120,));
              },
              itemCount: _products.length,
            ),
          )
        ],
      ),
    );
  }
}
