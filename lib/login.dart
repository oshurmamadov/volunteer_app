import 'package:flutter/material.dart';
import 'package:volunteerapp/utils.dart';
import 'package:volunteerapp/volunteer_dashboard.dart';

import 'doctor_dashboard.dart';
import 'main.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Пехъвъоз-----='),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.lock_open, size: 50,),
            LoginSimpleCell('Ху логин въедъ...'),
            LoginSimpleCell('Ху пароль въедъ...'),
            CustomButton('Сатам йордамкун ҷиноу', (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return VolunteerDashboard();
                  })
              );
            }),
            CustomButton('Сатам духтур ҷиноу', (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return DoctorDashboard();
                  })
              );
            })
          ],
        ),
    );
  }
}

class LoginSimpleCell extends StatelessWidget{
  final String title;

  LoginSimpleCell(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: TextField(
        maxLines: null,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: title
        ),
      ),
    );
  }
}