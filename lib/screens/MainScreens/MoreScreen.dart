import 'package:coachstation/Helper/components.dart';
import 'package:coachstation/Localization/app_localizations.dart';
import 'package:coachstation/provider/changeIndexPage.dart';
import 'package:coachstation/screens/SubScreens/ChangeLanguageScreen.dart';
import 'package:coachstation/screens/SubScreens/PersonalPageScreen.dart';
import 'package:coachstation/screens/SubScreens/VirtualExercise.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';

class MoreScreen extends StatefulWidget {
  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  Widget showMoreInfoCard(
      {BuildContext context, String title, String imgUrl, Function onTap}) {


    return InkWell(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.all(Radius.circular(25.0))),
          child:     ListTile(
              leading: ImageIcon(
                AssetImage(
                  imgUrl,
                ),
                color: Theme.of(context).primaryColor,
              ),
              title: defaultSubtitleTextOne(
                context: context,
                text: title,
              ))),
    );
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            leading: Consumer<ChangeIndex>(
              builder: (context, changeIndex, child) => IconButton(
                  onPressed: () {
                    changeIndex.changeIndexFunction(0);
                  },
                  icon: const ImageIcon(
                    AssetImage(
                      'images/arrowLeft.png',
                    ),
                    size: 23,
                  )),
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
                  height: 200,
                  width: 200,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                'عادل أحمد',
                style: Theme.of(context).textTheme.headline4,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      navigateTo(context, PersonalPageScreen());
                    },
                    child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 8.0),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 0.0),
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0))),
                        child: ListTile(
                            leading: CircleAvatar(
                              radius: 15,
                              child: ClipOval(
                                child: Image.asset(
                                  'images/userProfile.png',
                                  fit: BoxFit.cover,
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                            ),
                            title: defaultSubtitleTextOne(
                              context: context,
                              text:
                                  '${AppLocalizations.of(context).trans('personal_page')}',
                            ))),
                  ),
                  showMoreInfoCard(
                      context: context,
                      imgUrl: 'images/userProfile.png',
                      title:
                          '${AppLocalizations.of(context).trans('trainer')}'),
                  showMoreInfoCard(
                    onTap: (){
                      navigateTo(context, VirtualExercise());
                    },
                      context: context,
                      imgUrl: 'images/userProfile.png',
                      title:
                          '${AppLocalizations.of(context).trans('virtual_exercise')}'),
                  showMoreInfoCard(
                      context: context,
                      imgUrl: 'images/homeBottomSilver.png',
                      title:
                          '${AppLocalizations.of(context).trans('home_workout')}'),
                  showMoreInfoCard(
                      context: context,
                      imgUrl: 'images/userProfile.png',
                      title:
                          '${AppLocalizations.of(context).trans('nutritional_programs')}'),
                  showMoreInfoCard(
                      context: context,
                      imgUrl: 'images/fileSilver.png',
                      title:
                          '${AppLocalizations.of(context).trans('my_program')}'),
                  showMoreInfoCard(
                      context: context,
                      imgUrl: 'images/userProfile.png',
                      title:
                          '${AppLocalizations.of(context).trans('favourite')}'),
                  showMoreInfoCard(
                      context: context,
                      imgUrl: 'images/contact.png',
                      title:
                          '${AppLocalizations.of(context).trans('call_us')}'),
                  showMoreInfoCard(
                    onTap: (){
                      navigateTo(context, ChangeLanguageScreen());
                    },
                      context: context,
                      imgUrl: 'images/language.png',
                      title:
                          '${AppLocalizations.of(context).trans('language')}'),
                  showMoreInfoCard(
                      context: context,
                      imgUrl: 'images/userProfile.png',
                      title: '${AppLocalizations.of(context).trans('logout')}'),
                ],
              ),
              //TODO: remember fix
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
