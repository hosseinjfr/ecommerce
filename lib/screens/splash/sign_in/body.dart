import 'package:ecommerce/components/default_button.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import '../../../components/custom_suffix_icon.dart';
import '../../../components/form_error.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Text(
              'Welcome Back',
              style: TextStyle(
                color: Colors.black,
                fontSize: getProportionateScreenWidth(28),
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Sign in with your email and passsword \n or countinue with social media',
              textAlign: TextAlign.center,
            ),
            Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(10)),
                child: const SignIn()),
          ],
        ),
      ),
    );
  }
}

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final List<String> error = [];

  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmail(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          buildPassword(),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          Row(
            children: [
              Checkbox(value: false, onChanged: (Value) {}),
              const Text('Remember me'),
              const Spacer(),
              const Text(
                'Forgot Password',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              )
            ],
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          FormError(error: error),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          DefaultButton(
              text: 'Continue',
              press: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                }
              }),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
        ],
      ),
    );
  }

  TextFormField buildPassword() {
    return TextFormField(
      obscureText: true,
      onChanged: (value) {
        if (value.isNotEmpty && error.contains(kPassNullError)) {
          setState(() {
            error.remove(kPassNullError);
          });
        } else if (value.length >= 8 && error.contains(kShortPassError)) {
          setState(() {
            error.remove(kShortPassError);
          });
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty && !error.contains(kPassNullError)) {
          setState(() {
            error.add(kPassNullError);
          });
        } else if (value.length < 8 && !error.contains(kShortPassError)) {
          setState(() {
            error.add(kShortPassError);
          });
        }
        return null;
      },
      onSaved: (newValue) => password = newValue!,
      keyboardType: TextInputType.visiblePassword,
      decoration: const InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        suffixIcon: customSuffixIcon(
          icon: 'assets/icons/Lock.svg',
        ),
      ),
    );
  }

  TextFormField buildEmail() {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty && error.contains(kEmailNullError)) {
          setState(() {
            error.remove(kEmailNullError);
          });
        } else if (value.isNotEmpty && error.contains(kInvalidEmailError)) {
          setState(() {
            error.remove(kInvalidEmailError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !error.contains(kEmailNullError)) {
          setState(() {
            error.add(kEmailNullError);
          });
        } else if (value.isNotEmpty && !error.contains(kInvalidEmailError)) {
          setState(() {
            error.add(kInvalidEmailError);
          });
        }
        return null;
      },
      onSaved: (newValue) => email = newValue!,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: 'Email',
        hintText: 'Enter your email',
        suffixIcon: customSuffixIcon(
          icon: 'assets/icons/Mail.svg',
        ),
      ),
    );
  }
}
