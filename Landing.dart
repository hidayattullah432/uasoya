import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'Delete.dart';
import 'AddData.dart';

class landing extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<landing> {
// ini method yg kita gunakan untuk mengambil data dari server
  Future<List> getData() async {
    final response =
        await http.get("http://192.168.42.180/DayWeb/pegawai/getKoneksi.php");
    return json.decode(response.body); // hanya body yang di ambil
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: new AppBar(
          title: Text("Data Pegawai"),
          backgroundColor: Colors.cyan,
        ),
        floatingActionButton: new FloatingActionButton(
          child: new Icon(
            Icons.add_to_queue,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).push(
            new MaterialPageRoute(
              builder: (BuildContext context) => new AddData(),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        body: new FutureBuilder<List>(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? new ItemList(
                    list: snapshot.data,
                  )
                : new Center(
                    child: new CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, i) {
          return new Container(
            child: new GestureDetector(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new Detail(
                        list: list,
                        index: i,
                      ))),
              child: new Card(
                color: Colors.white,
                child: new ListTile(
                  title: new Text(list[i]['nama']),
                  leading: new Icon(Icons.local_library),
                  subtitle: new Text("Npm : ${list[i]['npm']}"),
                ),
              ),
            ),
          );
        });
  }
}
