import 'dart:convert';
import 'package:flutter/material.dart';
import 'create.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

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
  TextEditingController _title = TextEditingController();
  TextEditingController _content = TextEditingController();
  TextEditingController _dateTime = TextEditingController();
  final server = "http://localhost/note";
  List<dynamic> notes = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final url = Uri.parse("$server/notes_json.php");
    try {
      final response = await http.get(url);
      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.body}");
      if (response.statusCode == 200) {
        setState(() {
          notes = jsonDecode(response.body);
        });
      } else {
        // Handle error responses
        print("Failed to load notes: ${response.statusCode}");
      }
    } catch (e) {
      // Handle network errors
      print("Error loading notes: $e");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F4),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        centerTitle: true,
        title: Text('App Name'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                color: Color(0xFFFFFFFF),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 8),
                  ),
                  onChanged: (value) {
                    // Handle search functionality here
                  },
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      border: Border.all(color: Colors.black, width: 1.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    width: double.maxFinite,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notes[index]['title'],
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(notes[index]['content']),
                        Text(
                          notes[index]['dateTime'],
                          style: TextStyle(color: Color(0xff4b4b4b)),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateNote()),
          );
          // After adding a new note, reload the data
          loadData();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 2.0,
        shape: CircleBorder(side: BorderSide(color: Colors.black, width: 2.0)),
      ),
    );
  }
}
