
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  CustomButton(this.title, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(15),
      child: SizedBox(
        width: double.infinity,
        child: FlatButton(
          color: Colors.blue,
          textColor: Colors.white,
          disabledColor: Colors.grey,
          disabledTextColor: Colors.black,
          padding: EdgeInsets.all(15.0),
          splashColor: Colors.white54,
          onPressed: onPressed,
          child: Text(
            title,
            style: TextStyle(fontSize: 15.0),
          ),
        ),
      ),

    );
  }
}

class HeaderCell extends StatelessWidget {
  final String title;

  HeaderCell(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
        child: SizedBox(
            width: double.infinity,
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
              ),
            )
        )
    );
  }
}
