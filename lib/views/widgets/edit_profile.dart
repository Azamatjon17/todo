import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo/controllers/user_controller.dart';
import 'package:todo/models/user.dart';

class EditProfile extends StatefulWidget {
  final User user;
  final VoidCallback setState;
  final UserController userController;

  EditProfile({super.key, required this.user, required this.setState,required this.userController});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 10,
        top: 10,
        left: 10,
        right: 10,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextFormField(
                initialValue: widget.user.name,
                decoration: const InputDecoration(border: OutlineInputBorder(), hintText: "name"),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Ism Kriting";
                  }
                  return null;
                },
                onSaved: (value) {
                  widget.user.name = value!;
                },
              ),
              const Gap(10),
              TextFormField(
                initialValue: widget.user.surname,
                decoration: const InputDecoration(border: OutlineInputBorder(), hintText: "surname"),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Familya Kriting";
                  }
                  return null;
                },
                onSaved: (value) {
                  widget.user.surname = value!;
                },
              ),
              const Gap(10),
              TextFormField(
                initialValue: widget.user.phoneNumber,
                decoration: const InputDecoration(border: OutlineInputBorder(), hintText: "phoneNumber"),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "ramingizni Kriting";
                  }
                  return null;
                },
                onSaved: (value) {
                  widget.user.phoneNumber = value!;
                },
              ),
              const Gap(10),
              TextFormField(
                initialValue: widget.user.imageUri,
                decoration: const InputDecoration(border: OutlineInputBorder(), hintText: "image uri"),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "rasm uri ni Kriting";
                  }
                  return null;
                },
                onSaved: (value) {
                  widget.user.imageUri = value!;
                },
              ),
              const Gap(20),
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
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        await widget.userController.saveUser(widget.user);
                        widget.setState();
                        Navigator.pop(context);
                      }
                    },
                    child: const Text("Save"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
