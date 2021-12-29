import 'package:coachstation/Helper/components.dart';
import 'package:coachstation/Localization/app_localizations.dart';
import 'package:coachstation/provider/changeIndexPage.dart';
import 'package:coachstation/screens/MainScreens/NavigationHome.dart';
import 'package:coachstation/screens/SubScreens/ShowHowDoExercise.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ShowSpecificVirtualExerciseDetails.dart';

class SpecificExerciseInDay extends StatefulWidget {
  String title;

  SpecificExerciseInDay({this.title});

  @override
  _SpecificExerciseInDayState createState() => _SpecificExerciseInDayState();
}

class _SpecificExerciseInDayState extends State<SpecificExerciseInDay> {
  Widget showExerciseDetails({String text}) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: TextStyle(
        fontFamily: 'CairoRegular',
        fontSize: 14,
        height: 1.5,
        color: Colors.grey[800],
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: defaultAppBar(
          context: context, titleKey: widget.title, isTextNotKey: true),
      body: SizedBox(
        width: media.width,
        height: media.height,
        child: ListView.builder(
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              navigateTo(
                  context,
                  ShowHowDoExercise(
                    title: 'Bench Press',
                  ));
            },
            child: Container(
              width: media.width * 0.95,
              margin:
                  const EdgeInsets.only(bottom: 12.0, left: 10.0, right: 10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey[300]),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  )),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 8.0, top: 8.0, left: 8.0, right: 8.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            imgList[0],
                            fit: BoxFit.fill,
                            height: 95,
                            width: 110,
                          ),
                        ),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Front Pullups',
                                  style: Theme.of(context).textTheme.headline4),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      showExerciseDetails(
                                          text:
                                              '${AppLocalizations.of(context).trans('groups')}'),
                                      showExerciseDetails(
                                          text:
                                              '${AppLocalizations.of(context).trans('counters')}'),
                                      showExerciseDetails(
                                          text:
                                              '${AppLocalizations.of(context).trans('comfort')}'),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 25.0,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        showExerciseDetails(text: '3'),
                                        showExerciseDetails(text: '8-10-12'),
                                        showExerciseDetails(text: '30 sec'),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey[300],
                          size: 18.0,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey[300],
                    height: 2.3,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.verified_rounded,
                          color: Colors.green,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text('تم عمل التمرين',
                            style: Theme.of(context)
                                .textTheme
                                .headline3
                                .copyWith(color: Colors.green)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          itemCount: 8,
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
