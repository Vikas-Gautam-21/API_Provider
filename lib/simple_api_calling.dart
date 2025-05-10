// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   List<dynamic> _data = [];
//   bool _isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _loadData();
//   }

//   Future<void> _loadData() async {
//     try {
//       final response = await http.get(
//         Uri.parse('https://jsonplaceholder.typicode.com/posts'),
//       );

//       if (response.statusCode == 200) {
//         final List<dynamic> result = jsonDecode(response.body);
//         setState(() {
//           _data = result;
//           _isLoading = false;
//         });
//       } else {
//         setState(() {
//           _isLoading = false;
//         });
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Failed to load data: ${response.statusCode}'),
//           ),
//         );
//       }
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//       });
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(SnackBar(content: Text('Error: $e')));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('JSONPlaceholder Data')),
//       body:
//           _isLoading
//               ? const Center(child: CircularProgressIndicator())
//               : ListView.builder(
//                 itemCount: _data.length,
//                 itemBuilder:
//                     (context, index) => ListTile(
//                       title: Text(_data[index]['title']),
//                       subtitle: Text(_data[index]['body']),
//                     ),
//               ),
//     );
//   }
// }
