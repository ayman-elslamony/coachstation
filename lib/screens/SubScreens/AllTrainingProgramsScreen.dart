import 'package:coachstation/Helper/components.dart';
import 'package:coachstation/Localization/app_localizations.dart';
import 'package:coachstation/provider/changeIndexPage.dart';
import 'package:coachstation/screens/MainScreens/NavigationHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';
import 'FilterAllTrainingProgramsScreen.dart';
import 'ShowProgramsDetailsScreen.dart';

class AllTrainingProgramsScreen extends StatefulWidget {
  @override
  _AllTrainingProgramsScreenState createState() =>
      _AllTrainingProgramsScreenState();
}

class _AllTrainingProgramsScreenState extends State<AllTrainingProgramsScreen> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return DefaultTabController(
      initialIndex: 1,
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const ImageIcon(
                AssetImage(
                  'images/arrowLeft.png',
                ),
                size: 16,
              )),
          actions: [
            IconButton(
                onPressed: () {
                  navigateTo(context, FilterAllTrainingProgramsScreen());
                },
                icon: Image.asset("images/filter.png",color: Colors.white,height: 30)),
            IconButton(onPressed: () {}, icon: Image.asset("images/search.png",height: 20,)),

          ],
          title: Text(
            '${AppLocalizations.of(context).trans('training_programs')}',
          ),
          titleSpacing: 2.0,
          bottom: TabBar(
            isScrollable: true,
            labelColor: Theme.of(context).primaryColor,
            indicatorColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(
                text: '${AppLocalizations.of(context).trans('all')}',
              ),
              Tab(
                text: '${AppLocalizations.of(context).trans('jim')}',
              ),
              Tab(
                text: '${AppLocalizations.of(context).trans('yoga')}',
              ),
              Tab(
                text: '${AppLocalizations.of(context).trans('swimming')}',
              ),
              Tab(
                text: '${AppLocalizations.of(context).trans('fitness')}',
              ),
            ],
          ),
        ),
        body: SizedBox(
          width: media.width,
          height: media.height,
          child: Padding(
            padding: const EdgeInsets.only(
                left: 10.0, right: 10.0, bottom: 5.0, top: 16.0),
            child: TabBarView(
              children: [
                SizedBox(),
                ListView.builder(
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      navigateTo(context, ShowProgramsDetailsScreen());
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(11.0)),
                                border: Border.all(color: Colors.grey[300])),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'برنامج تدريبى للياقة البدنية العامة',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                SizedBox(
                                  height: 6.0,
                                ),
                                Row(
                                  children: [
                                    showTextWithIcon(
                                        context: context,
                                        iconUrl: 'images/clock.png',
                                        titleText: '10 أسابيع'),
                                    SizedBox(
                                      width: 40.0,
                                    ),
                                    showTextWithIcon(
                                        context: context,
                                        iconUrl: 'images/calendar.png',
                                        titleText: '29 فبراير 2022'),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                showTextWithIcon(
                                    context: context,
                                    iconUrl: 'images/locationMark.png',
                                    titleText: 'جولدز جيم الرياض'),
                              ],
                            ),
                          ),
                          Container(
                            height: 40,
                            width: media.width * 0.31,
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(38.0),
                                    bottomLeft: Radius.circular(11.0))),
                            child: Center(
                              child: Text('250 ر.س',
                                  style: Theme.of(context).textTheme.bodyText1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  itemCount: 5,
                ),
                SizedBox(),
                SizedBox(),
                SizedBox(),
              ],
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
      ),
    );
  }
}
