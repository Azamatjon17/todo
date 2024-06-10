import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo/services/check_user_serves.dart';
import 'package:todo/views/screens/login_vs_register/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isLodaing = false;
  CheckUserServes checkUserServes = CheckUserServes();
  final formkey = GlobalKey<FormState>();
  bool isPasswordVisablety = true;
  String logindata = "";
  String passworddata = "";
  String passworddata2 = "";
  String invalidPassword = "";

  saveRegister() async {
    setState(() {
      isLodaing = true;
    });
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      if (passworddata == passworddata2) {
        await checkUserServes.register(logindata, passworddata, "signUp");
        Navigator.pushReplacement(
            // ignore: use_build_context_synchronously
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ));
      } else {
        invalidPassword = "Ikkinchi parol mos kelmadi";
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade300,
              Colors.blue.shade800,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  invalidPassword,
                  style: const TextStyle(fontSize: 15, color: Colors.red),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'email',
                    labelStyle: const TextStyle(color: Colors.white),
                    prefixIcon: const Icon(Icons.person, color: Colors.white),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white, width: 1.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    helperText: "Namuna: exemple@gmail.com",
                    helperStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "xato email kiritildi";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    logindata = value!;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  obscureText: isPasswordVisablety,
                  decoration: InputDecoration(
                    labelText: 'Parol',
                    labelStyle: const TextStyle(color: Colors.white),
                    suffixIcon: IconButton(
                      onPressed: () {
                        isPasswordVisablety = !isPasswordVisablety;
                        setState(() {});
                      },
                      icon: Icon(
                        isPasswordVisablety ? CupertinoIcons.eye_slash : CupertinoIcons.eye_fill,
                        color: Colors.white,
                      ),
                    ),
                    prefixIcon: const Icon(Icons.lock, color: Colors.white),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white, width: 1.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    helperText: "Namuna: password",
                    helperStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "xato parol kiritildi";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    passworddata = value!;
                  },
                ),
                const Gap(10),
                TextFormField(
                  obscureText: isPasswordVisablety,
                  decoration: InputDecoration(
                    labelText: 'Parol tasdiqlash',
                    labelStyle: const TextStyle(color: Colors.white),
                    prefixIcon: const Icon(Icons.lock, color: Colors.white),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white, width: 1.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    helperText: "Namuna: password confirm",
                    helperStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "xato parol kiritildi";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    passworddata2 = value!;
                  },
                ),
                const Gap(5),
                InkWell(
                  onTap: saveRegister,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.blue),
                    child: isLodaing
                        ? const CircularProgressIndicator()
                        : const Text(
                            "Create acount",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
