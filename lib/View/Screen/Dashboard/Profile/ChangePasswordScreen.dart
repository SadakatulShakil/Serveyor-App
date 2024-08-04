import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscureCurrentPassword = true;
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password',
            style: GoogleFonts.mulish()
      ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Icon(
                Icons.lock_open,
                size: 80,
                color: Colors.blue,
              ),
              SizedBox(height: 20),
              Text(
                'CHANGE PASSWORD',
                style: GoogleFonts.mulish(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Make sure you remember your password!',
                style: GoogleFonts.mulish(color: Colors.grey),
              ),
              SizedBox(height: 30),
              buildPasswordField(
                'Current password',
                _currentPasswordController,
                _obscureCurrentPassword,
                    (val) => setState(() => _obscureCurrentPassword = !_obscureCurrentPassword),
              ),
              SizedBox(height: 20),
              buildPasswordField(
                'New password',
                _newPasswordController,
                _obscureNewPassword,
                    (val) => setState(() => _obscureNewPassword = !_obscureNewPassword),
              ),
              SizedBox(height: 20),
              buildPasswordField(
                'Confirm new password',
                _confirmPasswordController,
                _obscureConfirmPassword,
                    (val) => setState(() => _obscureConfirmPassword = !_obscureConfirmPassword),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                child: Text('CHANGE PASSWORD', style: GoogleFonts.mulish(color: Colors.white),),
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPasswordField(String label, TextEditingController controller, bool obscureText, Function(bool) onPressed) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.mulish(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            obscureText ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ),
          onPressed: () => onPressed(!obscureText),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        return null;
      },
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Implement password change logic here
      print('Password change submitted');
    }
  }

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}