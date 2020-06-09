
import 'package:flutter/material.dart';
import 'package:volunteerapp/request_creator/new_request.dart';
import 'package:volunteerapp/common/personal_data.dart';
import 'package:volunteerapp/common/utils.dart';
import '../data/translations_wrapper.dart';

class DoctorDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Йордамкунак'),
        ),
        body: TabBarView(
          children: [
            new Scaffold(
              backgroundColor: Color.fromRGBO(255, 255, 255, 20),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  HeaderCell('Му хоихъен / My requests'),
                  Expanded(
                    child: ListView.builder(
                        itemCount: 20,
                        itemBuilder: (context, i) {
                          return Container(
                            margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                            color: Colors.white,
                            child: RequestCell(i.toString(), (){}),
                          );
                        }
                    ),
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return NewRequest();
                      })
                  );
                },
                tooltip: 'Навъ хоихъ',
                child: Icon(Icons.add),
              ),
            ),
            new Container(
              color: Colors.white,
              child: InfoCell(true),
            ),
          ],
        ),
        bottomNavigationBar: new TabBar(
          tabs: [
            Tab(icon: new Icon(Icons.list),),
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

class RequestCell extends StatelessWidget {
  final String requestNumber;
  final VoidCallback onPressed;

  RequestCell(this.requestNumber,  this.onPressed);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child:  Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Flexible(
                    child: Center(
                        child: Text(
                          'Зирдоск ',
                          style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Arvo'
                          ),
                          textAlign: TextAlign.center,
                        )
                    ),
                  ),
                  Flexible(
                    child: Center(
                        child: Text(
                          '25 дӯна ',
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Arvo'
                          ),
                          textAlign: TextAlign.center,
                        )
                    ),
                  )
                ],
              ),
              //  Flexible(
              Padding(padding: EdgeInsets.all(10)),
              //RequestSimpleCell('Хуҷаин: Азизбеков Лашкарбек'),
              RequestSimpleCell('storage'.translate() + ': Аптека №4'),
              RequestSimpleCell('reporter'.translate() + ': Лашкарбеков Азизбек'),
              Padding(padding: EdgeInsets.all(10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RequestSimpleCell("ҳал судъҷин"),
                  RequestSimpleCell(" | "),
                  RequestSimpleCell("21.05.2020")
                ],
              ),
            ],
          )
      ),
    );
  }
}

class RequestSimpleCell extends StatelessWidget {
  final String title;

  RequestSimpleCell(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
          title,
          style: TextStyle(
              fontSize: 15.0,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontFamily: 'Arvo'
          ),
          textAlign: TextAlign.left,
        )
      // ),
    );
  }
}