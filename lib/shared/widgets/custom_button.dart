import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color color;
  const CustomButton({Key key, @required this.title, @required this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      margin: EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        border: Border.all(
          color: color
        )
      ),
      child: FlatButton(
        onPressed: (){},
        child: Text(title, style: TextStyle(color: color),),
        color: color.withOpacity(0.2),
      ),
    );
  }
}

