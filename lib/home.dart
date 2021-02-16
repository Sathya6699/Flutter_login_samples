import 'package:flutter/material.dart';

import 'model/dataobject.dart';

class CardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xfff88379),
          title: Text('My App'),
        )
    );
    return ListView(
      children: <Widget>[

        Card(
          clipBehavior: Clip.antiAlias,
          color: Colors.pinkAccent,
          elevation: 20,
          margin: EdgeInsets.all(20),
          semanticContainer: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                contentPadding: EdgeInsets.all(24),

              ),
              ButtonBarTheme(
                data: ButtonBarThemeData(),
                child: ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: const Text(
                        'Item1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () {
                        //Navigator.push(
                        // context,
                        // MaterialPageRoute(builder: (context) => InvoiceListPhoto())
                      },
                    ),

                  ],),),


            ],),),
        Card(
          clipBehavior: Clip.antiAlias,
          color: Colors.pinkAccent,
          elevation: 20,
          margin: EdgeInsets.all(20),
          semanticContainer: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                contentPadding: EdgeInsets.all(24),

              ),
              ButtonBarTheme(
                data: ButtonBarThemeData(),
                child: ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: const Text(
                        'Item2',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () {
                        //Navigator.push(
                        // context,
                        // MaterialPageRoute(builder: (context) => InvoiceListPhoto())
                      },
                    ),

                  ],),),


            ],),),
        Card(
          clipBehavior: Clip.antiAlias,
          color: Colors.pinkAccent,
          elevation: 20,
          margin: EdgeInsets.all(20),
          semanticContainer: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                contentPadding: EdgeInsets.all(30),

              ),
              ButtonBarTheme(
                data: ButtonBarThemeData(),
                child: ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: const Text(
                        'Item3',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () {
                        //Navigator.push(
                        // context,
                        // MaterialPageRoute(builder: (context) => InvoiceListPhoto())
                      },
                    ),

                  ],),),


            ],),),
       ],);
  }

}