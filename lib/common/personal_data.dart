
import 'package:flutter/material.dart';
import 'package:volunteerapp/common/utils.dart';
import '../data/translations_wrapper.dart';

class InfoCell extends StatelessWidget {
  final bool forDoctors;

  InfoCell(this.forDoctors);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HeaderCell('personal_data'.tr()),
            InfoItemCell('name'.tr(), Icons.person),
            InfoItemCell('phone'.tr(), Icons.phone),
            InfoItemCell('region'.tr(), Icons.account_balance),
            InfoItemCell('district'.tr(), Icons.local_convenience_store),
            InfoItemCell('city'.tr(), Icons.location_city),
            InfoItemCell('address'.tr(), Icons.location_on),
            if (forDoctors) InfoItemCell('hospital'.tr(), Icons.local_hospital),
            CustomButton('change_send_btn'.tr(), (){})
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