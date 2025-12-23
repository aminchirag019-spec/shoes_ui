import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_1/router/router_class.dart';
import 'package:task_1/utilities/colors.dart';
import 'package:task_1/utilities/media_query.dart';

import '../../utilities/icons.dart';
import '../widgets/app_bar.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});
  @override
  State<DetailsScreen> createState() => _ShoeDetailNoSliversState();
}

class _ShoeDetailNoSliversState extends State<DetailsScreen> {
  final List<String> galleryOwners = [
    'assets/images/Imag.png',   // Owner0
    'assets/images/shoes_1.png', // Owner 1
    'assets/images/NikeAirJordan_Orange.png',  // Owner 2
  ];

// The specific lists owned by each gallery item
  final Map<int, List<String>> ownerLookbooks = {
    0: [
      'assets/images/Imag.png',
      'assets/images/shoes_1.png',
    ],
    1: [
      'assets/images/shoes_1.png',
      'assets/images/NikeAirJordan_Orange.png',
    ],
    2: [
      'assets/images/NikeAirJordan_Orange.png',
      'assets/images/shoes_1.png',
    ],
  };

  int activeOwnerIndex = 0;

  final sizes = [38, 39, 40, 41, 42, 43];

  Set<int> selectedThumb = {0};
  int selectedSize = 40;
  final PageController pageController = PageController(viewportFraction: 0.86);

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  void onOwnerChanged(int newIndex) {
    setState(() {
      activeOwnerIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A2530),
      bottomNavigationBar: _buildBottomBar(),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(onPressed:() {
                          context.go(RouterName.homeScreen.path);
                        },
                            icon:iconBox(GIcons.back,)
                        ),
                        Text(
                          "Men's Shoes",
                          style: GoogleFonts.poppins(
                            color: Colors.white70,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        IconButton(onPressed:() => context,
                            icon: Container(
                              height: 44,
                              width: 44,
                              decoration: BoxDecoration(
                                  color: AppColors.bg,
                                  borderRadius: BorderRadius.circular(30)
                              ),
                              child:ImageIcon(AssetImage("assets/images/Frame.png",),color: AppColors.white,),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    child: PageView.builder(
                      key: ValueKey(activeOwnerIndex),
                      controller: pageController,
                      itemCount: ownerLookbooks[activeOwnerIndex]?.length,
                      itemBuilder: (context, index) {
                        final images = ownerLookbooks[activeOwnerIndex]!;
                        return Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Image.asset(
                            images[index],
                            fit: BoxFit.contain,
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                  color: Colors.white10,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Text('BEST SELLER',
                                  style: GoogleFonts.poppins(
                                      color: Colors.white70, fontSize: 11)),
                            ),
                             Spacer(),
                            Text('\$967.800',
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                         SizedBox(height: 12),
                        Text('Nike Air Jordan',
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
                        SizedBox(
                          height: 68,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: galleryOwners.length,
                            separatorBuilder: (_, __) =>  SizedBox(width: 12),
                            itemBuilder: (context, i) {
                              // Highlight if this is the active owner
                              final isActive = activeOwnerIndex == i;

                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    activeOwnerIndex = i;
                                  });
                                  pageController.jumpToPage(0);
                                },
                                child: AnimatedContainer(
                                  duration:  Duration(milliseconds: 200),
                                  padding:  EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: isActive ?  Color(0xFF11343D) : Colors.transparent,
                                    borderRadius: BorderRadius.circular(12),
                                    border: isActive
                                        ? Border.all(color: AppColors.accent, width: 2)
                                        : Border.all(color: Colors.white10),
                                  ),
                                  child: Image.asset(galleryOwners[i], width: 56),
                                ),
                              );
                            },
                          ),
                        ),

                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Size',
                                style: GoogleFonts.poppins(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w600)),
                            Row(children: [
                              Text('EU',
                                  style: GoogleFonts.poppins(
                                      color: Colors.white54, fontSize: 12)),
                              const SizedBox(width: 8),
                              Text('US',
                                  style: GoogleFonts.poppins(
                                      color: Colors.white54, fontSize: 12)),
                              const SizedBox(width: 8),
                              Text('UK',
                                  style: GoogleFonts.poppins(
                                      color: Colors.white54, fontSize: 12)),
                            ])
                          ],
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                          spacing: 10,
                          children: sizes.map((s) {
                            final active = s == selectedSize;
                            return ChoiceChip(
                              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 15),
                              labelPadding: const EdgeInsets.symmetric(horizontal: 8),

                              label: Text('$s',
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      color: active ? Colors.white : Color(0xff707B81),
                                  )),
                              selected: active,
                              selectedColor: AppColors.accent,
                              backgroundColor:Color(0xff1A2530),
                              side: BorderSide.none,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              onSelected: (_) => setState(() => selectedSize = s),
                            );

                          }).toList(),
                        ),

                        const SizedBox(height: 18),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _featureBox(Icons.star, '4.8'),
                            _featureBox(
                                Icons.local_fire_department, 'Best Seller'),
                            _featureBox(Icons.check_circle, 'Authentic'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Optional faint dashed border effect overlay: (simple top-left rounded dotted-ish look)
            // (comment out if not needed)
            // Positioned(
            //   left: 8,
            //   right: 8,
            //   bottom: 120,
            //   child: IgnorePointer(
            //     child: Container(
            //       height: 2,
            //       decoration:
            //           BoxDecoration(border: Border.all(color: Colors.white10)),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    return BottomAppBar(
      color: const Color(0xFF07151A),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18.0,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Price',
                        style: GoogleFonts.poppins(color: Colors.white60)),
                    const SizedBox(height: 6),
                    Text('\$849.69',
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700)),
                  ]),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accent,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28))),
              child: Text('Add To Cart',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconBox(IconData icon) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          color:AppColors.bg,
          borderRadius: BorderRadius.circular(30)),
      child: Icon(icon, color: Colors.white70),
    );
  }

  Widget _featureBox(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
          color: const Color(0xFF071B20),
          borderRadius: BorderRadius.circular(12)),
      child: Row(children: [
        Icon(icon, color: Colors.white70, size: 18),
        const SizedBox(width: 8),
        Text(label, style: GoogleFonts.poppins(color: Colors.white70))
      ]),
    );
  }
}
