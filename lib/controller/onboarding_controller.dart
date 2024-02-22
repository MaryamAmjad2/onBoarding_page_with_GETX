import 'package:flutter/material.dart';
import 'package:getx_app/model/onboarding_info.dart';
import 'package:get/state_manager.dart';

class OnBoardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  var pageController = PageController();

  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  forwardAction() {
    if (isLastPage) {
      //goto HomeScreen
    } else {
      pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  List<OnBoardingInfo> onboardingPages = [
    OnBoardingInfo('assets/img1.PNG', "Welcome to Surf ",
        "I provide essential stuff for your ui desogn for you every Tuesday"),
    OnBoardingInfo('assets/img2.PNG', "Design Template Upload Every Tuesday! ",
        "Make sure to  take a look at my profile every tuesday. "),
    OnBoardingInfo('assets/img4.PNG', "Download now",
        "You can follow me if you want some freebies")
  ];
}
