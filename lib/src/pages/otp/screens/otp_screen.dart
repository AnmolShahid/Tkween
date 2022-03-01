part of '../otp_page.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key, required this.number}) : super(key: key);
  final String? number;
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  // logic to validate otp return [null] when success else error [String]
  Future<String?> validateOtp(String otp) async {
    await Future.delayed(Duration(milliseconds: 2000));
    try {
      print(otp);
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otp);

      final User? user =
          (await _auth.signInWithCredential(phoneAuthCredential)).user;

      if (user != null) {
        Get.offAll(() => HomeScreen());
      } else {
        return "You Entered Wrong OTP";
      }
    } catch (e) {
      print(e.toString());
      Navigator.of(context).pop();
    }
  }

  // action to be performed after OTP validation is success
  void moveToNextScreen(context) {
    Get.offAll(() => HomeScreen());
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: OtpScreen.withGradientBackground(
              topColor: Color.fromARGB(255, 255, 255, 255),
              bottomColor: Color.fromARGB(255, 255, 255, 255),
              otpLength: 6,
              validateOtp: validateOtp,
              routeCallback: moveToNextScreen,
              themeColor: Colors.black,
              titleColor: Colors.black,
              title: "Phone Number Verification",
              subTitle: "Enter the code sent to \n" + widget.number.toString(),
              icon: Image.asset(
                CustomIcon.logo,
                fit: BoxFit.fill,
              ),
            )));
  }
}
