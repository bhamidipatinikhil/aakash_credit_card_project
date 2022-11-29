import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import '../sample_input/accounts.json';
import 'dart:convert';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final TextEditingController username_controller = TextEditingController();
  final TextEditingController password_controller = TextEditingController();

  Future<dynamic> updateJson(
      String username, String password, BuildContext context) async {
    Map<String, dynamic> to_feed = {
      "Account Name": username,
      "Credit Card Number": 2222,
      "CVV": 2,
      "Balance Amount": 0,
      "Password": password
    };

    final String accounts_str =
        await rootBundle.loadString('json_files/accounts.json');

    accounts_str += ""
    // await rootBundle.loadString("lib/sample_input/accounts.json");

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Scaffold(body: Text("$accounts_str"))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Sign Up Screen")),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.only(left: 500, right: 500),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("USERNAME", style: TextStyle(fontWeight: FontWeight.bold)),
          TextField(
            controller: username_controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Username Entry",
              hintText: "Enter the Username of your choice",
            ),
          ),
          Text("PASSWORD", style: TextStyle(fontWeight: FontWeight.bold)),
          TextField(
              obscureText: true,
              controller: password_controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password Entry",
                  hintText: "Enter the Password of you choice")),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          Center(
              child: ElevatedButton(
            child: Text(
              "Sign Up",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              updateJson("Nikhil", "B", context);
            },
          ))
        ]),
      )),
    );
  }
}
