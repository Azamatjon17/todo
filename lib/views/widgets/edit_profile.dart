import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo/controllers/user_controller.dart';
import 'package:todo/models/user.dart';

class EditProfile extends StatelessWidget {
  User? user;
  Function() setState;

  EditProfile({super.key, required this.user, required this.setState});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextFormField(
            decoration: const InputDecoration(border: OutlineInputBorder(), hintText: "name"),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Ism Kriting";
              } else {
                return null;
              }
            },
            onSaved: (value) {
              user!.name = value;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(border: OutlineInputBorder(), hintText: "surname"),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Familya Kriting";
              } else {
                return null;
              }
            },
            onSaved: (newValue) {
              user!.surname = newValue;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(border: OutlineInputBorder(), hintText: "phoneNumber"),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "ramingizni Kriting";
              } else {
                return null;
              }
            },
            onSaved: (newValue) {
              user!.phoneNumber = newValue;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(border: OutlineInputBorder(), hintText: "image uri"),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "rasm uri ni Kriting";
              } else {
                return null;
              }
            },
            onSaved: (newValue) {
              user!.imageUri = newValue;
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              const Gap(25),
              FilledButton(
                onPressed: () {
                  var usercontroler = UserController();
                  usercontroler.saveUser(user!);
                  setState;
                  Navigator.pop(context);
                },
                child: const Text("Save"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
