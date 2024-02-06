import 'package:ck_coding_test/utils/constants.dart';
import 'package:ck_coding_test/utils/extension.dart';
import 'package:flutter/material.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.wp(90),
      height: context.hp(15),
      padding: EdgeInsets.symmetric(
          horizontal: context.wp(3), vertical: context.wp(2.5)),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [kPrimaryColor, kSecondaryColor],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Balance',
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Colors.white),
          ),
          SizedBox(
            height: context.hp(2),
          ),
          Text(
            '1,000,000 Ks',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Colors.white),
          ),
          const Spacer(),
          Row(
            children: [
              Text.rich(
                TextSpan(
                  text: 'Platinum ',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.white),
                  children: [
                    TextSpan(
                      text: '93,674 Points',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Text(
                'Expired in Dec 20, 24',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}