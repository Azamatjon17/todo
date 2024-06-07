import 'package:flutter/material.dart';
import 'package:todo/views/screens/home_page.dart';
import 'package:todo/views/screens/profile_page.dart';
import 'package:todo/views/screens/statistics_page.dart';
import 'package:todo/views/widgets/drawer/drawer_page.dart';

class ManagerPage extends StatefulWidget {
  const ManagerPage({super.key});

  @override
  State<ManagerPage> createState() => _ManagerPageState();
}

class _ManagerPageState extends State<ManagerPage> with TickerProviderStateMixin {
  List<Widget> pages = [const HomePage(), const StatisticsPage(), const ProfilePage()];
  int curentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerPage(),
      body: pages[curentIndex],
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height / 11,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: IconButton(
                style: IconButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                onPressed: () {
                  curentIndex = 0;
                  setState(() {});
                },
                icon: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home,
                      size: 25,
                      color: curentIndex == 0 ? Colors.deepPurpleAccent : Colors.grey,
                    ),
                    if (curentIndex == 0)
                      const Text(
                        "Home",
                        style: TextStyle(color: Colors.deepPurpleAccent),
                      )
                  ],
                ),
              ),
            ),
            Expanded(
              child: IconButton(
                style: IconButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                onPressed: () {
                  curentIndex = 1;
                  setState(() {});
                },
                icon: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.bar_chart_outlined,
                      size: 25,
                      color: curentIndex == 1 ? Colors.deepPurpleAccent : Colors.grey,
                    ),
                    if (curentIndex == 1)
                      const Text(
                        "Statistics",
                        style: TextStyle(color: Colors.deepPurpleAccent),
                      )
                  ],
                ),
              ),
            ),
            Expanded(
              child: IconButton(
                style: IconButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                onPressed: () {
                  curentIndex = 2;
                  setState(() {});
                },
                icon: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person,
                      size: 25,
                      color: curentIndex == 2 ? Colors.deepPurpleAccent : Colors.grey,
                    ),
                    if (curentIndex == 2)
                      const Text(
                        "Profile",
                        style: TextStyle(color: Colors.deepPurpleAccent),
                      )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
