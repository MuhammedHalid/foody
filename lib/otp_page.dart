import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final controller = TextEditingController();
  final focusNode = FocusNode();

  Timer? _timer;
  int _start = 30;
  bool _isButtonDisabled = true;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            _isButtonDisabled = false;
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  void resendOtp() {
    setState(() {
      _start = 30;
      _isButtonDisabled = true;
    });
    startTimer();
    // Add your resend OTP logic here
  }

  @override
  Widget build(BuildContext context) {
    // final defaultPinTheme = PinTheme(
    //   width: 60,
    //   height: 64,
    //   textStyle: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
    //   decoration:
    //       const BoxDecoration(color: Color.fromRGBO(159, 132, 193, 0.8)),
    // );

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "OTP VERIFICATION",
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text("code Just Sent to 9876254231"),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Pinput(
              length: 4,
              controller: controller,
              focusNode: focusNode,
              separatorBuilder: (index) => Container(
                height: 64,
                width: 10,
                color: Colors.white,
              ),
              showCursor: true,
            ),
          ),
          SizedBox(height: 20),
          Text(
            _isButtonDisabled
                ? "Resend OTP in $_start seconds"
                : "You can now resend the OTP",
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _isButtonDisabled ? null : resendOtp,
            child: Text("Resend OTP"),
          ),
        ],
      ),
    );
  }
}
