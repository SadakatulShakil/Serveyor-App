import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Models/claim_data.dart';

class ClaimInformationStep extends StatefulWidget {
  final ClaimData claimData;
  final Function(ClaimData) onChanged;

  ClaimInformationStep({required this.claimData, required this.onChanged});

  @override
  _ClaimInformationStepState createState() => _ClaimInformationStepState();
}

class _ClaimInformationStepState extends State<ClaimInformationStep> {
  late TextEditingController _policyController;
  late TextEditingController _locationController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _policyController = TextEditingController(text: widget.claimData.policyInformation);
    _locationController = TextEditingController(text: widget.claimData.location);
    _descriptionController = TextEditingController(text: widget.claimData.description);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Claim information', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          _buildDropdownField('Policy information', _policyController),
          SizedBox(height: 16),
          _buildInputField('Location', _locationController, icon: Icons.location_on_outlined),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildDateField('Accident Date')),
              SizedBox(width: 16),
              Expanded(child: _buildTimeField('Accident Time')),
            ],
          ),
          SizedBox(height: 16),
          _buildInputField('Description', _descriptionController, maxLines: 3),
        ],
      ),
    );
  }

  Widget _buildDropdownField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        suffixIcon: Icon(Icons.arrow_drop_down),
      ),
      readOnly: true,
      onTap: () {
        // Implement dropdown functionality here
      },
    );
  }

  Widget _buildInputField(String label, TextEditingController controller, {IconData? icon, int maxLines = 1}) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        suffixIcon: icon != null ? Icon(icon) : null,
      ),
      onChanged: (_) => _updateClaimData(),
    );
  }

  Widget _buildDateField(String label) {
    return TextField(
      readOnly: true,
      onTap: () async {
        final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: widget.claimData.accidentDate,
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );
        if (picked != null && picked != widget.claimData.accidentDate) {
          setState(() {
            widget.claimData.accidentDate = picked;
          });
          _updateClaimData();
        }
      },
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        suffixIcon: Icon(Icons.calendar_today),
      ),
      controller: TextEditingController(
        text: DateFormat('dd MMM, yyyy').format(widget.claimData.accidentDate),
      ),
    );
  }

  Widget _buildTimeField(String label) {
    return TextField(
      readOnly: true,
      onTap: () async {
        final TimeOfDay? picked = await showTimePicker(
          context: context,
          initialTime: widget.claimData.accidentTime,
        );
        if (picked != null && picked != widget.claimData.accidentTime) {
          setState(() {
            widget.claimData.accidentTime = picked;
          });
          _updateClaimData();
        }
      },
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        suffixIcon: Icon(Icons.access_time),
      ),
      controller: TextEditingController(
        text: widget.claimData.accidentTime.format(context),
      ),
    );
  }

  void _updateClaimData() {
    widget.claimData.policyInformation = _policyController.text;
    widget.claimData.location = _locationController.text;
    widget.claimData.description = _descriptionController.text;
    widget.onChanged(widget.claimData);
  }
}