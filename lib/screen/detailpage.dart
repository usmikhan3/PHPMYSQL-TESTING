import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  List list;
  int index;

  DetailPage({this.list,this.index});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {


  void confirm(){



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
                Text(widget.list[widget.index]['my_name'],style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                Text(widget.list[widget.index]['my_no'],style: TextStyle(fontSize: 16),),
                MaterialButton(onPressed: (){},
                child: Text("Edit"),
                  color: Colors.deepOrange,
                ),
                MaterialButton(onPressed: (){confirm();},
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
