import 'package:uas2/Landing.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  
  TextEditingController namaController = new TextEditingController();
  TextEditingController posisiController = new TextEditingController();
  TextEditingController gajiController = new TextEditingController();

  void addData() {
    var url = "http://192.168.42.180/DayWeb/pegawai/tambahPegawai.php";
    http.post(url, body: {
      "nama": namaController.text,
      "posisi": posisiController.text,
      "gaji": gajiController.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Tambah Data Pegawai"),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[

                new Padding(padding: new EdgeInsets.all(5.0)),
                new TextField(
                    controller: namaController,
                    decoration: new InputDecoration(
                        hintText: "Input Nama Pegawai",
                        labelText: "Nama Lengkap",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0)))),
                new Padding(padding: new EdgeInsets.all(5.0)),
                new TextField(
                    controller: posisiController,
                    decoration: new InputDecoration(
                        hintText: "Input posisi",
                        labelText: "posisi",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0)))),
                new Padding(padding: const EdgeInsets.all(5.0)),
                new TextField(
                    controller: gajiController,
                    decoration: new InputDecoration(
                        hintText: "Input gaji",
                        labelText: "gaji",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0)))),
                
                new Padding(padding: new EdgeInsets.all(5.0)),
                new RaisedButton(
                  child: new Text("Tambah Data"),
                  color: Colors.cyan,
                  onPressed: () {

                    addData();
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new landing()));
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
