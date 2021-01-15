// import 'package:flutter/material.dart';
// import 'package:sql_test/model/usermodel.dart';
// import 'package:sql_test/service/userService.dart';
// import 'package:toast/toast.dart';
//
// class AddEditUser extends StatefulWidget {
//   @override
//   _AddEditUserState createState() => _AddEditUserState();
// }
//
// class _AddEditUserState extends State<AddEditUser> {
//
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//
//   add(UserModel userModel) async{
//       await UserService().addUser(userModel).then((success){
//         Toast.show("Add Successfully", context,gravity: Toast.CENTER,duration: 2 );
//         //print("Add Successfully");
//       });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Add"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: nameController,
//                 decoration: InputDecoration(
//                   hintText: "Enter name",
//                 ),
//             ),
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(
//                 hintText: "Enter email",
//               ),
//             ),
//             RaisedButton(onPressed: (){
//               if(nameController.text.isEmpty){
//                 Toast.show("This field is required", context,gravity: Toast.CENTER,duration: 2 );
//               }else{
//                 UserModel userModel = UserModel(name: nameController.text,email: emailController.text);
//                 add(userModel);
//               }
//             },child: Text("Save"),)
//
//           ],
//         ),
//       ),
//     );
//   }
// }
