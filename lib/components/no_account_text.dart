import 'package:ecommerce/constants.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don not have an account?',
          style: TextStyle(fontSize: getProportionateScreenWidth(18)),
        ),
        const SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            'Signup',
            style: TextStyle(
                fontSize: getProportionateScreenWidth(18),
                color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
