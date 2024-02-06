import 'package:ck_coding_test/utils/extension.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> accounts = ['John', 'Jerry', 'Suu', 'Marry', 'Rose'];

    return Scaffold(
      backgroundColor: Colors.grey,
      body: DraggableScrollableSheet(
        initialChildSize: 0.25,
        minChildSize: 0.25,
        maxChildSize: 0.9,
        builder: (context, scrollController) {
          return Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  width: context.wp(100),
                  padding: EdgeInsets.symmetric(horizontal: context.wp(5)),
                  height: context.hp(8),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                width: context.wp(20),
                                height: context.hp(8),
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                        Icons.account_balance_wallet_outlined),
                                    SizedBox(
                                      height: context.hp(1),
                                    ),
                                    const Text('Wallet'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                width: context.wp(20),
                                height: context.hp(8),
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.tornado_outlined),
                                    SizedBox(
                                      height: context.hp(1),
                                    ),
                                    const Text('Service'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: -35,
                        right: context.wp(45) - 60,
                        child: Container(
                          width: 120,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 10, color: Colors.grey),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: const Icon(Icons.qr_code),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    addAutomaticKeepAlives: false,
                    addRepaintBoundaries: false,
                    controller: scrollController,
                    padding: EdgeInsets.symmetric(horizontal: context.wp(5)),
                    children: [
                      Container(
                        width: context.wp(90),
                        height: context.hp(15),
                        padding: EdgeInsets.symmetric(
                            horizontal: context.wp(3),
                            vertical: context.wp(2.5)),
                        decoration: BoxDecoration(
                          // gradient: const LinearGradient(
                          //   colors: [Color(0xFF8F0612), Color(0xFFBF0D23)],
                          //   begin: Alignment.topLeft,
                          //   end: Alignment.bottomRight,
                          // ),
                          color: Colors.blue,
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
                      ),
                      SizedBox(
                        height: context.hp(5),
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
                            (e) => Container(
                              padding: EdgeInsets.all(context.wp(2)),
                              margin: EdgeInsets.only(bottom: context.wp(5)),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey.shade300,
                              ),
                              child: ListTile(
                                dense: true,
                                leading: const Icon(Icons.money),
                                title: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          e,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(color: Colors.black),
                                        ),
                                        Container(
                                          width: 1,
                                          height: 15,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: context.wp(2)),
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
                            ),
                          )
                          .toList(),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
