
import 'package:flutter/material.dart';
import 'package:volunteerapp/common/personal_data.dart';
import 'package:volunteerapp/common/utils.dart';
import 'package:volunteerapp/data/dto.dart';
import 'package:volunteerapp/storage/request_details.dart';

import '../request_creator/doctor_dashboard.dart';

class VolunteerDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Йордамкунак'),
        ),
        body: TabBarView(
          children: [
            StorageActiveRequests('Зинда хоихъен / Active requests', true),
            StorageActiveRequests('Таърих / History', false),
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

class StorageActiveRequests extends StatelessWidget {
  final String title;
  final bool isEditable;

  StorageActiveRequests(this.title, this.isEditable);

  var request = Request(
    [
      ProductUnit('Сипандӯна', '89 дӯна'),
      ProductUnit('Зирдоск', '14 дӯна')
    ],
    'Хъицӯн медпункт',
    '',
    '22.05.2020',
    'Навъ',
    'Мамадназарбеков Давлатбек',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 20),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderCell(title),
          Expanded(
            child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, i) {
                  return Container(
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    color: Colors.white,
                    child: RequestCell(i.toString(), (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return RequestDetails(request, isEditable);
                          })
                      );
                    }),
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}
