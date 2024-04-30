import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F4),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.chevron_left),
            Text('Save'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
           children: [
             TextField(
               decoration: InputDecoration(
                 hintText: 'Title',
                 border: InputBorder.none,
                 contentPadding: EdgeInsets.symmetric(horizontal: 8),
               ),
             ),
             Divider(
               height: 2,
               color: Color(0xff7e7e7e),
               indent: 10,
               endIndent: 10,
             ),
             TextField(
               decoration: InputDecoration(
                 border: InputBorder.none,
                 contentPadding: EdgeInsets.symmetric(horizontal: 8),
                 hintText: 'Enter Note', // Add hint for notes
               ),
             ),
           ],

          ),
        ),
      ),

    );
  }
}
