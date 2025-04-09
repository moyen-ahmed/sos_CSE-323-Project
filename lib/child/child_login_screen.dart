import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart'; // For animations
import 'package:sos_app/child/Registerchild.dart';
import 'package:sos_app/home_screen.dart';
import 'package:sos_app/utils/color_const.dart';
import '../components/PrimaryButton.dart';
import '../components/SecondaryButton.dart';
import '../components/custom_textfield.dart';
import '../db/sharepreferench.dart';
import 'bottom_screens/homeSceendemo.dart';
import '../parents/parent_home_screen.dart';
import '../parents/parents_register_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordShown = true;
  final _formKey = GlobalKey<FormState>();
  final _formData = Map<String, Object>();
  bool isloading=false;


  _onSubmit() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    try {
      setState(() {
        isloading = true;
      });

      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: _formData['email'].toString(),
        password: _formData['password'].toString(),
      );

      if (userCredential.user != null) {
        setState(() {
          isloading = false;
        });
        FirebaseFirestore.instance.collection('users')
            .doc(userCredential.user!.uid)
            .get()
            .then((value) {
              if(value['type']=='parent'){
                print(value['type']);
                MySharedPrefference.saveUserType('parent');
                goTo(context, ParentHomeScreen());
              } else{
                MySharedPrefference.saveUserType('child');
                goTo(context, HomeScreen1());
              }
        });

      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        isloading = false;
      });

      String errorMessage;

      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'No user found with this email. Please register first.';
          break;
        case 'wrong-password':
          errorMessage = 'Incorrect password. Please try again.';
          break;
        case 'invalid-email':
          errorMessage = 'The email address is not valid.';
          break;
        case 'user-disabled':
          errorMessage = 'This user account has been disabled.';
          break;
        default:
          errorMessage = 'An error occurred. Please try again.';
          break;
      }

      // Show the error dialog
      alertbox(context, errorMessage);
      print('Login error: ${e.code}');
    } catch (e) {
      setState(() {
        isloading = false;
      });
      alertbox(context, 'An unexpected error occurred. Please try again.');
      print('Unexpected error: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFE4D25E),
              Color(0xFFFB8580),
              Color(0xFF5F8E85),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Stack(

            children: [
              isloading?
                  progressIndicator(context):
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 30),

                    // Title with animation
                    FadeInDown(
                      duration: Duration(milliseconds: 800),
                      child: Text(
                        "USER LOGIN",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    SizedBox(height: 10),

                    // Login Image with animation
                    FadeInUp(
                      duration: Duration(milliseconds: 1000),
                      child: Image.asset(
                        'assets/login.png',
                        height: 120,
                        width: 120,
                      ),
                    ),

                    SizedBox(height: 20),

                    // Form Fields
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            // Email Field with animation
                            FadeInLeft(
                              duration: Duration(milliseconds: 1000),
                              child: CustomTextfield(
                                hintText: 'Enter email',
                                textInputAction: TextInputAction.next,
                                keyboardtype: TextInputType.emailAddress,
                                prefix: Icon(Icons.email, color: Colors.white),
                                onsave: (email) {
                                  _formData['email'] = email ?? "";
                                },
                                validate: (email) {
                                  if (email!.isEmpty ||
                                      email.length < 3 ||
                                      !email.contains("@")) {
                                    return 'Enter a valid email';
                                  }
                                  return null;
                                },
                              ),
                            ),

                            SizedBox(height: 10),

                            // Password Field with animation
                            FadeInRight(
                              duration: Duration(milliseconds: 1000),
                              child: CustomTextfield(
                                hintText: 'Enter password',
                                isPassword: isPasswordShown,
                                prefix: Icon(Icons.vpn_key_rounded, color: Colors.white),
                                validate: (password) {
                                  if (password!.isEmpty || password.length < 4) {
                                    return 'Enter a valid password';
                                  }
                                  return null;
                                },
                                onsave: (password) {
                                  _formData['password'] = password ?? "";
                                },
                                suffix: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isPasswordShown = !isPasswordShown;
                                    });
                                  },
                                  icon: isPasswordShown
                                      ? Icon(Icons.visibility_off, color: Colors.white)
                                      : Icon(Icons.visibility, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    // Login Button with animation
                    FadeInUp(
                      duration: Duration(milliseconds: 1000),
                      child: PrimaryButton(
                        title: "Login",
                        onPressed: () {
                          //progressIndicator(context);
                          if (_formKey.currentState!.validate()) {
                            _onSubmit();
                          }
                        },
                      ),
                    ),

                    SizedBox(height: 10),

                    // Forgot Password
                    FadeInUp(
                      duration: Duration(milliseconds: 1200),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Forgot Password?",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          SecondaryButton(
                            title: " Click here!",
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),

                    // Register new user button
                    FadeInUp(
                      duration: Duration(milliseconds: 1400),
                      child: SecondaryButton(
                        title: "Register As a Child",
                        onPressed: () {
                       goTo(context, Registerchild());
                        },
                      ),
                    ),

                    SizedBox(height: 20),


                //take as parents
                    FadeInUp(
                      duration: Duration(milliseconds: 1400),
                      child: SecondaryButton(
                        title: "Register As a Parents",
                        onPressed: () {
                          goTo(context, parents_register_screen());
                        },
                      ),
                    ),

                    SizedBox(height: 20),


                    FadeInUp(
                      duration: Duration(milliseconds: 1400),
                      child: SecondaryButton(
                        title: "Go to Home Page",
                        onPressed: () {
                          goTo(context, HomeScreen1());
                        },
                      ),
                    ),

                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
