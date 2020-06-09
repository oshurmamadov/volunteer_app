
import 'package:flutter/material.dart';
import 'package:volunteerapp/common/utils.dart';
import '../data/translations_wrapper.dart';

class NewRequest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('new_request'.tr()),
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            NewRequestSimpleCell('product'.tr()),
            NewRequestSimpleCell('product_count'.tr()),
            NewRequestSimpleCell('storage'.tr()),
            Padding(
              padding: EdgeInsets.all(15),
              child:  TextField(
                maxLines: null,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "comment_hint".tr()
                ),
              ),
            ),
            CustomButton('add_send_btn'.tr(), (){})
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
                  hintText: "add_hint".tr()
              ),
            ),
          )
        ],
      ),
    );
  }
}