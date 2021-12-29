import 'package:coachstation/Helper/components.dart';
import 'package:coachstation/Localization/app_localizations.dart';
import 'package:coachstation/provider/changeIndexPage.dart';
import 'package:coachstation/screens/MainScreens/NavigationHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';

import 'ShowPresentDetailsScreen.dart';

class ShowPresentScreen extends StatefulWidget {
  @override
  _ShowPresentScreenState createState() => _ShowPresentScreenState();
}

class _ShowPresentScreenState extends State<ShowPresentScreen> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        titleKey: 'present',
      ),
      body: SizedBox(
        width: media.width,
        height: media.height,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView.builder(
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                navigateTo(context, ShowPresentDetailsScreen());
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(11.0)),
                      border: Border.all(color: Colors.grey[300])),
                  child: Row(
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              imgList[index],
                              fit: BoxFit.fill,
                              height: media.height * 0.18,
                              width: media.width * 0.38,
                            ),
                          ),
                          Container(
                            height: 35,
                            width: media.width * 0.38,
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(10.0),
                                    topLeft: Radius.circular(40.0))),
                            child: Center(
                              child: Text(
                                'Gold Gym',
                                style: TextStyle(
                                  fontFamily: 'CairoRegular',
                                  fontSize: 16,
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${AppLocalizations.of(context).trans('free_by_share')}',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          showTextWithIcon(
                              context: context,
                              iconUrl: 'images/calendar.png',
                              titleText: 'من 20 فبراير 2022'),
                          showTextWithIcon(
                              context: context,
                              iconUrl: 'images/calendar.png',
                              titleText: 'ينتهى فى 29 فبراير 2022'),
                          showTextWithIcon(
                              context: context,
                              iconUrl: 'images/locationMark.png',
                              titleText: 'جولدز جيم الرياض'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            itemCount: imgList.length,
          ),
        ),
      ),
      bottomNavigationBar: Consumer<ChangeIndex>(
        builder: (context, changeIndex, child) => bottomNavigationBar(
            context: context,
            onTap: (index) {
              setState(() {
                changeIndex.index = index;
              });
              Navigator.pushAndRemoveUntil(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) =>
                        NavigationHome(),
                    transitionDuration: Duration(seconds: 0),
                  ),
                  (Route<dynamic> route) => false);
            },
            media: media,
            currentIndex: changeIndex.index),
      ),
    );
  }
}
