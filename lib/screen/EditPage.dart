import 'package:flutter/material.dart';
import 'package:sql_test/screen/homepage.dart';
import 'package:http/http.dart' as http;


class Edit extends StatefulWidget {


  final List list;
  final int index;

  Edit({this.list,this.index});
  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  TextEditingController cname = TextEditingController();
  TextEditingController cmobile = TextEditingController();

  void editData() async{
    var url = "http://192.168.0.197/testflutter/editData.php";
   await http.post(url, body: {
      'my_id': widget.list[widget.index]['my_id'],
      'my_name': cname.text,
      'my_no': cmobile.text
    });
  }

  @override
  void initState() {
    cname = TextEditingController(text:widget.list[widget.index]['my_name'] );
    cmobile = TextEditingController(text:widget.list[widget.index]['my_no'] );
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit data for ${widget.list[widget.index]["my_name"]}"),
      ),
      body: ListView(
        children: [
          TextField(
            controller: cname,
            decoration: InputDecoration(
              hintText: "Enter name",
              labelText: "Enter name"
            ),
          ),
          TextField(
            controller: cmobile,
            decoration: InputDecoration(
                hintText: "Enter number",
                labelText: "Enter number"
            ),
          ),
          MaterialButton(onPressed: (){
            editData();
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>HomePage()));
          },
          child: Text("Edit data"),)
        ],
      ),
    );
  }
}
