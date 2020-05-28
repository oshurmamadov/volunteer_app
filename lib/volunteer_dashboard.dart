
import 'package:flutter/material.dart';
import 'package:volunteerapp/personal_data.dart';
import 'package:volunteerapp/utils.dart';

class VolunteerDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Йордамкунен Асбоб'),
        ),
        body: TabBarView(
          children: [
            new Scaffold(
              backgroundColor: Color.fromRGBO(255, 255, 255, 20),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  HeaderCell('Му хазина / My storage'),
                  new Container(
                    color: Colors.white,
                    child: Text('Storage'),
                  ),
                ],
              ),
            ),
            new Container(
              color: Colors.white,
              child: Text('History'),
            ),
            new Container(
              color: Colors.white,
              child: InfoCell(false),
            ),
          ],
        ),
        bottomNavigationBar: new TabBar(
          tabs: [
            Tab(icon: new Icon(Icons.storage),),
            Tab(icon: new Icon(Icons.history),),
            Tab(icon: new Icon(Icons.person),),
          ],
          labelColor: Colors.yellow,
          unselectedLabelColor: Colors.blue,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: EdgeInsets.all(5.0),
          indicatorColor: Colors.red,
        ),
        backgroundColor: Colors.black45,
      ),
    );
  }
}