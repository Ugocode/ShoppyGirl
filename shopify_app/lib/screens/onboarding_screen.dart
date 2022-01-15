import 'package:flutter/material.dart';

import 'package:flutter_onboard/flutter_onboard.dart';

import 'home_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();

  final List<OnBoardModel> onBoardData = [
    const OnBoardModel(
      title: "Set your own goals and get better",
      description:
          "Goal support your motivation and inspire you to work harder",
      imgUrl: "assets/images/weight.png",
    ),
    const OnBoardModel(
      title: "Track your progress with statistics",
      description:
          "Analyse personal result with detailed chart and numerical values",
      imgUrl: 'assets/images/graph.png',
    ),
    const OnBoardModel(
      title: "Create photo comparisons and share your results",
      description:
          "Take before and after photos to visualize progress and get the shape that you dream about",
      imgUrl: 'assets/images/phone.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: OnBoard(
        // duration: const Duration(seconds: 2),
        pageController: _pageController,
        // Either Provide onSkip Callback or skipButton Widget to handle skip state
        onSkip: () {
          // print('skipped');
        },
        // Either Provide onDone Callback or nextButton Widget to handle done state

        onDone: () {
          //_goHome();
        },
        onBoardData: onBoardData,

        titleStyles: const TextStyle(
          color: Colors.pink,
          fontSize: 18,
          fontWeight: FontWeight.w900,
          letterSpacing: 0.15,
        ),
        descriptionStyles: TextStyle(
          fontSize: 16,
          color: Colors.brown.shade300,
        ),
        pageIndicatorStyle: const PageIndicatorStyle(
          width: 100,
          inactiveColor: Colors.deepOrangeAccent,
          activeColor: Colors.pink,
          inactiveSize: Size(8, 8),
          activeSize: Size(12, 12),
        ),
        // Either Provide onSkip Callback or skipButton Widget to handle skip state
        skipButton: TextButton(
          onPressed: () {
            // print('skipButton pressed');
            _goHome();
          },
          child: const Text(
            "Skip",
            style: TextStyle(color: Colors.pinkAccent),
          ),
        ),
        // Either Provide onDone Callback or nextButton Widget to handle done state
        nextButton: OnBoardConsumer(
          builder: (context, ref, child) {
            final state = ref.watch(onBoardStateProvider);
            return InkWell(
              onTap: () => _onNextTap(state),
              child: Container(
                width: 230,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                    colors: [Colors.pink, Colors.pinkAccent],
                  ),
                ),
                child: Text(
                  state.isLastPage ? "Done" : "Next",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _onNextTap(OnBoardState onBoardState) {
    if (!onBoardState.isLastPage) {
      _pageController.animateToPage(
        onBoardState.page + 1,
        duration: const Duration(microseconds: 250),
        curve: Curves.easeInOutSine,
      );
    } else {
      // print("endButton pressed");
      _goHome();
    }
  }

  void _goHome() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => HomeScreen()));
  }
}
