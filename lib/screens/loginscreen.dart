import 'package:flutter/material.dart';
import 'package:instgram_clone/screens/home/homepage.dart';
import 'package:instgram_clone/screens/signup/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/login_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController useridController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  savedLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var username = prefs.getString('username');
    var accessToken = prefs.getString('accessToken');
    if (username != null && accessToken != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    savedLogin().then((value) {
      if (value == true) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) =>  HomePage(),
          ),
        );
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/instagram.png',
                  height: 80.0,
                ),
                const SizedBox(height: 100.0),
                TextFormField(
                  controller: useridController,
                  decoration: InputDecoration(
                    hintText: 'Username, email address or mobile number',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 168, 173, 177),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 168, 173, 177),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 168, 173, 177),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 168, 173, 177),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  width: double.infinity,
                  height: 48.0,
                  child: ElevatedButton(
                    onPressed: () async {             
                      // print(usernameController.text);
                      // print(passwordController.text);
                          var response = await login(
                              useridController.text, passwordController.text);

                          if (response.statusCode == 200) {
                            // ignore: use_build_context_synchronously
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>  HomePage(),
                              ),
                            );
                          } else {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "${response.body}",
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.black87,
                              ),
                            );
                          }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0064E0),
                      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: const Text('Log In'),
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Color.fromARGB(255, 31, 32, 36),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 100.0),
                SizedBox(
                  width: double.infinity,
                  height: 48.0,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const SignupPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      foregroundColor: const Color(0xFF0064E0),
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      side: const BorderSide(
                        color: Color(0xFF0064E0), // Set the border color here
                        width: 1.0, // Set the border width here
                      ),
                    ),
                    child: const Text('Create new account'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 20,
                      child: Image.asset('assets/images/meta.png'),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    const Text(
                      "Meta",
                      style: TextStyle(
                        fontSize: 18.0, // Set the desired text size here
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
