import 'dart:math';

import 'package:ck_coding_test/screens/home/widgets/widgets.dart';
import 'package:ck_coding_test/utils/constants.dart';
import 'package:ck_coding_test/utils/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  bool isWalletSection = true;

  ///Animation Controller for [Rotating Icon]
  late final AnimationController _walletIconController;
  late final AnimationController _serviceIconController;

  ///Scroll controller to open [remaining section]
  late final DraggableScrollableController _scrollController;

  ///[FadeInOut] Animation Controller for [Balance Card] & [Linked Account]
  late final Animation _walletSectionFadeInOut;
  late final AnimationController _walletSectionController;

  ///[FadeInOut] Animation Controller for [Service section]
  late final Animation _serviceSectionFadeInOut;
  late final AnimationController _serviceSectionController;

  @override
  void initState() {
    super.initState();
    _walletSectionController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));

    _walletSectionFadeInOut = Tween<double>(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
            parent: _walletSectionController, curve: Curves.linear));

    _serviceSectionController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));

    _serviceSectionFadeInOut = Tween<double>(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
            parent: _serviceSectionController, curve: Curves.linear));

    _walletIconController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _serviceIconController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _scrollController = DraggableScrollableController();
  }

  @override
  void dispose() {
    super.dispose();
    _walletIconController.dispose();
    _serviceIconController.dispose();
    _scrollController.dispose();
    _walletSectionController.dispose();
    _serviceSectionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: DraggableScrollableSheet(
        controller: _scrollController,
        initialChildSize: 0.25,
        minChildSize: 0.25,
        maxChildSize: 0.9,
        builder: (context, scrollController) {
          return Container(
            color: Colors.white,
            child: Column(
              children: [
                ///This is the header section [Wallet - QR - Service]
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
                          CustomButton(
                            icon: RotationTransition(
                              turns: Tween(begin: 0.0, end: 1.0)
                                  .animate(_walletIconController),
                              child: const Icon(
                                  Icons.account_balance_wallet_outlined),
                            ),
                            btnText: 'Wallet',
                            onTap: () {
                              setState(() {
                                isWalletSection = true;  ///[Update section]
                                _walletIconController.forward(from: 0.0);  ///[Rotating Icon]
                              });

                              ///[FadeInOut Wallet Section]
                              _walletSectionController.reverse(from: 1.0); 

                              ///[FadeInOut Service Section]
                              _serviceSectionController.forward(from: 0.0);

                              ///[Scroll to some extend when one of the header btn is tapped]
                              if (_scrollController.size != 0.5) {
                                _scrollController.animateTo(
                                  0.5,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInQuad,
                                );
                              }
                            },
                          ),
                          CustomButton(
                            icon: RotationTransition(
                              turns: Tween(begin: 0.0, end: 1.0)
                                  .animate(_serviceIconController),
                              child: Transform.rotate(
                                  angle: 270 * pi / 180,
                                  child: const Icon(CupertinoIcons.wrench)),
                            ),
                            btnText: 'Service',
                            onTap: () {
                              setState(() {
                                isWalletSection = false; 
                                _serviceIconController.forward(from: 0.0);
                              });

                              _walletSectionController.forward(from: 0.0);

                              _serviceSectionController.reverse(from: 1.0);

                              if (_scrollController.size != 0.5) {
                                _scrollController.animateTo(
                                  0.5,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInQuad,
                                );
                              }
                            },
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
                  child: CustomScrollView(
                    controller: scrollController,
                    slivers: [
                      ///[Walled Card]
                      isWalletSection
                          ? SliverPadding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: context.wp(5)),
                              sliver: SliverToBoxAdapter(
                                child: AnimatedBuilder(
                                  animation: _walletSectionController,
                                  builder: (context, child) {
                                    return Opacity(
                                      opacity: _walletSectionFadeInOut.value,
                                      child: const WalletCard(),
                                    );
                                  },
                                ),
                              ),
                            )
                          : const SliverToBoxAdapter(
                              child: SizedBox.shrink(),
                            ),
                      ///[Linked Account Section]
                      isWalletSection
                          ? SliverPadding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: context.wp(5)),
                              sliver: SliverToBoxAdapter(
                                child: AnimatedBuilder(
                                  animation: _walletSectionController,
                                  builder: (context, child) {
                                    return Opacity(
                                      opacity: _walletSectionFadeInOut.value,
                                      child: const WalletSection(),
                                    );
                                  },
                                ),
                              ),
                            )
                          : const SliverToBoxAdapter(
                              child: SizedBox.shrink(),
                            ),
                      ///[Service Section]      
                      isWalletSection
                          ? const SliverToBoxAdapter(
                              child: SizedBox.shrink(),
                            )
                          : SliverPadding(
                              padding: EdgeInsets.only(top: context.hp(3)),
                              sliver: SliverGrid.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                ),
                                itemCount: 15,
                                itemBuilder: (BuildContext context, int index) {
                                  return AnimatedBuilder(
                                    animation: _serviceSectionController,
                                    builder: (context, child) {
                                      return Opacity(
                                        opacity: _serviceSectionFadeInOut.value,
                                        child: const Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            CircleAvatar(
                                              backgroundColor: kSecondaryColor,
                                              child: Icon(
                                                CupertinoIcons.star,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text('Service'),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
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
