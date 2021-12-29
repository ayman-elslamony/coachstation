// ignore_for_file: file_names, unnecessary_this, unnecessary_string_interpolations, use_rethrow_when_possible, non_constant_identifier_names, unnecessary_brace_in_string_interps, prefer_typing_uninitialized_variables

//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:coachstation/Helper/components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:coachstation/Localization/app_localizations.dart';
import 'package:coachstation/provider/locale_provider.dart';

//import 'package:flutter_slidable/flutter_slidable.dart';
//import 'package:google_fonts/google_fonts.dart';
//import 'package:coachstation/Helper/Widgets.dart';
//import 'package:coachstation/main.dart';
//import 'dart:convert';
//import 'dart:developer';
//import 'dart:io';
//import 'package:country_code_picker/country_code_picker.dart';
//import 'package:coachstation/models/Country.dart';
//import 'package:coachstation/provider/BrandsProvider.dart';
//import 'package:coachstation/provider/UserProvider.dart';
//import 'package:coachstation/provider/changeIndexPage.dart';
//import 'package:coachstation/screens/MainScreens/NavigationHome.dart';
//import 'package:coachstation/screens/SubScreens/PaymentScreens.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:showcaseview/showcase_widget.dart';

class RegisterScreen extends StatefulWidget {
  static const String routName = '/Register_Screen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isSubmitting = false;
  bool _isChecked = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  bool _nameValidator = false;
  bool _phoneValidator = false;
  bool _emailValidator = false;
  bool _passwordValidator = false;

  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();


//  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  String fcmToken;

  @override
  void initState() {
    super.initState();

//    firebaseMessaging.getToken().then((token){
//      fcmToken = token;
//    });
  }

//  void _submit() async {
//    final form = _formKey.currentState;
//    if (form.validate()) {
//      form.save();    setState(() {
//      _isSubmitting = true;
//    });
//      Provider.of<UserDataProvider>(context, listen: false)
//          .register(
//          context: context,
//          locale: _locale,
//          name: _name,
//          phone: _phone,
//          email: _email,
//          fcmToken: fcmToken,
//          password: _password,
//          countryKey: _dialCode)
//          .then((val) => {
//        setState(() {
//          _isSubmitting = false;
//        })
//      });
//    // }
//    }
//  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Scaffold(
        key: _scaffoldKey,
       appBar: defaultAppBar(context: context, titleKey: 'regist'),
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                // height: media.height,
                width: media.width,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15)),
                    color: Color(0xFFFCFCFC)),
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 28.0, vertical: 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          '${AppLocalizations.of(context).trans('name')}',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        defaultFormField(
                          controller: nameController,
                          type: TextInputType.text,
                          validate: (val){
                            if(val == null || val.isEmpty){
                              setState(() {
                                _nameValidator =true;
                              });
                            }
                            else{
                              setState(() {
                                _nameValidator =false;
                              });
                            }
                            return null;
                          },
                          onTap: (){
                            setState(() {
                              _nameValidator =false;
                            });
                          },
                        ),
                        _nameValidator ? Align(
                          alignment: AppLocalizations.of(context).locale.languageCode == "en" ? Alignment.centerRight : Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Text('${AppLocalizations.of(context).trans('invalid_name')}',style: TextStyle(color: Colors.red,fontSize: 11),),
                          ),
                        )
                            :
                        const SizedBox(),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          '${AppLocalizations.of(context).trans('phone_num')}',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        defaultFormField(
                          controller: phoneController,
                          type: TextInputType.text,
                          validate: (val){
                            if(val == null || val.isEmpty){
                              setState(() {
                                _phoneValidator =true;
                              });
                            }
                            else{
                              setState(() {
                                _phoneValidator =false;
                              });
                            }
                            return null;
                          },
                          onTap: (){
                            setState(() {
                              _phoneValidator =false;
                            });
                          },
                        ),
                        _phoneValidator ? Align(
                          alignment: AppLocalizations.of(context).locale.languageCode == "en" ? Alignment.centerRight : Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Text('${AppLocalizations.of(context).trans('invalid_phone_num')}',style: TextStyle(color: Colors.red,fontSize: 11),),
                          ),
                        )
                            :
                        const SizedBox(),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          '${AppLocalizations.of(context).trans('email')}',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        defaultFormField(
                          controller: emailController,
                          type: TextInputType.text,
                          validate: (val){
                            if(val == null || val.isEmpty){
                              setState(() {
                                _emailValidator =true;
                              });
                            }
                            else{
                              setState(() {
                                _emailValidator =false;
                              });
                            }
                            return null;
                          },
                          onTap: (){
                            setState(() {
                              _emailValidator =false;
                            });
                          },
                        ),
                        _emailValidator ? Align(
                          alignment: AppLocalizations.of(context).locale.languageCode == "en" ? Alignment.centerRight : Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Text('${AppLocalizations.of(context).trans('invalid_email')}',style: TextStyle(color: Colors.red,fontSize: 11),),
                          ),
                        )
                            :
                        const SizedBox(),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          '${AppLocalizations.of(context).trans('password')}',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        defaultFormField(
                          controller: passwordController,
                          type: TextInputType.text,
                          validate: (val){
                            if(val == null || val.isEmpty){
                              setState(() {
                                _passwordValidator =true;
                              });
                            }
                            else{
                              setState(() {
                                _passwordValidator =false;
                              });
                            }
                            return null;
                          },
                          onTap: (){
                            setState(() {
                              _passwordValidator =false;
                            });
                          },
                        ),
                        _passwordValidator ? Align(
                          alignment: AppLocalizations.of(context).locale.languageCode == "en" ? Alignment.centerRight : Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Text('${AppLocalizations.of(context).trans('invalid_pass')}',style: TextStyle(color: Colors.red,fontSize: 11),),
                          ),
                        )
                            :
                        const SizedBox(),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Align(
                          alignment: AppLocalizations.of(context)
                                      .locale
                                      .languageCode ==
                                  "en"
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 0),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _isChecked = !_isChecked;
                                      });
                                    },
                                    child: Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                          color: _isChecked
                                              ? Theme.of(context).primaryColor
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                          border: Border.all(
                                              color: _isChecked
                                                  ? Theme.of(context)
                                                      .primaryColor
                                                  : Colors.grey[400])),
                                      child: _isChecked
                                          ? const Icon(
                                              Icons.check,
                                              color: Colors.white,
                                              size: 18,
                                            )
                                          : const SizedBox(),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: defaultSubtitleTextOne(context: context, text: '${AppLocalizations.of(context).trans('terms_agree')}')
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        _isSubmitting
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: SpinKitWave(
                                  color: Theme.of(context).primaryColor,
                                  size: 35,
                                ),
                              )
                            : defaultButton(
                                text:
                                    '${AppLocalizations.of(context).trans('register')}',
                                function: () {
                                  if (_formKey.currentState.validate()) {
                                    print(phoneController.text);
                                    print(passwordController.text);
                                  }
                                },
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
