// import 'package:sql_test/model/usermodel.dart';
// import 'package:http/http.dart' as http;
//
// class UserService {
//
//
//   static const add_url = "http://localhost/testflutter/addData.php";
//   Future<String> addUser(UserModel userModel) async{
//       final response = await http.post(add_url,body: userModel.toJsonAdd());
//
//       if(response.statusCode == 200){
//         print("Add Response" + response.body);
//         return response.body;
//       }else{
//         return "error";
//       }
//   }
//
//
// }