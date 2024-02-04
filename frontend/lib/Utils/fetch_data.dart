import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<String>> calculateShortestPath(String startBlock, String endBlock) async {
  final response = await http.post(Uri.parse('http://192.168.56.1:3000/calculate-path'),
    headers: <String, String>{
      "Content-Type": "application/json"
    },
    body: jsonEncode({'startBlock': startBlock, 'endBlock': endBlock})
    );

  if(response.statusCode == 200){
    final decodedResponse = jsonDecode(response.body);
    return List<String>.from(decodedResponse['shortestPath']);
  }
  else{
    throw Exception("Response Failed");
  }

}

Future<List<Map<String, dynamic>>> fetchAllBlocks() async {
  final response = await http.get(Uri.parse("http://192.168.56.1:3000/blocks"),
  headers: <String, String>{
    "Content-Type": "application/json"
  });

  if(response.statusCode == 200){
    final decodedResponse = jsonDecode(response.body);
    return List<Map<String, dynamic>>.from(decodedResponse);
  }
  else{
    throw Exception("Response Failed");
  }

}