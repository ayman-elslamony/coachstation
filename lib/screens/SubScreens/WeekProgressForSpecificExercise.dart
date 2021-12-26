import 'package:coachstation/Helper/components.dart';
import 'package:coachstation/Localization/app_localizations.dart';
import 'package:coachstation/provider/changeIndexPage.dart';
import 'package:coachstation/screens/SubScreens/SpecificExerciseInDay.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ShowSpecificVirtualExerciseDetails.dart';

class WeekProgressForSpecificExercise extends StatefulWidget {
  String title;

  WeekProgressForSpecificExercise({this.title});

  @override
  _WeekProgressForSpecificExerciseState createState() =>
      _WeekProgressForSpecificExerciseState();
}

class _WeekProgressForSpecificExerciseState
    extends State<WeekProgressForSpecificExercise> {
  Widget showExerciseDetails({String titleText, String subTitleText}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleText,
          style: TextStyle(
            fontFamily: 'CairoRegular',
            fontSize: 20,
            color: Colors.grey[500],
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          subTitleText,
          style: TextStyle(
            height: 1.5,
            fontFamily: 'CairoRegular',
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        titleKey: widget.title,
        isTextNotKey: true
      ),
      body: SizedBox(
        width: media.width,
        height: media.height,
        child: ListView.builder(
          itemBuilder: (context, index) => InkWell(
            onTap: index %3==1?null:() {
              navigateTo(context,SpecificExerciseInDay(
                title: 'الأسبوع الأول - اليوم الأول',
              ));
            },
            child: Container(
              width: media.width * 0.95,
              margin: const EdgeInsets.only(
                  bottom: 12.0, left: 10.0, right: 10.0),
              padding: const EdgeInsets.symmetric(
                  horizontal: 10.0, vertical: 8.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  )),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 7.0, vertical: 8.0),
                child: index % 3 == 1
                    ? Row(
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12, vertical: 23.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(12.0)),
                            color: Theme.of(context).primaryColor),
                        child: Center(
                          child: Text(
                            'الإثنين',
                            style: Theme.of(context)
                                .textTheme
                                .headline3,
                          ),
                        )),
                    SizedBox(
                      width: 27.0,
                    ),
                    showExerciseDetails(
                        titleText: 'راحة',
                        subTitleText: 'يوم راحة لاستعادة العضلات')
                  ],
                )
                    : Row(
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12, vertical: 23.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(12.0)),
                            color: Theme.of(context).primaryColor),
                        child: Center(
                          child: Text(
                            'الإثنين',
                            style: Theme.of(context)
                                .textTheme
                                .headline3,
                          ),
                        )),
                    SizedBox(
                      width: 27.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            '${AppLocalizations.of(context).trans('number_of_exercises')}',
                            style: Theme.of(context)
                                .textTheme
                                .headline3),
                        SizedBox(
                          height: 5.0,
                        ),
                        defaultSubtitleTextTwo(
                            context: context,
                            text:
                            '${AppLocalizations.of(context).trans('maximum')}'),
                        defaultSubtitleTextTwo(
                            context: context,
                            text:
                            '${AppLocalizations.of(context).trans('minimum')}'),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment:
                        CrossAxisAlignment.center,
                        children: [
                          Text('10',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3),
                          SizedBox(
                            height: 5.0,
                          ),
                          defaultSubtitleTextTwo(
                              context: context, text: '7'),
                          defaultSubtitleTextTwo(
                              context: context, text: '5'),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 18.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
          itemCount: 8,
        ),
      ),
    );
  }
}
