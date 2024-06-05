import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/controllers/user_controller.dart';
import 'package:todo/views/widgets/edit_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserController userController = UserController();

  @override
  Widget build(BuildContext context) {
    userController.getUser();
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          AppBar(
            title: const Text("Profile Page"),
            backgroundColor: Colors.grey.shade200,
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => EditProfile(
                              user: userController.user,
                              setState: () {
                                setState(() {});
                              },
                            ));
                  },
                  icon: const Icon(Icons.edit))
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    backgroundImage: NetworkImage(
                      userController.user.imageUri ?? "https://static.vecteezy.com/system/resources/thumbnails/019/900/306/small/happy-young-cute-illustration-face-profile-png.png",
                    ),
                    radius: 50,
                  ),
                ),
                Text(
                  "Name :   ${userController.user.name ?? "Hali ism Joylanmagan "}",
                  style: const TextStyle(fontSize: 15),
                ),
                Text(
                  "Surname :   ${userController.user.surname ?? "Hali familya Joylanmagan "}",
                  style: const TextStyle(fontSize: 15),
                ),
                Text(
                  "Number :   ${userController.user.phoneNumber ?? "Hali raqam Joylanmagan "}",
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
          Expanded(child: Container())
        ],
      ),
    );
  }
}
