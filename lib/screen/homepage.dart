import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:http/http.dart ' as http;
import 'dart:convert';

import 'package:sql_test/screen/detailpage.dart';
import 'package:sql_test/screen/newData.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


 final String url = "http://192.168.0.197/testflutter/getData.php";

  Future<List> getData() async{
    final response = await http.get(url);
    return json.decode(response.body);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sql testing"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (_)=>NewData()));
        },
        child: Icon(Icons.add),
      ),
      body: FutureBuilder<List>(
        future: getData(),
        builder:(context,snapshot){

        if(snapshot.hasError){
          print("error");
        }
        if(snapshot.hasData){
          return Items(list:snapshot.data);
        }
        else{
          return Center(child: CircularProgressIndicator());
        }

      } ,),
    );
  }
}


class Items extends StatefulWidget {

  List list;
  Items({this.list});

  @override
  _ItemsState createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:widget.list == null ? 0 : widget.list.length,
        itemBuilder: (context,i){
        return ListTile(
          leading: Icon(Icons.message),
          title: Text(widget.list[i]['my_name']),
          subtitle: Text(widget.list[i]["my_no"]),
          onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>DetailPage(list:widget.list, index: i,)));
          },
        );
        });
  }
}

