import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'modals/item_details.dart';

Future<ItemDetails> fetchData() async {
  final response = await http.get(
      Uri.parse("https://fakestoreapi.com/products"));

  if (response.statusCode == 200) {
    print(response.body);
    print("successful");
    return ItemDetails.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load url');
  }
}




class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<ItemDetails> _itemDetails;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: ElevatedButton(
            child: Text("click me"),
            onPressed: (){
              fetchData();
              print("success");
            },
          ),
        ),
      ),
    );
  }
}
