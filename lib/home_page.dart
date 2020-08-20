import 'package:cyber_crime_db/fragments/fragment_home.dart';
import 'package:cyber_crime_db/fragments/fragment_form.dart';
import 'package:cyber_crime_db/fragments/fragment_contact_us.dart';
import 'package:cyber_crime_db/fragments/fragment_privacy_policy.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class HomePage extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Home", Icons.home),
    new DrawerItem("About", Icons.label_outline),
    new DrawerItem("Contact", Icons.contact_mail),
    new DrawerItem("Privacy Policy", Icons.info)
  ];

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new HomeFragment();
      case 1:
        return new FormFragment();
      case 2:
        return new SecondFragment();
      case 3:
        return new ThirdFragment();

      default:
        return new Text("Something went wrong");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerOptions = [];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
          new ListTile(
            leading: new Icon(d.icon),
            title: new Text(d.title),
            selected: i == _selectedDrawerIndex,
            onTap: () => _onSelectItem(i),
          )
      );
    }

    return new Scaffold(
      backgroundColor: Colors.transparent,
      appBar: new AppBar(
        backgroundColor: Colors.cyan,
        // here we display the title corresponding to the fragment
        // you can instead choose to have a static title
        title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            _createHeader(),
            new Column(children: drawerOptions),
            Container(
              alignment: Alignment.bottomCenter,
              color: Colors.black,
              width: double.infinity,
              height: 0.1,
            ),
            Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.bottomCenter,
                height: 100,
                child: Text("",style: TextStyle(fontWeight: FontWeight.bold),)),
            Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.bottomCenter,
                height: 100,
                child: Text("V1.0.0 | Supported by Amicritas",style: TextStyle(fontWeight: FontWeight.bold),))

          ],
        ),
      ),
      body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(),
              child:  _getDrawerItemWidget(_selectedDrawerIndex),
          ),
      ),
    );
  }
}

Widget _createHeader() {
  return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image:  AssetImage('images/user.png'))),
      child: Stack(children: <Widget>[
        Positioned(
            bottom: 12.0,
            left: 16.0,
            child: Text("Cyber help-DB DMP",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500))),
      ]));
}



