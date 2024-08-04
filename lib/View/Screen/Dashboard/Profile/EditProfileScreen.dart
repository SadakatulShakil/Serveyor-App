import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';

import 'package:intl/intl.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  File? _image;
  final picker = ImagePicker();
  DateTime? _selectedDate;
  String _gender = 'Male';
  String _language = 'English';

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Column(
        children: [
          // Fixed profile image section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: getImage,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: _image != null
                        ? FileImage(_image!)
                        : AssetImage('assets/images/mahim.png') as ImageProvider,
                  ),
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.edit, color: Colors.white, size: 20),
                  ),
                ],
              ),
            ),
          ),
          // Scrollable form fields
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    buildTextField('Name', 'Md. Mahim Chawdhury'),
                    buildTextField('Email', 'john.doe@example.com'),
                    buildPhoneField(),
                    buildDatePicker(context),
                    buildGenderDropdown(),
                    buildTextField('Address', '123 Main St, City, Country'),
                    buildLanguageDropdown(),
                  ],
                ),
              ),
            ),
          ),
          // Fixed bottom button
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: ElevatedButton(
              child: Text('Save', style: GoogleFonts.mulish(color: Colors.white),),
              onPressed: () {/* Save logic */},
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 15),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(String label, String initialValue) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        initialValue: initialValue,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget buildPhoneField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: TextFormField(
              initialValue: '+1',
              decoration: InputDecoration(
                labelText: 'Code',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            flex: 5,
            child: TextFormField(
              initialValue: '123 456 7890',
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDatePicker(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: () => _selectDate(context),
        child: AbsorbPointer(
          child: TextFormField(
            decoration: InputDecoration(
              labelText: 'Date of Birth',
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.calendar_today),
            ),
            controller: TextEditingController(
              text: _selectedDate != null
                  ? DateFormat('MM/dd/yyyy').format(_selectedDate!)
                  : '',
            ),
          ),
        ),
      ),
    );
  }

  Widget buildGenderDropdown() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: DropdownButtonFormField<String>(
        value: _gender,
        decoration: InputDecoration(
          labelText: 'Gender',
          border: OutlineInputBorder(),
        ),
        items: ['Male', 'Female', 'Other'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (newValue) {
          setState(() {
            _gender = newValue!;
          });
        },
      ),
    );
  }

  Widget buildLanguageDropdown() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: DropdownButtonFormField<String>(
        value: _language,
        decoration: InputDecoration(
          labelText: 'Language',
          border: OutlineInputBorder(),
        ),
        items: ['Bangla', 'English', 'Both'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (newValue) {
          setState(() {
            _language = newValue!;
          });
        },
      ),
    );
  }
}