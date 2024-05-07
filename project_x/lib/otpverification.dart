import 'package:flutter/material.dart';

class OTPVerificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify OTP'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OTPTextField(),
                  OTPTextField(),
                  OTPTextField(),
                  OTPTextField(),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // TODO: Implement OTP validation logic
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.lightBlue[200]),
                ),
                child: Text('Verify OTP'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OTPTextField extends StatefulWidget {
  @override
  _OTPTextFieldState createState() => _OTPTextFieldState();
}

class _OTPTextFieldState extends State<OTPTextField> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: TextField(
        controller: _controller,
        keyboardType: TextInputType.number,
        maxLength: 1,
        textAlign: TextAlign.center,
        onChanged: (String value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus(); // Move to next field
          }
        },
        decoration: InputDecoration(
          counter: Offstage(),
          contentPadding: EdgeInsets.symmetric(vertical: 10),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
