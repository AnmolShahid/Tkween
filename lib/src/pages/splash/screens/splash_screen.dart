part of '../splash_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  checkOnAppStart()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool key=prefs.getBool('key')??false;
    if(key){
      Get.offAllNamed(Routes.signIn);
    }else{
      prefs.setBool('key', true);
      Get.offAll(SelectLanguage());
    }

  }

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () => checkOnAppStart(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          // child: SvgPicture.asset(
          //   CustomIcon.logo,
          // ),
          child: Image.asset(
            'assets/splash.jpeg',
            fit: BoxFit.fill,
            width:double.maxFinite,
            height: MediaQuery.of(context).size.height,
          ),
        ),
      ),
    );
  }
}
