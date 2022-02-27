part of '../sign_in_page.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late TextEditingController _phoneController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _authProvider = Provider.of<AuthenticationProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: Const.margin),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 70),
                  const _BuildLogo(),
                  // const SizedBox(height: Const.space25),
                 // const _BuildSocialButton(),
                  const SizedBox(height: Const.space25),
                  const _BuildDivider(),
                  const SizedBox(height: Const.space25),
                  CustomShakeTransition(
                    duration: const Duration(milliseconds: 1000),
                    child: SizedBox(
                      height: 70,
                      child: IntlPhoneField(
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(Const.radius),
                            borderSide: BorderSide(
                              color: Theme.of(context).disabledColor,
                            ),
                          ),
                        ),
                        initialCountryCode: 'SA',
                        onChanged: (phone) {
                          print(phone.completeNumber);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: Const.space12),
                  _BuildPasswordTextField(
                    passwordController: _passwordController,
                  ),
                  const SizedBox(height: Const.space12),
                  const _BuildForgotPasswordButton(),
                  const SizedBox(height: Const.space12),
                  if (_authProvider.isLoading)
                    const CustomLoadingIndicator()
                  else
                    _BuildSignInButton(
                      emailController: _phoneController,
                      passwordController: _passwordController,
                    ),
                  const SizedBox(height: Const.space12),
                  const _BuildRegisterButton(),
                ],
              ),
              CustomFadeTransition(
                axis: Axis.horizontal,
                duration:const Duration(milliseconds: 200),
                child: CustomTextButton(
                  label: 'Browse as a Guest',
                  enableUnderline: true,
                  fontSize: 16,
                  textColor: Theme.of(context).primaryColor,
                  onTap: () => Get.toNamed<dynamic>(Routes.home),
                ),
              )
             // const _BuildSkipButton(route: Routes.home,),
            ],
          ),
        ),
      ),
    );
  }
}


