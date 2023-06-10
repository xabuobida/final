import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:testbuild/Screen/onboardingScreen/one.dart';
import 'package:testbuild/Screen/onboardingScreen/three.dart';
import 'package:testbuild/Screen/onboardingScreen/tow.dart';

class onboarding extends StatefulWidget {
  const onboarding({super.key});

  @override
  State<onboarding> createState() => _onboardingState();
}

class _onboardingState extends State<onboarding> {
  PageController _controller = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 28, right: 20),
                  child: GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(1);
                    },
                    child: const Text(
                      'skip',
                      style: TextStyle(
                          color: Color.fromRGBO(137, 137, 137, 1),
                          fontSize: 14),
                    ).tr(),
                  ),
                )),
            PageView(
                onPageChanged: (index) {
                  setState(() {
                    onLastPage = (index == 2);
                  });
                },
                controller: _controller,
                children: [
                  const introPage1(),
                  const introPage2(),
                  const introPage3()
                ]),
            Container(
                alignment: const Alignment(0, 0.55),
                child: SmoothPageIndicator(controller: _controller, count: 3)),
            onLastPage
                ? Container(
                    alignment: const Alignment(0, 0.80),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('signup');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green, // Background color
                      ),
                      child: const Text(
                        'Get Started',
                        style: TextStyle(fontSize: 14),
                      ).tr(),
                    ),
                  )
                : Container(
                    alignment: const Alignment(0, 0.80),
                    child: ElevatedButton(
                      onPressed: () {
                        _controller.nextPage(
                            duration: const Duration(microseconds: 500),
                            curve: Curves.easeIn);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green, // Background color
                      ),
                      child: const Text(
                        'NEXT',
                        style: TextStyle(fontSize: 14),
                      ).tr(),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
