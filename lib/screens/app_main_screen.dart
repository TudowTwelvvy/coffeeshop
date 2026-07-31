import 'package:coffeeshop/colors.dart';
import 'package:coffeeshop/core/icon_model.dart';
import 'package:flutter/material.dart';

class AppMainScreen extends StatefulWidget {
  const AppMainScreen({Key? key}) : super(key: key);

  @override
  _AppMainScreenState createState() => _AppMainScreenState();
}

class _AppMainScreenState extends State<AppMainScreen> {
  int indexMenu = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: menu[indexMenu]['destination'] as Widget,
      backgroundColor: xbgColor,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: List.generate(menu.length, (index) {
            Map items = menu[index];
            bool isActive = indexMenu == index;
            return Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    indexMenu = index;
                  });
                },
                child: SizedBox(
                  height: 70,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 20),
                      Icon(
                        items['icon'],
                        color: isActive ? xprimaryColor : xsecColor,
                        size: 25,
                      ),
                      if (isActive) const SizedBox(height: 7),
                      if (isActive)
                        Container(
                          height: 5,
                          width: 15,
                          decoration: BoxDecoration(
                            color: xprimaryColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
