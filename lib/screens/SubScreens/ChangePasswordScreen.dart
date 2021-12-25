import 'package:coachstation/Helper/components.dart';
import 'package:coachstation/Localization/app_localizations.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  var passwordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var confirmNewPasswordController = TextEditingController();
  var _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const ImageIcon(
                  AssetImage(
                    'images/arrowLeft.png',
                  ),
                  size: 23,
                )),
            title: Text(
              '${AppLocalizations.of(context).trans('change_pass')}',
            ),
          ),
          SliverToBoxAdapter(
              child: Column(
            children: [
              SizedBox(height: 20.0,),
              Image.asset(
                'images/password.png',
                color: Theme.of(context).primaryColor,
                fit: BoxFit.fill,
                height: 120,
                width: 110,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 12.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        '${AppLocalizations.of(context).trans('old_pass')}',
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
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        '${AppLocalizations.of(context).trans('new_pass')}',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      defaultFormField(
                        controller: passwordController,
                        type: TextInputType.text,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return '${AppLocalizations.of(context).trans('enter_new_pass')}';
                          }

                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        '${AppLocalizations.of(context).trans('confirm_new_pass')}',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      defaultFormField(
                        controller: passwordController,
                        type: TextInputType.text,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return '${AppLocalizations.of(context).trans('enter_new_pass')}';
                          }

                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              defaultButton(
                  function: () {},
                  text: '${AppLocalizations.of(context).trans('change')}',
                  width: media.width * 0.7),
            ],
          )),
        ],
      ),
    );
  }
}
