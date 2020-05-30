
import 'package:flutter/material.dart';
import 'package:volunteerapp/common/utils.dart';
import '../main.dart';

class InfoCell extends StatelessWidget {
  final bool forDoctors;

  InfoCell(this.forDoctors);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HeaderCell('Шахцэ инфо / Personal data'),
            InfoItemCell('Нӯм / Name', Icons.person),
            InfoItemCell('Тилифӯн / Phone', Icons.phone),
            InfoItemCell('Минтақа / Region', Icons.account_balance),
            InfoItemCell('Мулк / District', Icons.local_convenience_store),
            InfoItemCell('Хъар / City', Icons.location_city),
            InfoItemCell('Ҷойдод / Address', Icons.location_on),
            if (forDoctors) InfoItemCell('Беморӯна / Hospital', Icons.local_hospital),
            CustomButton('Бидал кинху боз', (){})
          ],
        )
    );
  }
}

class InfoItemCell extends StatelessWidget {
  final String _title;
  final IconData _icon;

  InfoItemCell(this._title, this._icon);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        children: <Widget>[
          Icon(_icon, size: 50,),
          Padding(padding: EdgeInsets.all(10)),
          Flexible(
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: _title
              ),
            ),
          )
        ],
      ),
    );
  }
}