import 'package:coachstation/Helper/components.dart';
import 'package:coachstation/Localization/app_localizations.dart';
import 'package:coachstation/screens/SubScreens/EditProfileScreen.dart';
import 'package:flutter/material.dart';

import 'ChangePasswordScreen.dart';

class PersonalPageScreen extends StatefulWidget {
  @override
  _PersonalPageScreenState createState() => _PersonalPageScreenState();
}

class _PersonalPageScreenState extends State<PersonalPageScreen> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
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
              '${AppLocalizations.of(context).trans('personal_page')}',
            ),
          ),
          SliverToBoxAdapter(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 18.0,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  'images/userProfile.png',
                  fit: BoxFit.fill,
                  height: 250,
                  width: 300,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                'عادل أحمد',
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 300,
                height: 60.0,
                child: MaterialButton(
                  onPressed: () {
                    navigateTo(context, EditProfileScreen());
                  },
                  child: Text(
                    '${AppLocalizations.of(context).trans('edit')}',
                    style: TextStyle(
                      fontFamily: 'CairoRegular',
                      color: Colors.black,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      18.0,
                    ),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey[500])),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: 300,
                height: 60.0,
                child: MaterialButton(
                  onPressed: () {
                    navigateTo(context, ChangePasswordScreen());
                  },
                  child: Text(
                    '${AppLocalizations.of(context).trans('change_pass')}',
                    style: TextStyle(
                      fontFamily: 'CairoRegular',
                      color: Colors.black,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      18.0,
                    ),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey[500])),
              ),
              SizedBox(
                height: 65,
              )
            ],
          )),
        ],
      ),
    );
  }
}
