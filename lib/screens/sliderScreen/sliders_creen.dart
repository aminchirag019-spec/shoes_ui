import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_1/router/router_class.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreen();
}

class _SliderScreen extends State<SliderScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  final List<Map<String, String>> sliderData = [
    {
      "image": "assets/images/Imag.png",
      "title": "Start Journey\nWith Nike",
      "subtitle": "Smart, Gorgeous & Fashionable\nCollection"
    },
    {
      "image": "assets/images/shoes_2.png",
      "title": "Follow Latest\nStyle Shoes",
      "subtitle": "Many Beautiful And Attractive\nPlants For Your Room"
    },
    {
      "image": "assets/images/shoes_3.png",
      "title": "Summer Shoes\nNike 2022",
      "subtitle": "Amet Minim Lit Nodeseru Saku\nNandu sit Alique Dolor"
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF14222E),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: sliderData.length,
                onPageChanged: (index) {
                  setState(() => _currentIndex = index);
                },
                itemBuilder: (context, index) {
                  final item = sliderData[index];
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(flex: 5),
                        Center(
                          child: Image.asset(
                            item["image"]!,
                            height: screenHeight * 0.32,
                            fit: BoxFit.contain,
                          ),
                        ),
                         Spacer(flex: 1),
                        Text(
                          item["title"]!,
                          style:  TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.w600,
                            height: 1.3,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          item["subtitle"]!,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            height: 1.4,
                          ),
                        ),
                        // Space for the bottom sheet area
                        const SizedBox(height: 120),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: const Color(0xFF14222E),
        padding: const EdgeInsets.fromLTRB(25, 0, 25, 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: List.generate(sliderData.length, (index) {
                bool isActive = _currentIndex == index;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: isActive ? 30 : 7,
                  height: 5,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: isActive ? Colors.blue : Colors.white30,
                  ),
                );
              }),
            ),

            // Navigation Button
            ElevatedButton(
              onPressed: () {
                if (_currentIndex < sliderData.length - 1) {
                  // Use PageController to animate to next page
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  context.go(RouterName.loginScreen.path);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5DA7DB),
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
                elevation: 0,
              ),
              child: Text(
                _currentIndex == sliderData.length - 1 ? "Get Started" : "Next",
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
