import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:vikn_codes_machin_test/helper/rount_helper.dart';
import 'package:vikn_codes_machin_test/src/controlls/authcontroller.dart';

import 'package:vikn_codes_machin_test/util/style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Center(
          child: GetBuilder<AuthController>(builder: (authController) {
            return Container(
              width: context.width > 700 ? 700 : context.width,
              height: context.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    //  Color(0xFF000000),
                    Color(0xFF00D0FD),
                    //     Color(0xFF080808),
                    // Color(0xFF0A9EF3),
                    // Color(0xFF0E74F4),
                    // Color(0xFF7D7D7D),
                    // Color(0xFF828282),
                    // Color(0xFFE6E6E6),
                    // Color(0xFFEEF223),
                    // Color(0xFFFC6BFF),
                    Color(0xFFFFFFFF),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[300]!, blurRadius: 5, spreadRadius: 1)
                ],
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 15.w),
                              child: Row(
                                children: [
                                  SizedBox(
                                      height: 30,
                                      child: Image.asset(
                                        'assets/images/language-hiragana.png',
                                        fit: BoxFit.cover,
                                      )),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    'English',
                                    style: poppinsRegular,
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Container(
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Login',
                                  style: poppinsMedium.copyWith(fontSize: 21),
                                ),
                                Text(
                                  'Login to your vikn account',
                                  style: poppinsRegular.copyWith(
                                      color: Color(0xff838383)),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Container(
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      TextField(
                                        controller: userName,
                                        decoration: InputDecoration(
                                            border: const OutlineInputBorder(
                                                borderSide: BorderSide.none),
                                            prefixIcon: Image.asset(
                                                'assets/images/user-2.png'),
                                            label: Text(
                                              'Username',
                                              style: poppinsRegular,
                                            ),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                                    borderSide:
                                                        BorderSide.none),
                                            fillColor:
                                                Theme.of(context).cardColor,
                                            filled: true),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      TextField(
                                        obscureText: !authController.toglepas,
                                        controller: password,
                                        decoration: InputDecoration(
                                            prefixIcon: Image.asset(
                                                'assets/images/key-round.png'),
                                            label: Text(
                                              'Password',
                                              style: poppinsRegular,
                                            ),
                                            border: const OutlineInputBorder(
                                                borderSide: BorderSide.none),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                                    borderSide:
                                                        BorderSide.none),
                                            fillColor:
                                                Theme.of(context).cardColor,
                                            filled: true,
                                            suffixIcon: IconButton(
                                                onPressed: () {
                                                  authController.showpassword();
                                                },
                                                icon: Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Icon(
                                                    authController.toglepas
                                                        ? Icons.visibility
                                                        : Icons.visibility_off,
                                                    color: Colors.blue,
                                                  ),
                                                ))),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Forgotten Password?',
                                      style: poppinsRegular,
                                    )),
                                SizedBox(
                                  height: 20.h,
                                ),
                                authController.isLoading
                                    ? const Center(
                                        child: CircularProgressIndicator(
                                        strokeWidth: 1,
                                      ))
                                    : ElevatedButton(
                                        style: ButtonStyle(
                                            fixedSize:
                                                MaterialStateProperty.all(
                                                    Size.fromHeight(50.0)),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Color(0xFF0E75F4))),
                                        onPressed: () {
                                          if (userName.text.isEmpty) {
                                            Fluttertoast.showToast(
                                                msg:
                                                    "Please Enter Username Number",
                                                backgroundColor: Colors.red);
                                          } else {
                                            if (password.text.isEmpty) {
                                              Fluttertoast.showToast(
                                                  msg:
                                                      "Please Enter Password Number",
                                                  backgroundColor: Colors.red);
                                            } else {
                                              authController
                                                  .login(
                                                      userName.text.toString(),
                                                      password.text.toString())
                                                  .then((value) {
                                                Fluttertoast.showToast(
                                                    msg: value.message!,
                                                    backgroundColor:
                                                        value.isSuccess
                                                            ? Colors.green
                                                            : Colors.red);


                                                            if (value.isSuccess) {
                                                              Get.offAllNamed(RoutHelper.home);
                                                              
                                                            }
                                              });
                                            }
                                          }
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'Sign In',
                                              style: poppinsRegular.copyWith(
                                                  color: Theme.of(context)
                                                      .cardColor),
                                            ),
                                            SizedBox(
                                              width: 6.w,
                                            ),
                                            Icon(
                                              CupertinoIcons.arrow_right,
                                              color:
                                                  Theme.of(context).cardColor,
                                            )
                                          ],
                                        ))
                              ],
                            ),
                          ),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Don’t have an Account?',
                                style: poppinsRegular,
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Sign up now!',
                                    style: poppinsRegular,
                                  ))
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
