import 'package:flutter/material.dart';
import 'package:todo/utils/app_consts.dart';

class SettingsPage extends StatefulWidget {
  Function() setMain;
  SettingsPage({super.key, required this.setMain});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool themaMode = AppConsts.themeMode == ThemeMode.light ? false : true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SwitchListTile(
              title: const Text(
                "Dark mode",
                style: TextStyle(fontSize: 25),
              ),
              value: themaMode,
              onChanged: (value) {
                themaMode = value;
                AppConsts.themeMode = themaMode ? ThemeMode.dark : ThemeMode.light;
                widget.setMain();
              })
        ],
      ),
    );
  }
}