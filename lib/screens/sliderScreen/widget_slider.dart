import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_1/router/router_class.dart';

int _currentIndex = 0;
final CarouselSliderController _controller = CarouselSliderController();
final List<Map<String, String>> sliderData = [
  {
    "image": "assets/images/shoes_1.png",
    "title": "Start Journey With Nike",
    "subtitle": "Smart, Gorgeous & Fashionable Collection"
  },
  {
    "image": "assets/images/shoes_2.png",
    "title": "Follow Latest Style Shoes",
    "subtitle": "There Are Many Beautiful And Attractive Plants To Your Room"
  },
  {
    "image": "assets/images/shoes_3.png",
    "title": "Summer Shoes Nike 2022",
    "subtitle": "Amet Minim Lit Nodeseru Saku Nandu sit Alique Dolor"
  },
];

Widget caraouselSlider(){
  return StatefulBuilder(builder: (context, setState) {
    return  CarouselSlider.builder(
      carouselController: _controller,
      itemCount: sliderData.length,
      options: CarouselOptions(
        height:500,
        enlargeCenterPage: true,
        viewportFraction: 1.0,
        onPageChanged: (index, reason) {
          setState(() => _currentIndex = index);
        },
      ),
      itemBuilder: (context, index, realIndex) {
        final item = sliderData[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal:15,vertical: 80),
          child: Column(
            children: [
              Container(
                child:Image.asset(
                  item["image"]!,
                  height:200,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 70,),
              Text(
                item["title"]!,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 44,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                item["subtitle"]!,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        );
      },
    );
  },);
}


Widget animatedButtons(){
  return StatefulBuilder(builder: (context, setState) {
    return  Row(
      children: sliderData.asMap().entries.map((entry) {
        bool isActive = _currentIndex == entry.key;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: isActive ? 35 : 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isActive
                ? const Color(0xFF00BFA6)
                : Colors.white24,
          ),
        );
      }).toList(),
    );

  },);
}

Widget button(){
  return StatefulBuilder(builder: (context, setState) {
    return ElevatedButton(
      onPressed: () {
        if (_currentIndex < sliderData.length - 1) {
          _controller.nextPage(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
          );
        } else {
          context.push(RouterName.loginScreen.path);
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: const EdgeInsets.symmetric(
            horizontal: 30, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        _currentIndex == sliderData.length - 1
            ? "Get Started"
            : "Next",
        style:
        const TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
  );
  }