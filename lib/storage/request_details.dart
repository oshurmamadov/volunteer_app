

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:volunteerapp/common/utils.dart';
import 'package:volunteerapp/data/dto.dart';
import 'package:volunteerapp/request_creator/doctor_dashboard.dart';

class RequestDetails extends StatelessWidget {
  final Request request;
  final bool isEditable;

  RequestDetails(this.request, this.isEditable);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Хоихъ даруналот'),
          leading: BackButton(
            color: Colors.white,
          ),
        ),
      //SingleChildScrollView(
        body: SingleChildScrollView(
          child:Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RequestSimpleCell("21.05.2020")
                  ],
                ),
                Padding(padding: EdgeInsets.all(10),),
                RequestProductTitle('Намуд/Type: ', request.status),
                Padding(padding: EdgeInsets.all(10),),
                RequestProductTitle('Беморхӯна ё Анбор/Storage: ', request.owner),
                Padding(padding: EdgeInsets.all(10),),
                RequestProductTitle('Ҷавъобгар: ', request.volunteer),
                Padding(padding: EdgeInsets.all(10),),
                Text(
                  'Хасхорен:',
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Arvo'
                  ),
                  textAlign: TextAlign.left,
                ),
                ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: 2,
                        itemBuilder: (context, i) {
                          return RequestProductItem(request.product[0]);
                        }

                ),
                CustomButton('Қабулам чуд', (){})
              ],
            ),
          ),
        )
    );
  }
}

class RequestProductTitle extends StatelessWidget {
  final String title;
  final String desc;

  RequestProductTitle(this.title, this.desc);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 14.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'Arvo'
          ),
          textAlign: TextAlign.left,
        ),
        Text(
          desc,
          style: TextStyle(
              fontSize: 16.0,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontFamily: 'Arvo'
          ),
          textAlign: TextAlign.left,
        )
      ],
    );
  }
}

class RequestProductItem extends StatelessWidget {
  final ProductUnit productUnit;

  RequestProductItem(this.productUnit);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(width: 1, color: Colors.grey),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              productUnit.product + " " + productUnit.productCount,
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Arvo'
              ),
              textAlign: TextAlign.center,
            ),
            Padding(padding: EdgeInsets.all(5),),
            ProductAvailability()
          ],
        ),
      )
      ,
    );
  }
}

class ProductAvailability extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return ProductAvailabilityCell();
  }
}

class ProductAvailabilityCell extends State<ProductAvailability> {
  bool _available = false;
  bool _notAvailable = false;
  bool _partiallyAvailable = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Visibility(
          visible: !_partiallyAvailable,
          child:  ProductAvailabilityCheckBox('Йаст', _available, (value) {
            setState(() {
              _notAvailable = false;
              _partiallyAvailable = false;
              _available = value;
            });
          }),
        ),
        Visibility(
          visible: !_partiallyAvailable,
          child: ProductAvailabilityCheckBox('Нист', _notAvailable, (value) {
            setState(() {
              _available = false;
              _partiallyAvailable = false;
              _notAvailable = value;
            });
          }),
        ),
        Expanded(
          //flex: 50,
          child: Row(
            children: [
              Text(
                'Илав дӯнд',
                style: TextStyle(
                    fontSize: 13.0,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Arvo'
                ),
                textAlign: TextAlign.left,
              ),
              Checkbox(
                value: _partiallyAvailable,
                onChanged: (value) {
                  setState(() {
                    _available = false;
                    _notAvailable = false;
                    _partiallyAvailable = value;
                  });
                },
              ),
              Visibility(
                visible: _partiallyAvailable,
                child: Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "цӯнд дӯна яст?",
                    ),
                  ),
                )
              )
              ,
            ],
          ),
        )
      ],
    );
  }
}

class ProductAvailabilityCheckBox extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  ProductAvailabilityCheckBox(this.title, this.value, this.onChanged);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        //flex: 25,
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Arvo'
              ),
              textAlign: TextAlign.left,
            ),
            Checkbox(
              value: value,
              onChanged: onChanged,
            )
          ],
        )
    );
  }
}
