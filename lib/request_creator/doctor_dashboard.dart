
import 'package:flutter/material.dart';
import 'package:volunteerapp/request_creator/new_request.dart';
import 'package:volunteerapp/common/personal_data.dart';
import 'package:volunteerapp/common/utils.dart';
import '../data/translations_wrapper.dart';
import '../login.dart';

class DoctorDashboard extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return DoctorDashboardImpl();
  }
}

class DoctorDashboardImpl extends State<DoctorDashboard> {
  @override
  Widget build(BuildContext context) {
    String _language = 'to_language'.tr();
    String _logout = 'logout'.tr();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('app_title'.tr()),
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) {
                if (value == _language) {
                  setState(() {
                    TranslationWrapper().switchLanguage();
                  });
                } else {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => Login()),
                      (Route<dynamic> route) => false
                  );
                }
              },
              itemBuilder: (BuildContext context) {
                return {_language, _logout}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            )
          ],
        ),
        body: TabBarView(
          children: [
            new Scaffold(
              backgroundColor: Color.fromRGBO(255, 255, 255, 20),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  HeaderCell('my_requests'.tr()),
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
                          '25 ' + 'count'.tr(),
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
              RequestSimpleCell('storage'.tr() + ': Аптека №4'),
              RequestSimpleCell('reporter'.tr() + ': Лашкарбеков Азизбек'),
              Padding(padding: EdgeInsets.all(10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RequestSimpleCell("request_status_done".tr()),
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