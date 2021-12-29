import 'package:coachstation/Helper/components.dart';
import 'package:coachstation/Localization/app_localizations.dart';
import 'package:coachstation/provider/changeIndexPage.dart';
import 'package:coachstation/screens/MainScreens/NavigationHome.dart';
import 'package:coachstation/screens/SubScreens/ProgramDetailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'ReservationInSpecificNutritionalProgramScreen.dart';
import 'ShowWeeksProgressScreen.dart';
import 'WeekProgressForSpecificExercise.dart';

class ShowSpecificNutritionalProgramsScreen extends StatefulWidget {
  String titleOfExercise;

  ShowSpecificNutritionalProgramsScreen({this.titleOfExercise});

  @override
  _ShowSpecificNutritionalProgramsScreenState createState() =>
      _ShowSpecificNutritionalProgramsScreenState();
}

class _ShowSpecificNutritionalProgramsScreenState
    extends State<ShowSpecificNutritionalProgramsScreen> {
  Widget showExerciseDetails({String titleText, String subTitleText}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          titleText,
          style: TextStyle(
            fontFamily: 'CairoRegular',
            fontSize: 15,
            color: Colors.grey[800],
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          subTitleText,
          style: TextStyle(
            height: 1.2,
            fontFamily: 'CairoRegular',
            fontSize: 12,
            color: Colors.grey[800],
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget showWeeksProgress(
      {Size media,
      String titleText,
      String subTitleText,
      int index,
      Function onTap,
      bool isEnabled = true}) {
    String number;
    if (index != 0 || index >= 9) {
      if (index == 0) {
        index = index + 1;
      }
      number = index.toString().padLeft(2, '0');
    } else {
      number = index.toString();
    }
    return InkWell(
      onTap: onTap,
      child: Container(
        width: media.width,
        margin: const EdgeInsets.only(bottom: 10.0),
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 8.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border.all(color: isEnabled ? Colors.grey : Colors.grey[200]),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            )),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    number,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'CairoRegular',
                      fontSize: 16,
                      color: isEnabled ? Colors.grey[800] : Colors.grey[400],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 5.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    titleText,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'CairoRegular',
                      fontSize: 15,
                      color: isEnabled ? Colors.grey[800] : Colors.grey[400],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 2.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text(
                      subTitleText,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'CairoRegular',
                        fontSize: 11,
                        color: isEnabled ? Colors.grey[800] : Colors.grey[400],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 18.0,
              color: isEnabled ? Colors.grey[800] : Colors.grey[300],
            ),
          ],
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
        appBar: defaultAppBar(
          context: context,
          isTextNotKey: true,
          titleKey: widget.titleOfExercise,
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            imgList[0],
                            fit: BoxFit.fill,
                            height: media.height * 0.25,
                            width: media.width,
                          ),
                        ),
                        Container(
                          height: 50,
                          width: media.width * 0.8,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30.0),
                                  topLeft: Radius.circular(30.0))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              showExerciseDetails(
                                  titleText:
                                      '${AppLocalizations.of(context).trans('program_type')}',
                                  subTitleText: 'مكثف'),
                              showExerciseDetails(
                                  titleText:
                                      '${AppLocalizations.of(context).trans('duration')}',
                                  subTitleText: '4 اسابيع'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          navigateTo(
                              context,
                              ProgramDetailsScreen(
                                titleOfExercise:
                                    '${AppLocalizations.of(context).trans('program_details')}',
                              ));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            subtitleOfHomeScreen(
                                function: null,
                                isEnableSpaceBeforeArrow: true,
                                context: context,
                                textKey: 'program_details'),
                            SizedBox(
                              width: media.width * 0.78,
                              child: Text(
                                ' لقم تم توليد هذا النص من مولد النص العربى  لقم تم توليد هذا النص من مولد النص العربى  لقم تم توليد هذا النص من مولد النص العربى  لقم تم توليد هذا النص من مولد النص العربى',
                                maxLines: 4,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: 'CairoRegular',
                                  fontSize: 13,
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            LinearPercentIndicator(
                              trailing: AppLocalizations.of(context)
                                          .locale
                                          .languageCode ==
                                      'ar'
                                  ? defaultSubtitleTextTwo(
                                      context: context, text: '30.0%')
                                  : null,
                              leading: AppLocalizations.of(context)
                                          .locale
                                          .languageCode !=
                                      'ar'
                                  ? defaultSubtitleTextTwo(
                                      context: context, text: '30.0%')
                                  : null,
                              animation: true,
                              lineHeight: 10.0,
                              animationDuration: 2500,
                              percent: 0.3,
                              isRTL: AppLocalizations.of(context)
                                          .locale
                                          .languageCode ==
                                      'ar'
                                  ? true
                                  : false,
                              linearStrokeCap: LinearStrokeCap.roundAll,
                              progressColor: Colors.green,
                            )
                          ],
                        ),
                      ),
                    ),
                    ListView.builder(
                        itemBuilder: (context, index) => showWeeksProgress(
                              onTap: index == 0
                                  ? () {
                                      navigateTo(
                                          context, ShowWeeksProgressScreen());
                                    }
                                  : null,
                              isEnabled: index == 0 ? true : false,
                              index: index,
                              media: media,
                              titleText: 'الاسبوع الاول',
                              subTitleText:
                                  ' لقم تم توليد هذا النص من مولد النص العربى  لقم تم توليد هذا النص من مولد النص العربى  لقم تم توليد هذا النص من مولد النص العربى  لقم تم توليد هذا النص من مولد النص العربى',
                            ),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 12)
                  ],
                ),
              ),
            ),
            Container(
              width: media.width,
              height: 80,
              decoration: BoxDecoration(color: Colors.white70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  defaultButton(
                      function: () {
                        navigateTo(context,
                            ReservationInSpecificNutritionalProgramScreen());
                      },
                      text:
                          '${AppLocalizations.of(context).trans('subscribe_now')}',
                      radius: 20,
                      width: media.width * 0.6),
                ],
              ),
            ),
          ],
        ),
      bottomNavigationBar: Consumer<ChangeIndex>(
        builder: (context, changeIndex, child) =>
            bottomNavigationBar(
                context: context,
                onTap: (index) {
                  setState(() {
                    changeIndex.index = index;
                  });
                  Navigator.pushAndRemoveUntil(context, PageRouteBuilder(
                    pageBuilder:
                        (context, animation1, animation2) =>
                        NavigationHome(),
                    transitionDuration: Duration(seconds: 0),
                  ), (Route<dynamic> route) => false);
                },
                media: media,
                currentIndex: changeIndex.index
            ),
      ),

    );
  }
}
