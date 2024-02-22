import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/controller/onboarding_controller.dart';

class OnBoardingPage extends StatelessWidget {
  final mycontroller = OnBoardingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              PageView.builder(
                  controller: mycontroller.pageController,
                  onPageChanged: mycontroller.selectedPageIndex,
                  itemCount: mycontroller.onboardingPages.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(30),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                                mycontroller.onboardingPages[index].imageAsset),
                            Text(
                              mycontroller.onboardingPages[index].title,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 22),
                            Text(
                              mycontroller.onboardingPages[index].description,
                              style: const TextStyle(
                                  fontSize: 16,
                                  color:
                                      const Color.fromARGB(255, 128, 127, 127)),
                              textAlign: TextAlign.center,
                            ),
                          ]),
                    );
                  }),
              Positioned(
                bottom: 40,
                left: 40,
                child: Row(
                  children: List.generate(
                      mycontroller.onboardingPages.length,
                      (index) => Obx(() => Container(
                            margin: EdgeInsets.all(2),
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                                color: mycontroller.selectedPageIndex.value ==
                                        index
                                    ? Colors.black
                                    : Colors.grey,
                                shape: BoxShape.circle),
                          ))),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          onPressed: mycontroller.forwardAction,
          child: Obx(
            () => Text(mycontroller.isLastPage ? "Lets Go " : "Next"),
          ),
        ));
  }
}
