import 'package:carousel_slider/carousel_slider.dart';
import 'package:coachstation/Helper/components.dart';
import 'package:coachstation/Localization/app_localizations.dart';
import 'package:coachstation/provider/changeIndexPage.dart';
import 'package:coachstation/screens/MainScreens/NavigationHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';
import 'ReserveInTrainingProgramsScreen.dart';
import 'ShowWeeksProgressScreen.dart';

class ShowProgramsDetailsScreen extends StatefulWidget {
  @override
  _ShowProgramsDetailsScreenState createState() =>
      _ShowProgramsDetailsScreenState();
}

class _ShowProgramsDetailsScreenState extends State<ShowProgramsDetailsScreen> {
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

  Widget showTextIcon(
      {BuildContext context, String iconUrl, String titleText}) {
    return Row(
      children: [
        ImageIcon(
          AssetImage(iconUrl),
          size: 18,
          color: Colors.red,
        ),
        SizedBox(
          width: 5.0,
        ),
        Text(titleText,
            style:Theme.of(context).textTheme.headline2)
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
              color: isEnabled ? Colors.grey[800] : Colors.grey[400],
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
          titleKey: 'program_details',
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CarouselSlider(
                      items: imgList
                          .map((item) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    child: Image.network(item,
                                        fit: BoxFit.cover, width: 1000.0)),
                              ))
                          .toList(),
                      options: CarouselOptions(
                        height: media.height*0.24,
                        viewportFraction: 1.0,
                        enlargeCenterPage: false,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(seconds: 1),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        showTextIcon(
                            context: context,
                            iconUrl: 'images/calendar.png',
                            titleText: '10 أسابيع'),
                        SizedBox(
                          width: 40.0,
                        ),
                        showTextIcon(
                            context: context,
                            iconUrl: 'images/calendar.png',
                            titleText: '29 فبراير 2022'),
                      ],
                    ),
                    Divider(),
                    SizedBox(
                      width: media.width,
                      height: media.height * 0.17,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            showAvilableTimeInOneDay(context: context),
                        itemCount: 3,
                      ),
                    ),
                    Divider(),
                    showTextIcon(
                        context: context,
                        iconUrl: 'images/locationMark.png',
                        titleText: 'جولدز جيم الرياض'),
                    Divider(),
                    Row(
                      children: [
                        Text(
                          '${AppLocalizations.of(context).trans('program_details')}',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: media.width*0.9,
                      child: Text(
                        ' لقم تم توليد هذا النص من مولد النص العربى  لقم تم توليد هذا النص من مولد النص العربى  لقم تم توليد هذا النص من مولد النص العربى  لقم تم توليد هذا النص من مولد النص العربى',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: 'CairoRegular',
                          fontSize: 14,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
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
                            ReserveInTrainingProgramsScreen());
                      },
                      text:
                          '${AppLocalizations.of(context).trans('reserve_now')}',
                      radius: 20,
                      width: media.width * 0.6),
                ],
              ),
            ),
          ],
        ),
      bottomNavigationBar: Consumer<ChangeIndex>(
        builder: (context, changeIndex, child) =>bottomNavigationBar(
            context: context,
            onTap: (index){
              setState(() {
                changeIndex.index=index;
              });
              Navigator.pushAndRemoveUntil(context, PageRouteBuilder(
                pageBuilder:
                    (context, animation1, animation2) =>
                    NavigationHome(),
                transitionDuration: Duration(seconds: 0),
              ),(Route<dynamic> route) => false);
            },
            media: media,
            currentIndex: changeIndex.index
        ),
      ),);
  }
}
