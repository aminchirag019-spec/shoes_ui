import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_1/screens/detailsScreen/widget_details.dart';
import 'package:task_1/utilities/colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController textController = TextEditingController();
  List<String> search = [];

  void addToRecent() {
    String text = textController.text;

    setState(() {
      search.remove(text);
      search.insert(0,text);
    });
    textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.chipBg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () {
                    context.push('/AccountSettingScreen');
                  },
                      icon: iconBox(Icons.arrow_back_ios),
                  ),
                    Text("Search",
                      style: TextStyle(color: Colors.white,
                          fontSize: 18)),
                  Text("Cancel",
                      style: TextStyle(color: AppColors.blue)),
                ],
              ),

              SizedBox(height: 25),
              TextFormField(
                controller: textController,
                style: TextStyle(color: Colors.white),
                onFieldSubmitted: (_) => addToRecent(),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: addToRecent,
                  ),
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search Your Shoes",
                  hintStyle: TextStyle(color: Colors.white54),
                  filled: true,
                  fillColor: Color(0xFF161F28),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              SizedBox(height: 20),
                Text("Recent Searches",
                    style: TextStyle(color: Colors.white, fontSize: 16)),

              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: search.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(Icons.history, color: Colors.white54),
                      title: Text(
                        search[index],
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
