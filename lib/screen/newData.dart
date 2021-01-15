import 'package:flutter/material.dart';
import 'package:sql_test/screen/homepage.dart';
import 'package:http/http.dart' as http;


class NewData extends StatefulWidget {
  @override
  _NewDataState createState() => _NewDataState();
}

class _NewDataState extends State<NewData> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numbController = TextEditingController();

  void addData() async{
    var url = "http://192.168.0.197/testflutter/addData.php";
   await http.post(url,body: {
      'my_name':nameController.text,
          'my_no':numbController.text,
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add New Data"),
      ),
      body: ListView(
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              hintText: "Enter name",
              labelText: "Name"
            ),
          ),
          TextField(
            controller: numbController,
            decoration: InputDecoration(
                hintText: "Enter number",
                labelText: "number"
            ),
          ),
          MaterialButton(
            onPressed: (){
              addData();
              Navigator.push(context, MaterialPageRoute(builder: (_)=>HomePage()));
            },

            child: Text("Add Data"),
            color: Colors.blueGrey,
          )
        ],
      ),
    );
  }
}
