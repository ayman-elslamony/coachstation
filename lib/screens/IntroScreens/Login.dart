// ignore_for_file: file_names, unnecessary_this, unnecessary_string_interpolations, use_rethrow_when_possible, non_constant_identifier_names, unnecessary_brace_in_string_interps, sized_box_for_whitespace, prefer_typing_uninitialized_variables

import 'dart:convert';

//import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:coachstation/Helper/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:coachstation/Localization/app_localizations.dart';
import 'package:coachstation/provider/locale_provider.dart';
import 'package:coachstation/screens/IntroScreens/Register.dart';
import 'package:provider/provider.dart';

//import 'package:coachstation/screens/SubScreens/ForgetPassWord.dart';
//import 'package:coachstation/provider/UserProvider.dart';
//import 'package:coachstation/screens/MainScreens/NavigationHome.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:coachstation/Helper/Widgets.dart';

//class Login extends StatefulWidget {
//  static const String routName = '/Login_Screen';
//
//  @override
//  _LoginState createState() => _LoginState();
//}
//
//class _LoginState extends State<Login> {
//
//
//
//
//  bool _isSubmitting = false;
//  final _scaffoldKey = GlobalKey<ScaffoldState>();
//  final _formKey = GlobalKey<FormState>();
////  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
//  String fcmToken;
//  var _locale;
//  final TextEditingController controller = TextEditingController();
//  String _password = '', _email = '';
//
//
//  @override
//  void initState() {
//    super.initState();
//    _locale = Provider.of<LocaleProvider>(context, listen: false).locale.languageCode;
////    firebaseMessaging.getToken().then((token){
////      print('fcm1 $token');
////      fcmToken = token;
////    });
//  }
//
//
//  @override
//  void dispose() {
//    // TODO: implement dispose
//    super.dispose();
//  }
//
////  void _submit() async {
////    setState(() {
////      _isSubmitting = true;
////    });
////    if (_password.isEmpty ||
////        _password == null ||
////        _email.isEmpty ||
////        _email == null) {
////      setState(() {
////        _isSubmitting = false;
////      });
////      showSnack(
////          context: context,
////          msg: '${AppLocalizations.of(context).trans('checkData')}',
////          fullHeight: 30.0,
////          isFloating: true,
////          scaffoldKey: _scaffoldKey);
////    } else {
////      Provider.of<UserDataProvider>(context, listen: false)
////          .login(
////        context: context,
////        locale: _locale,
////        email: _email,
////        password: _password,
////        fcmToken: fcmToken
////      )
////          .then((val) => {
////        setState(() {
////          _isSubmitting = false;
////        })
////      });
////    }
////  }
//
//  @override
//  Widget build(BuildContext context) {
//    final media = MediaQuery.of(context).size;
//
//    return Container(
//      color: Colors.white,
//      width: media.width,
//      height: media.height,
//      child: Stack(children: <Widget>[
//        Scaffold(
//            key: _scaffoldKey,
//            body: CustomScrollView(
//              physics: const BouncingScrollPhysics(),
//              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
//              slivers: [
//                SliverToBoxAdapter(
//                  child: Form(
//                    child: Column(
//                      key: _formKey,
//                      children: [
//                        SizedBox(
//                          height: media.height * 0.15,
//                        ),
//                        Container(
//                            width: 200,
//                            height: 200,
//                            child: Image.asset('images/appIcon2.png')),
//                        SizedBox(
//                          height: media.height * 0.05,
//                        ),
//
//                        Padding(
//                          padding: const EdgeInsets.symmetric(
//                              horizontal: 20, vertical: 0),
//                          child: Padding(
//                            padding: const EdgeInsets.symmetric(
//                                horizontal: 5, vertical: 0),
//                            child: TextFormField(
//                              validator: (val) {
//                                if (val.isEmpty || val == null) {
//                                  // controllers[0].shakeErrorText();
//                                }
//                                return null;
//                              },
//                              obscureText: false,
//                              keyboardType: TextInputType.emailAddress,
//                              cursorColor: Theme.of(context).primaryColor,
//                              style: TextStyle(
//                                  color: Colors.grey[800],
//                                  height: 2,
//                                  fontSize: 14),
//                              decoration: InputDecoration(
//                                enabledBorder: UnderlineInputBorder(
//                                  borderSide: BorderSide(color: Colors.grey[300]),
//                                ),
//                                contentPadding:
//                                const EdgeInsets.symmetric(horizontal: 10),
//                                hintText:
//                                '${AppLocalizations.of(context).trans('email')}',
//                                hintStyle: TextStyle(
//                                    color: Theme.of(context).primaryColor,
//                                    height: 2,
//                                    fontSize: 14,
//                                  fontWeight: FontWeight.w400
//                                ),
//                              ),
//                              onSaved: (String value) {
//                                _email = value;
//                              },
//                              onChanged: (String value) {
//                                _email = value;
//                              },
//                            ),
//                          ),
//                        ),
//
//                        Padding(
//                          padding: const EdgeInsets.symmetric(
//                              horizontal: 20, vertical: 0),
//                          child: Padding(
//                            padding: const EdgeInsets.symmetric(
//                                horizontal: 5, vertical: 0),
//                            child: TextFormField(
//                              validator: (val) {
//                                if (val.isEmpty || val == null) {
//                                  // controllers[0].shakeErrorText();
//                                }
//                                return null;
//                              },
//                              obscureText: true,
//                              keyboardType: TextInputType.emailAddress,
//                              cursorColor: Theme.of(context).primaryColor,
//                              style: TextStyle(
//                                  color: Colors.grey[800],
//                                  height: 2,
//                                  fontSize: 14,
//                              ),
//                              decoration: InputDecoration(
//                                enabledBorder: UnderlineInputBorder(
//                                  borderSide: BorderSide(
//                                    color: Colors.grey[300],
//                                  ),
//                                ),
//                                contentPadding:
//                                const EdgeInsets.symmetric(horizontal: 10),
//                                hintText:
//                                '${AppLocalizations.of(context).trans('password')}',
//                                hintStyle: TextStyle(
//                                    color: Theme.of(context).primaryColor,
//                                    height: 2,
//                                    fontSize: 14,
//                                  fontWeight: FontWeight.w400
//                                ),
//                              ),
//                              onSaved: (String value) {
//                                _password = value;
//                              },
//                              onChanged: (String value) {
//                                _password = value;
//                              },
//                            ),
//                          ),
//                        ),
//
//                        Padding(
//                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
//                          child: Align(
//                            alignment: AppLocalizations.of(context)
//                                .locale
//                                .languageCode ==
//                                'ar'
//                                ? Alignment.centerLeft
//                                : Alignment.centerRight,
//                            child: InkWell(
//                              onTap: () {
//                               // Navigator.pushNamed(context, ForgetPassword.routName);
//                              },
//                              splashColor: Colors.transparent,
//                              highlightColor:Colors.transparent,
//                              child: Text(
//                                '${AppLocalizations.of(context).trans('did_forget_pass')}',
//                                style: TextStyle(
//                                    color: Theme.of(context).primaryColor,
//                                    fontWeight: FontWeight.w600,
//                                  fontSize: 12
//                                ),
//                              ),
//                            ),
//                          ),
//                        ),
//                        const SizedBox(
//                          height: 40,
//                        ),
//                        _isSubmitting
//                            ? Padding(
//                          padding:
//                          const EdgeInsets.symmetric(horizontal: 20),
//                          child: SpinKitWave(
//                            color: Theme.of(context).primaryColor,
//                            size: 35,
//                          ),
//                        )
//                            : InkWell(
//                          onTap: () {
//                           // _submit();
//                            // Navigator.pushNamed(
//                            //     context, NavigationHome.routName);
//                          },
//                          child: Padding(
//                            padding: const EdgeInsets.symmetric(
//                                horizontal: 20),
//                            child: Container(
//                              decoration: BoxDecoration(
//                                color: Theme.of(context).primaryColor,
//                              ),
//                              height: 45,
//                              alignment: Alignment.center,
//                              child: Text(
//                                '${AppLocalizations.of(context).trans('login')}',
//                                style: const TextStyle(
//                                    fontWeight: FontWeight.bold,
//                                    color: Colors.white,
//                                    height: 1.0),
//                              ),
//                            ),
//                          ),
//                        ),
//
//
//                        SizedBox(
//                          height: media.height * 0.12,
//                        ),
//                        Row(
//                          mainAxisAlignment: MainAxisAlignment.center,
//                          crossAxisAlignment: CrossAxisAlignment.end,
//                          children: [
//                            Text(
//                              '${AppLocalizations.of(context).trans('have_no_acc_register')}',
//                              style: TextStyle(
//                                  fontFamily: 'DIN',
//                                  color: Colors.grey[900],
//                                  fontWeight: FontWeight.bold),
//                            ),
//                            InkWell(
//                                splashColor: Colors.transparent,
//                                highlightColor:Colors.transparent,
//                                onTap: () {
//                                  Navigator.pushNamed(context, Register.routName);
//                                },
//                                child: Text(
//                                  '${AppLocalizations.of(context).trans('register')}',
//                                  style: TextStyle(
//                                    fontFamily: 'Net',
//                                      height: 0.7,
//                                      fontSize: 15,
//                                      color: Theme.of(context).primaryColor,
//                                      fontWeight: FontWeight.bold),
//                                )),
//                          ],
//                        )
//
//
//                        // Text(
//                        //   '${AppLocalizations.of(context).trans('login_by_social')}',
//                        //   style: TextStyle(
//                        //       color: Colors.grey[700],
//                        //       fontWeight: FontWeight.bold),
//                        // ),
//                        // const SizedBox(
//                        //   height: 20,
//                        // ),
//                        // Row(
//                        //   mainAxisAlignment: MainAxisAlignment.center,
//                        //   children: [
//                        //     InkWell(
//                        //       onTap: () {},
//                        //       child: Image.asset(
//                        //         'images/google.png',
//                        //         height: 60,
//                        //         width: 60,
//                        //       ),
//                        //     ),
//                        //     const SizedBox(
//                        //       width: 20,
//                        //     ),
//                        //     InkWell(
//                        //       onTap: () {},
//                        //       child: Image.asset(
//                        //         'images/facebook.png',
//                        //         height: 60,
//                        //         width: 60,
//                        //       ),
//                        //     ),
//                        //   ],
//                        // ),
//                        // Row(
//                        //   mainAxisAlignment: MainAxisAlignment.center,
//                        //   children: [
//                        //     Container(
//                        //       width: media.width / 4,
//                        //       height: 1,
//                        //       color: Colors.grey,
//                        //     ),
//                        //     Padding(
//                        //       padding:
//                        //           const EdgeInsets.symmetric(horizontal: 10),
//                        //       child: Text(
//                        //         '${AppLocalizations.of(context).trans('or')}',
//                        //         style: TextStyle(
//                        //             color: Colors.grey[800],
//                        //             fontWeight: FontWeight.bold),
//                        //       ),
//                        //     ),
//                        //     Container(
//                        //       width: media.width / 4,
//                        //       height: 1,
//                        //       color: Colors.grey,
//                        //     ),
//                        //   ],
//                        // ),
//                        // const SizedBox(
//                        //   height: 20,
//                        // ),
//                        // InkWell(
//                        //   onTap: () {},
//                        //   child: Padding(
//                        //     padding: EdgeInsets.symmetric(horizontal: 20),
//                        //     child: Container(
//                        //       decoration: BoxDecoration(
//                        //           color: Theme.of(context).primaryColor,
//                        //           borderRadius: BorderRadius.circular(8)),
//                        //       height: 45,
//                        //       alignment: Alignment.center,
//                        //       child: Row(
//                        //         mainAxisAlignment: MainAxisAlignment.center,
//                        //         children: [
//                        //           Text(
//                        //             '${AppLocalizations.of(context).trans('login_with_bio')}',
//                        //             style: TextStyle(
//                        //                 fontWeight: FontWeight.bold,
//                        //                 color: Colors.white,
//                        //                 height: 1.0),
//                        //           ),
//                        //           Image.asset(
//                        //             'images/finger.png',
//                        //             height: 40,
//                        //             width: 40,
//                        //             color: Colors.white,
//                        //           )
//                        //         ],
//                        //       ),
//                        //     ),
//                        //   ),
//                        // ),
//                        // const SizedBox(
//                        //   height: 20,
//                        // ),
//
//                        // const SizedBox(
//                        //   height: 20,
//                        // ),
//                        // Platform.isIOS
//                        //     ? Text(
//                        //         '${AppLocalizations.of(context).trans('continueAsAGuest')}',
//                        //         style: TextStyle(
//                        //             color: Colors.grey[700],
//                        //             fontWeight: FontWeight.bold),
//                        //       )
//                        //     : const SizedBox(),
//                      ],
//                    ),
//                  ),
//                )
//              ],
//            ))
//      ]),
//    );
//  }
//}
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Scaffold(
        key: _scaffoldKey,
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0,vertical: 20.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: media.height * 0.05,
                          ),
                          Center(
                            child: Container(
                                width: 200,
                                height: 200,
                                child: Image.asset(
                                    'images/coachStationBlackIcon.png')),
                          ),
                          SizedBox(
                            height: media.height * 0.05,
                          ),
                          Text(
                            '${AppLocalizations.of(context).trans('phone_num')}',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          defaultFormField(
                            controller: phoneController,
                            type: TextInputType.text,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return '${AppLocalizations.of(context).trans('invalid_phone_num')}';
                              }

                              return null;
                            },
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            '${AppLocalizations.of(context).trans('password')}',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          defaultFormField(
                            controller: passwordController,
                            type: TextInputType.text,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return '${AppLocalizations.of(context).trans('invalid_pass')}';
                              }

                              return null;
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                child: defaultSubtitleTextTwo(
                                    context: context,
                                    text: '${AppLocalizations.of(context).trans('forgot_pass')}',
                                    textColor: Color(0xFFcc775a)),
                                onTap: () {},
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          defaultButton(
                            text:
                                '${AppLocalizations.of(context).trans('login')}',
                            function: () {
                              if (formKey.currentState.validate()) {
                                print(phoneController.text);
                                print(passwordController.text);
                              }
                            },
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              defaultSubtitleTextOne(
                                  context: context,
                                  text: '${AppLocalizations.of(context).trans('have_no_acc_register')}'),
                              defaultTextButton(
                                  function: () {},
                                  context: context,
                                  textKey: 'register'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
