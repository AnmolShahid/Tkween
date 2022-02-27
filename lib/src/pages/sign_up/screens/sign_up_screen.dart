part of '../sign_up_page.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController _usernameController;
  late TextEditingController confirmPhone;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _phoneController;

  bool checkedValue=false;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _phoneController = TextEditingController();
    confirmPhone= TextEditingController();

  }

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<AuthenticationProvider>(
      builder: (context, provider, snapshot) {
        return Scaffold(
          appBar: CustomAppBar(context),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: Const.margin),
            children: [
              const _BuildLogo(),
              const SizedBox(height: Const.space25),

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

              const SizedBox(height: Const.space25),
              _BuildUsernameTextField(usernameController: _usernameController),
              const SizedBox(height: Const.space25),
              _BuildEmailTextField(emailController: _emailController),
              const SizedBox(height: Const.space25),
              _BuildPasswordTextField(passwordController: _passwordController),
              const SizedBox(height: Const.space25),
              CheckboxListTile(
                contentPadding:EdgeInsets.all(0),
                title: GestureDetector(
                    onTap: (){
                      Get.dialog(PolicyDialog(mdFileName: 'policy.md',));
                    },
                    child: RichText(text:TextSpan(
                      children: [
                        TextSpan(
                          text: "By clicking you are agree with ",
                    style: TextStyle(color: Colors.black)
                        ),
                        TextSpan(
                          text: 'terms ',
                          style: TextStyle(color: theme.primaryColor)
                        ),
                        TextSpan(
                            text: '& ',
                            style: TextStyle(color: theme.primaryColor)
                        ),
                        TextSpan(
                          text: 'conditions',
                            style: TextStyle(color: theme.primaryColor)

                    ),
                        TextSpan(
                            text: ' and ',
                            style: TextStyle(color: Colors.black)
                        ),
                        TextSpan(
                            text: ' privacy policy ',
                            style: TextStyle(color:theme.primaryColor)
                        ),
                      ]
                    ),)),
                value: checkedValue,
                onChanged: (newValue) {
                  checkedValue=newValue!;
                  setState(() {});
                },
                controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
              ),
              const SizedBox(height: Const.space25),
              // const _BuildGenderRadioButton(),
              // const SizedBox(height: Const.space12),
              if (provider.isLoading)
                const CustomLoadingIndicator()
              else
                _BuildRegisterButton(
                  usernameController: _usernameController,
                  emailController: _emailController,
                  passwordController: _passwordController,
                ),
              const SizedBox(height: Const.space12),
              const _BuildLoginButton(),
              const SizedBox(height: Const.space25),

              const _BuildDivider(),
              const SizedBox(height: Const.space25),
              const _BuildSocialButton(),
              const SizedBox(height: Const.space25),

            ],
          ),
        );
      },
    );
  }
}

