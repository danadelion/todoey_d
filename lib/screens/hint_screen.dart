import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HintScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Hints',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
              ),
            ),
            Wrap(children: [
              Text(
                '1.slide to the left    ',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.lightBlueAccent,
                ),
              ),
              Icon(
                Icons.arrow_back_outlined,
                color: Colors.lightBlueAccent,
                size: 15.0,
              ),
            ]),
            Text(
              '2. tap and press to delete item',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.lightBlueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
