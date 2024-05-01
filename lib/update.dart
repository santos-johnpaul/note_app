import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: UpdateNote(),
  ));
}

class UpdateNote extends StatefulWidget {
  @override
  _UpdateNoteState createState() => _UpdateNoteState();
}

class _UpdateNoteState extends State<UpdateNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F4),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.chevron_left),
            ),
            
            GestureDetector(
              onTap: () {
                // Handle save functionality here
              },
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Save',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Lorem ipsum',
                          hintStyle: TextStyle(fontSize: 25),
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.only(top: 10, left: 10, right: 10),
                        ),
                        maxLines: null,
                      ),
                    ),
                    Divider(
                      height: 2,
                      color: Color(0xff7e7e7e),
                      indent: 10,
                      endIndent: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla convallis libero non ipsum finibus, quis euismod velit suscipit.',
                        ),
                        maxLines: null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.bottomCenter,
            child: Text(
              '10/10/24  11:11pm',
              style: TextStyle(color: Color(0xff4b4b4b)),
            ),
          ),
        ],
      ),
    );
  }
}
