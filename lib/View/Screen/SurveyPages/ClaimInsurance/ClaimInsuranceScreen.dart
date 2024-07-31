import 'package:flutter/material.dart';

import 'Models/claim_data.dart';
import 'Widgets/claim_information_step.dart';
import 'Widgets/personal_information_step.dart';
import 'Widgets/review_step.dart';
import 'package:google_fonts/google_fonts.dart';


class ClaimInsuranceForm extends StatefulWidget {
  @override
  _ClaimInsuranceFormState createState() => _ClaimInsuranceFormState();
}

class _ClaimInsuranceFormState extends State<ClaimInsuranceForm> {
  int _currentStep = 0;
  final _formKey = GlobalKey<FormState>();
  ClaimData _claimData = ClaimData();

  List<Widget> get _formSteps => [
    ClaimInformationStep(
      claimData: _claimData,
      onChanged: (data) => setState(() => _claimData = data),
    ),
    PersonalInformationStep(
      claimData: _claimData,
      onChanged: (data) => setState(() => _claimData = data),
    ),
    ReviewStep(claimData: _claimData),
  ];

  void _nextStep() {
    if (_currentStep < _formSteps.length - 1) {
      setState(() => _currentStep += 1);
    } else {
      _submitForm();
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() => _currentStep -= 1);
    }
  }

  void _submitForm() {
    // Implement form submission logic here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Claim submitted successfully')),
    );
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: _currentStep == 0 ? () => Navigator.of(context).pop() : _previousStep,
        ),
        title: Text('Step ${_currentStep + 1}/3: New Claim', style: GoogleFonts.mulish(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: _formSteps[_currentStep],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: _nextStep,
          child: Text(_currentStep < _formSteps.length - 1 ? 'Next' : 'Submit', style: GoogleFonts.mulish(color: Colors.white)),
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            padding: EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}