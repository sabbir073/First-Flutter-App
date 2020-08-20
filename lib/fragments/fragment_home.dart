import 'package:flutter/material.dart';
import 'package:cyber_crime_db/fragments/fragment_form.dart';

class HomeFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
        height: MediaQuery.of(context).size.height / 1,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            //stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              Colors.teal[50],
              Colors.cyan[50],
              Colors.blue[50],
            ],
          ),
        ),
        child: new Center(
          child: new HomepageFragment(),
        )
    );
  }

}

class HomepageFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: new GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          MyMenu(titleText: "Add Complain", iconImage: Icons.add_box, iconColor: Colors.cyan,),
          MyMenu(titleText: "Log In", iconImage: Icons.account_box, iconColor: Colors.cyan,),
          MyMenu(titleText: "About App", iconImage: Icons.airplay, iconColor: Colors.cyan,),
          MyMenu(titleText: "How we Work", iconImage: Icons.alarm_on, iconColor: Colors.cyan,),
          MyMenu(titleText: "All Complains ", iconImage: Icons.apps, iconColor: Colors.cyan,),
          MyMenu(titleText: "Privacy", iconImage: Icons.assistant, iconColor: Colors.cyan,),
        ],
      ),
    );
  }
}

class MyMenu extends StatelessWidget {

  MyMenu({this.titleText, this.iconImage, this.iconColor,});
  final String titleText;
  final IconData iconImage;
  final MaterialColor iconColor;

  @override
  Widget build(BuildContext context) {
    return new Card(
      color: Colors.white,
      margin: EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {},
        splashColor: Colors.green,
        child: new Center(
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                iconImage,
                size: 100.0,
                color: iconColor,
              ),
              Text(titleText, style: new TextStyle(fontSize: 17, color: Colors.teal[800])),

            ],
          ),
        ),
      ),
    );
  }
}
