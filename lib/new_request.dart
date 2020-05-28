
import 'package:flutter/material.dart';
import 'package:volunteerapp/utils.dart';

import 'main.dart';

class NewRequest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Навъ хоихъ'),
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            NewRequestSimpleCell('Хасхор/Product'),
            NewRequestSimpleCell('Хасхор Дӯна/Product Count'),
            NewRequestSimpleCell('Хазина/Storage'),
            CustomButton('Въедъху боз', (){})
          ],
        ),
      )
    );
  }

}
class NewRequestSimpleCell extends StatelessWidget {
  final String title;

  NewRequestSimpleCell(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Arvo'
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(padding: EdgeInsets.all(5),),
          Expanded(
            flex: 6,
            child: TextField(
              maxLines: null,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "нивиш..."
              ),
            ),
          )
        ],
      ),
    );
  }
}