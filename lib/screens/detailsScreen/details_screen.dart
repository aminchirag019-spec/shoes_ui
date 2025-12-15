import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_1/utilities/colors.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});
  @override
  State<DetailsScreen> createState() => _ShoeDetailNoSliversState();
}

class _ShoeDetailNoSliversState extends State<DetailsScreen> {
  final thumbs = [
    'assets/images/shoes_4.png',
    'assets/images/shoes_4.png',
    'assets/images/shoes_4.png',
  ];
  final sizes = [38, 39, 40, 41, 42, 43];

  int selectedThumb = 0;
  int selectedSize = 40;
  final PageController pageController = PageController(viewportFraction: 0.86);

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF1A2530),
      bottomNavigationBar: _buildBottomBar(),
      body: SafeArea(
        child: Stack(
          children: [
            // Main scrollable content
            SingleChildScrollView(
              child: Column(
                children: [
                  // Top app row
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _iconBox(Icons.arrow_back),
                        Text("Men's Shoes",
                            style: GoogleFonts.poppins(
                                color: Colors.white70,
                                fontSize: 16,
                                fontWeight: FontWeight.w600)),
                        _iconBox(Icons.shopping_bag_outlined),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: height * 0.3,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        PageView.builder(
                          controller: pageController,
                          itemCount: thumbs.length,
                          onPageChanged: (p) =>
                              setState(() => selectedThumb = p),
                          itemBuilder: (context, index) {
                            final scale = index == selectedThumb ? 1.0 : 0.9;
                            return AnimatedScale(
                              duration: const Duration(milliseconds: 220),
                              scale: scale,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: Image.asset(thumbs[index],
                                    width: 280, fit: BoxFit.contain),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.bg,
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
                            const Spacer(),
                            Text('\$967.800',
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text('Nike Air Jordan',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700)),
                        const SizedBox(height: 8),
                        Text(
                          'Air Jordan is an American brand of basketball shoes athletic, casual, and style clothing produced by Nike....',
                          style: GoogleFonts.poppins(
                              color: Colors.white60, height: 1.4),
                        ),
                        const SizedBox(height: 16),

                        Text('Gallery',
                            style: GoogleFonts.poppins(
                                color: Colors.white70,
                                fontWeight: FontWeight.w600)),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 68,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: thumbs.length,
                            separatorBuilder: (_, __) =>
                                const SizedBox(width: 12),
                            itemBuilder: (context, i) {
                              final isActive = i == selectedThumb;
                              return GestureDetector(
                                onTap: () {
                                  pageController.animateToPage(i,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeOut);
                                  setState(() => selectedThumb = i);
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: isActive
                                        ? const Color(0xFF11343D)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(12),
                                    border: isActive
                                        ? Border.all(
                                            color: AppColors.accent, width: 2)
                                        : Border.all(color: Colors.white10),
                                  ),
                                  child: Image.asset(thumbs[i], width: 56),
                                ),
                              );
                            },
                          ),
                        ),

                        const SizedBox(height: 16),
                        // Size row
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

                        // Size selection (ChoiceChip) -- simple and accessible
                        Wrap(
                          spacing: 10,
                          children: sizes.map((s) {
                            final active = s == selectedSize;
                            return ChoiceChip(
                              label: Text('$s',
                                  style: GoogleFonts.poppins(
                                      color: active
                                          ? Colors.white
                                          : Colors.blue,
                                      fontWeight: FontWeight.w600)),
                              selected: active,
                              selectedColor: AppColors.accent,
                               backgroundColor:AppColors.bg,
                              shape: RoundedRectangleBorder(
                                  borderRadius:BorderRadiusGeometry.circular(50)),
                              disabledColor: Colors.transparent,
                              onSelected: (_) =>
                                  setState(() => selectedSize = s),
                            );
                          }).toList(),
                        ),

                        const SizedBox(height: 18),

                        // small features row to mimic original look
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
      width: 44,
      height: 44,
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
