import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CreateNote extends StatefulWidget {
  @override
  _CreateNoteState createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();
  TextEditingController _dateTimeController = TextEditingController();

  Future<void> saveNote() async {
    final server = "http://localhost/note"; // Adjust the server URL as needed
    final url = Uri.parse("$server/insert.php");

    // Prepare the data to be sent
    Map<String, dynamic> data = {
      "title": _titleController.text,
      "content": _contentController.text,
      "dateTime": _dateTimeController.text, // Use _dateTimeController.text here
    };

    // Send a POST request to insert the data
    final response = await http.post(url, body: data);

    // Print the response for debugging purposes
    print(response.body);

    // Navigate back to the previous screen after saving the note
    Navigator.pop(context);
  }

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
                Navigator.pop(context); // Navigate back without saving
              },
              child: Icon(Icons.chevron_left),
            ),
            GestureDetector(
              onTap: saveNote, // Call saveNote when the save button is tapped
              child: Text(
                'Save',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
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
                        controller: _titleController,
                        decoration: InputDecoration(
                          hintText: 'Title',
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
                        controller: _contentController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Note',
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
            child: TextField(
              controller: _dateTimeController,
              readOnly: true,
              decoration: InputDecoration(
                hintText: 'Select Date/Time',
              ),
              onTap: () async {
                // Show date picker
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );

                if (selectedDate != null) {
                  // Show time picker
                  final selectedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );

                  if (selectedTime != null) {
                    // Combine date and time into a single DateTime object
                    final selectedDateTime = DateTime(
                      selectedDate.year,
                      selectedDate.month,
                      selectedDate.day,
                      selectedTime.hour,
                      selectedTime.minute,
                    );

                    // Update the controller's text property with the selected date and time
                    setState(() {
                      _dateTimeController.text = selectedDateTime.toString();
                    });
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
