import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_1/router/router_class.dart';
import 'package:task_1/screens/detailsScreen/widget_details.dart';
import 'package:task_1/utilities/colors.dart';

import '../widgets/app_bar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController textController = TextEditingController();
  List<String> search = [];
  final FocusNode _focusNode =FocusNode();

  void addToRecent() {
    String text = textController.text;

    setState(() {
      search.remove(text);
      search.insert(0,text);
    });
    textController.clear();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      _focusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.chipBg,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 12,vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () {
                    context.push(RouterName.homeScreen.path);
                  },
                      icon: iconBox(Icons.arrow_back_ios),
                  ),
                    Text("Search",
                      style: TextStyle(color: Colors.white,
                          fontSize: 18)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GestureDetector(
                      onTap: () {
                        context.go(RouterName.homeScreen.path);
                      },
                      child: Text("Cancel",
                          style: TextStyle(color: AppColors.blue)),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 25),
              TextFormField(
                focusNode: _focusNode,
                controller: textController,
                style: TextStyle(color: Colors.white),
                onFieldSubmitted: (_) => addToRecent(),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon:Icon(Icons.transit_enterexit),
                    onPressed: addToRecent,
                  ),
                  prefixIcon: IconButton(onPressed:() => context.pop(),
                      icon: ImageIcon(AssetImage("assets/images/search.png"))),
                  hintText: "Search Your Shoes",
                  hintStyle: TextStyle(color: Colors.white10),
                  filled: true,
                  fillColor: AppColors.bg,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              if (search.isNotEmpty) ...[
                const SizedBox(height: 20),
                const Text(
                  "Recent Searches",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: search.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const Icon(Icons.history, color: Colors.white54),
                        title: Text(
                          search[index],
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
