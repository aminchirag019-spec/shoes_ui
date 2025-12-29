import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_1/router/router_class.dart';
import 'package:task_1/screens/detailsScreen/widget_details.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.shoe});
 final Map<String,String> shoe;
  @override
  State<DetailsScreen> createState() => _ShoeDetailNoSliversState();
}

class _ShoeDetailNoSliversState extends State<DetailsScreen> {



  void onOwnerChanged(int newIndex) {
    setState(() {
      activeOwnerIndex = newIndex;
    });
  }
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        context.go(RouterName.homeScreen.path);
        return false;
      },
      child: Scaffold(
        backgroundColor: Color(0xFF1A2530),
        bottomNavigationBar: buildBottomBar(context),
        body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 10),
                      child:upperRow(context),
                    ),
                    mainShoes(shoe:widget.shoe),
                    Container(
                      padding:  EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xff161F28),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding:  EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                    color: Colors.white10,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Text('BEST SELLER',
                                    style: GoogleFonts.poppins(
                                        color: Colors.white70, fontSize: 11)),
                              ),
                               Spacer(),
                              Text(widget.shoe["price"]!,
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700)),
                            ],
                          ),
                           SizedBox(height: 12),
                          Text(widget.shoe["name"]!,
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700)),
                           SizedBox(height: 8),
                          Text(
                            'Air Jordan is an American brand of basketball shoes athletic, casual, and style clothing produced by Nike....',
                            style: GoogleFonts.poppins(
                                color: Colors.white60, height: 1.4),
                          ),
                           SizedBox(height: 16),

                          Text('Gallery',
                              style: GoogleFonts.poppins(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w600)),
                           SizedBox(height: 8),
                         gallery((){
                           setState(() {
                           });
                         }),
                           SizedBox(height: 16),
                          sizeRow(),
                           SizedBox(height: 10),
                         choiceChip(),
                           SizedBox(height: 18),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              featureBox(Icons.star, '4.8'),
                              featureBox(
                                  Icons.local_fire_department, 'Best Seller'),
                              featureBox(Icons.check_circle, 'Authentic'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }





}
