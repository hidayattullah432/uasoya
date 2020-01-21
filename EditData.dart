import 'package:uas2/Landing.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';


class EditData extends StatefulWidget {
  final List list;
  final int index;
  EditData({this.list, this.index});
  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  
  TextEditingController controllernama = new TextEditingController();
  TextEditingController controllerposisi = new TextEditingController();
  TextEditingController controllergaji = new TextEditingController();
  
  void editData() {
    var url = "http://192.168.42.180/DayWeb/pegawai/editPegawai.php";
    http.post(url, body: {

      
      "nama": controllernama.text,
      "posisi": controllerposisi.text,
      "gaji": controllergaji.text
    });
  }

  @override
  void initState() {
    controllernama =
        new TextEditingController(text: widget.list[widget.index]['nama']);
    controllerposisi = new TextEditingController(
        text: widget.list[widget.index]['posisi']);
    controllergaji = new TextEditingController(
        text: widget.list[widget.index]['gaji']);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
// TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Edit Data Pegawai'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                    controller: controllernama,
                    decoration: new InputDecoration(
                        hintText: "Input Nama Pegawai",
                        labelText: "Nama Lengkap",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0)))),
                new Padding(padding: new EdgeInsets.all(5.0)),
                new TextField(
                    controller: controllerposisi,
                    decoration: new InputDecoration(
                        hintText: "Input Posisi",
                        labelText: "Posisi",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0)))),
                new Padding(padding: const EdgeInsets.all(5.0)),
                new TextField(
                    controller: controllergaji,
                    decoration: new InputDecoration(
                        hintText: "Input Gaji",
                        labelText: "Gaji",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0)))),
                new Padding(padding: new EdgeInsets.all(5.0)),
                
                new RaisedButton(
                  child: new Text("Edit Data"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    editData();
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
