import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Models/claim_data.dart';

class PersonalInformationStep extends StatefulWidget {
  final ClaimData claimData;
  final Function(ClaimData) onChanged;

  PersonalInformationStep({required this.claimData, required this.onChanged});

  @override
  _PersonalInformationStepState createState() => _PersonalInformationStepState();
}

class _PersonalInformationStepState extends State<PersonalInformationStep> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.claimData.name);
    _emailController = TextEditingController(text: widget.claimData.email);
    _phoneController = TextEditingController(text: widget.claimData.phone);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Personal Information', style: GoogleFonts.mulish(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          _buildInputField('Name', _nameController),
          SizedBox(height: 16),
          _buildInputField('Email', _emailController),
          SizedBox(height: 16),
          _buildInputField('Phone', _phoneController),
        ],
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,labelStyle: GoogleFonts.mulish(),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onChanged: (_) => _updateClaimData(),
    );
  }

  void _updateClaimData() {
    widget.claimData.name = _nameController.text;
    widget.claimData.email = _emailController.text;
    widget.claimData.phone = _phoneController.text;
    widget.onChanged(widget.claimData);
  }
}