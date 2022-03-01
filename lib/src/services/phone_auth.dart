import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tkween/src/constants.dart';
import 'package:tkween/src/helpers/constants.dart';
import 'package:tkween/src/helpers/snack_toast.dart';
import 'package:tkween/src/pages/otp/otp_page.dart';
import 'package:tkween/src/providers/authentication_provider.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
PhoneAuth _phoneAuth = PhoneAuth();

void signInWithPhoneNumber(smsController) async {
  try {
    final AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsController.text,
    );

    final User? user = (await _auth.signInWithCredential(credential)).user;

    showToast(msg: "Successfully signed in UID: ${user!.uid}");
  } catch (e) {
    showToast(msg: "Failed to sign in: " + e.toString());
  }
}

Future<void> verifyPhone(BuildContext context, String number) async {
  final PhoneVerificationCompleted verificationCompleted =
      (PhoneAuthCredential credential) async {
    await _auth.signInWithCredential(credential);
    print("hello");
  };

  final PhoneVerificationFailed verificationFailed = (FirebaseAuthException e) {
    print(e.message);
  };

  final PhoneCodeSent smsOtpSend = (String? verId, int? resendToken) async {
    verificationId = verId;
    // showSnackbar(context, title: "sms sent", subtitle: 'please wait..');
    // Get.toNamed<dynamic>(Routes.home);
    print(verId);

    //  _phoneAuth.smsOtpDialog(context, number);

    //  smsOtpDialog(context, number);
  };

  try {
    _auth.verifyPhoneNumber(
      phoneNumber: number,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: smsOtpSend,
      codeAutoRetrievalTimeout: (String verId) {
        verificationId = verId;
      },
    );
  } catch (e) {
    print(e);
  }
}

class PhoneAuth extends StatelessWidget {
  Future smsOtpDialog(BuildContext context, String number) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Column(
              children: [
                Text('Verification Code'),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'Enter 6 digit Code received by SMS',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                )
              ],
            ),
            content: Container(
              height: 85,
              child: TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                maxLength: 6,
                onChanged: (value) {
                  smsOtp = value;
                },
              ),
            ),
            actions: [
              // ignore: deprecated_member_use
              FlatButton(
                onPressed: () async {
                  try {
                    PhoneAuthCredential phoneAuthCredential =
                        PhoneAuthProvider.credential(
                            verificationId: verificationId, smsCode: smsOtp);

                    final User? user =
                        (await _auth.signInWithCredential(phoneAuthCredential))
                            .user;

                    if (user != null) {
                      Get.toNamed<dynamic>(Routes.home);
                    } else {}
                  } catch (e) {
                    print(e.toString());
                    Navigator.of(context).pop();
                  }
                },
                child:
                    Text('Done', style: TextStyle(color: Colors.greenAccent)),
              ),
            ],
          );
        }).whenComplete(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
