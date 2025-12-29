import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_1/utilities/media_query.dart';
import '../../utilities/colors.dart';


final ValueNotifier<int> cartNotifier =ValueNotifier(0);
final List<Map<String, dynamic>> cart = [];

Widget summaryRow(String title, String value, {bool isBold = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
    child: Container(
      color: AppColors.bg,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white70,
              fontSize:20,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget optionShoes() {
  return StatefulBuilder(
    builder: (context, setState) {
      return Expanded(
        child: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            final items = cart[index];

            return Container(
              height: 100,
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              decoration: BoxDecoration(
                color:  Color(0xFF1A2530),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Container(
                    height: 84,
                    width: 84,
                    decoration: BoxDecoration(
                      color: AppColors.bg,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        items["image"],
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          items["name"],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                         SizedBox(height: 4),
                        Text(
                          items["price"],
                          style:  TextStyle(color: Colors.white70),
                        ),
                         SizedBox(height: 8),

                        Row(
                          children: [
                            _counterBtn(
                              icon: Icons.remove,
                              onTap: () {
                                if (items["count"] > 1 ) {
                                  setState(() {
                                    items["count"]--;
                                  });
                                  cartNotifier.value--;
                                }
                                else if (items["count"]<0) {
                                  setState((){
                                    cart.removeAt(index);
                                  });
                                  cartNotifier.value--;
                                }
                              },
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 12),
                              child: Text(
                                items["count"].toString(),
                                style:  TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                            _counterBtn(
                              icon: Icons.add,
                              onTap: () {
                                setState(() {
                                  items["count"]++;
                                });
                                cartNotifier.value++;
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding:  EdgeInsets.only(right: 9, bottom: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          items["size"],
                          style:  TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                    GestureDetector(
                      onTap: () {
                        showDeleteDialog(
                          context: context,
                          onDelete: () {
                            setState(() {
                              cart.removeAt(index);
                            });
                            cartNotifier.value++;
                          },
                        );
                      },
                      child: ImageIcon(
                        const AssetImage("assets/images/Icon.png"),
                        size: 22,
                        color: Colors.white70,
                      ),
                    )
                    ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}
void showDeleteDialog({
  required BuildContext context,
  required VoidCallback onDelete,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppColors.chipBg,
        title:  Text("Delete item",style: TextStyle(
            color: AppColors.white
        ),),
        content:  Text(
          "Are you sure you want to delete this item? This action cannot be undone.",style: TextStyle(
          color: AppColors.white
        ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child:  Text("Cancel",style: TextStyle(
                color: AppColors.white
            ),),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed: () {
              Navigator.pop(context);
              onDelete();
            },
            child:  Text("Delete",style: TextStyle(
                color: AppColors.white
            ),),
          ),
        ],
      );
    },
  );
}


Widget _counterBtn({
  required IconData icon,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 24,
      width: 24,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.bg,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 16, color: Colors.white),
    ),
  );
}

Widget bottomRows() {
  return ValueListenableBuilder(
    valueListenable: cartNotifier,
    builder: (context, value, child) {
      return StatefulBuilder(
        builder: (context, setState) {
          final subtotal = calculateSubtotal();
          final shipping = subtotal * 0.18;
          final total = subtotal + shipping;
      
          return Container(
            height: height(context)*0.35,
            decoration: BoxDecoration(
              color: AppColors.bg,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal:width(context)*0.03, vertical:height(context)*0.03),
              child: Column(
                children: [
                  summaryRow("Subtotal", "\₹${subtotal.toStringAsFixed(2)}"),
                  summaryRow("Shipping+GST", "\₹${shipping.toStringAsFixed(2)}"),
                  const Divider(color: Colors.white30, height: 30),
                  summaryRow(
                    "Total Cost",
                    "\₹${total.toStringAsFixed(2)}",
                    isBold: true,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: width(context)*1,
                    height: height(context)*0.07,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4A9DFB),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                      onPressed: subtotal == 0
                          ? null
                          : () {
                        context.push('/CheckoutScreen');
                      },
                      child: const Text(
                        "Checkout",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  );
}

double calculateSubtotal() {
  double total = 0;

  for (var item in cart) {
    final price =
    double.parse(item["price"].replaceAll("\₹", ""));
    total += price * item["count"];
  }

  return total;
}
