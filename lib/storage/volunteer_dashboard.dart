
import 'package:flutter/material.dart';
import 'package:volunteerapp/common/personal_data.dart';
import 'package:volunteerapp/common/utils.dart';
import 'package:volunteerapp/data/dto.dart';
import 'package:volunteerapp/storage/request_details.dart';
import '../login.dart';
import '../request_creator/doctor_dashboard.dart';
import '../data/translations_wrapper.dart';

class VolunteerDashboard extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return VolunteerDashboardImpl();
  }
}

class VolunteerDashboardImpl extends State<VolunteerDashboard> {

  @override
  Widget build(BuildContext context) {
    String _language = 'to_language'.tr();
    String _logout = 'logout'.tr();
    return DefaultTabController(
      length: 3,
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
            StorageActiveRequests('active_requests'.tr(), true),
            StorageActiveRequests('history'.tr(), false),
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
      ProductUnit('Сипандӯна', '89 ' + 'count'.tr()),
      ProductUnit('Зирдоск', '14 ' + 'count'.tr())
    ],
    'Хъицӯн медпункт',
    '',
    '22.05.2020',
    'request_status_new'.tr(),
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
