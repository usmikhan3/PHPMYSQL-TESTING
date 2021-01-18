import 'package:flutter/material.dart';
import 'package:sql_test/screen/homepage.dart';
import 'EditPage.dart';
import 'package:http/http.dart' as http;

class DetailPage extends StatefulWidget {
  final List list;
  final int index;

  DetailPage({this.list, this.index});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {


  void delete() {
    var url = "http://192.168.0.197/testflutter/deleteData.php";
    http.post(url,body: {
      'my_id':widget.list[widget.index]['my_id']
    });
  }

  void confirm() async {

    AlertDialog alertDialog = new AlertDialog(
      content: Text("Are you Sure?"),
      actions: [
        MaterialButton(onPressed: (){
          delete();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) =>
                      HomePage()));


        },child: Text("Yes"),),
        MaterialButton(onPressed: (){Navigator.pop(context);},child: Text("NO"),),
      ],
    );
    showDialog(context: context,child: alertDialog);

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.list[widget.index]["my_name"]}"),
      ),
      body: Center(
        child: Container(
          child: Center(
            child: Column(
              children: [
                Text(
                  widget.list[widget.index]['my_name'],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.list[widget.index]['my_no'],
                  style: TextStyle(fontSize: 16),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                Edit(list: widget.list, index: widget.index)));
                  },
                  child: Text("Edit"),
                  color: Colors.deepOrange,
                ),
                MaterialButton(
                  onPressed: () {
                    confirm();
                  },
                  child: Text("delete"),
                  color: Colors.lightBlueAccent,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
