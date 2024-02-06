import 'package:ck_coding_test/utils/extension.dart';
import 'package:flutter/material.dart';

class WalletSection extends StatelessWidget {
  const WalletSection({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> accounts = ['John', 'Jerry', 'Suu', 'Marry', 'Rose'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: context.hp(3),
        ),
        Text(
          'Linked Account',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: context.hp(3),
        ),
        ...accounts
            .map(
              (item) => _LinkedAccountTile(name: item),
            )
            .toList(),
      ],
    );
  }
}

class _LinkedAccountTile extends StatelessWidget {
  const _LinkedAccountTile({required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.wp(2)),
      margin: EdgeInsets.only(bottom: context.wp(5)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey.shade300,
      ),
      child: ListTile(
        dense: true,
        leading: const Icon(Icons.account_balance_outlined),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.black),
                ),
                Container(
                  width: 1,
                  height: 15,
                  margin: EdgeInsets.symmetric(horizontal: context.wp(2)),
                  color: Colors.black,
                ),
                Text(
                  'xxxx56789',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.black),
                ),
              ],
            ),
            SizedBox(
              height: context.wp(1),
            ),
            Row(
              children: [
                Text(
                  'balance : ',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.black),
                ),
                Text(
                  '123,456,789',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.black),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
