import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/views/screens/home_page.dart';

class ManagerPage extends StatefulWidget {
  const ManagerPage({super.key});

  @override
  State<ManagerPage> createState() => _ManagerPageState();
}

class _ManagerPageState extends State<ManagerPage> with TickerProviderStateMixin {
  List<Widget> pages = [HomePage()];
  int curentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: pages[curentIndex],
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height / 13,
        decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)), color: Colors.white),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.home,
                    size: 30,
                    color: curentIndex == 0 ? Colors.deepPurpleAccent : Colors.grey,
                  ),
                  Text(
                    "Home",
                    style: TextStyle(
                      color: curentIndex == 0 ? Colors.deepPurpleAccent : Colors.grey,
                    ),
                  )
                ],
              ),
            ),
            TextButton.icon(
              onPressed: () {},
              label: curentIndex == 1 ? const Text("Statistics") : const Text(""),
              icon: Icon(Icons.bar_chart_rounded),
            ),
            TextButton.icon(
              onPressed: () {},
              label: curentIndex == 2 ? Text("Profile") : Text(""),
              icon: Icon(Icons.person),
            )
          ],
        ),
      ),
    );
  }
}
