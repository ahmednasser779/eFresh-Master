import 'package:efresh/models/product.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final Product product;
  final double imgHeight;
  ProductWidget({@required this.product, @required this.imgHeight});
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 3,
        child: Container(
          margin: EdgeInsets.all(12),
          width: 140,
          child: Column(
            children: [
              Container(
                height: imgHeight,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(product.imageUrl),
                        fit: BoxFit.fill)),
              ),
              Padding(
                padding: EdgeInsets.only(top: 6),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    product.name,
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '1KG',
                    style: TextStyle(color: Colors.black54),
                  )),
              SizedBox(height: 8),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  '\$${product.price}',
                  style: TextStyle(fontSize: 16, color: Colors.red),
                ),
              )
            ],
          ),
        ));
  }
}
