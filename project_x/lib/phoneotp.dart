import 'package:flutter/material.dart';
import 'otpverification.dart'; // Importing the OTP Verification file

class PhoneEntryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _phoneNumberController = TextEditingController();

    void _showErrorDialog(String message) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(message),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }

    void _onGetOTP() {
      String phoneNumber = _phoneNumberController.text.trim();
      if (phoneNumber.isEmpty || phoneNumber.length != 10 || !RegExp(r'^[0-9]+$').hasMatch(phoneNumber)) {
        _showErrorDialog('Please enter a valid 10-digit phone number.');
      } else {
        // Implement logic to send OTP
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OTPVerificationPage()),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Phone Number'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _phoneNumberController,
                keyboardType: TextInputType.phone,
                maxLength: 10,
                decoration: InputDecoration(
                  labelText: 'Enter Phone Number',
                ),
                onChanged: (value) {
                  // Remove any non-digit characters from the input
                  _phoneNumberController.text = value.replaceAll(RegExp(r'[^0-9]'), '');
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _onGetOTP,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.lightBlue[200]),
                ),
                child: Text('Get OTP'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
