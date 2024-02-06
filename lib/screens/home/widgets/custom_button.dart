import 'package:ck_coding_test/utils/extension.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.icon,
    required this.btnText,
    required this.onTap,
  });

  final Widget icon;
  final String btnText;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: context.wp(20),
          height: context.hp(8),
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon,
              SizedBox(
                height: context.hp(1),
              ),
              Text(btnText),
            ],
          ),
        ),
      ),
    );
  }
}
