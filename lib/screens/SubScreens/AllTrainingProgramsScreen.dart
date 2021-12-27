import 'package:coachstation/Helper/components.dart';
import 'package:coachstation/Localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'FilterAllTrainingProgramsScreen.dart';
import 'ShowProgramsDetailsScreen.dart';

class AllTrainingProgramsScreen extends StatefulWidget {
  @override
  _AllTrainingProgramsScreenState createState() => _AllTrainingProgramsScreenState();
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
                  size: 18,
                )),
            actions: [
              IconButton(
                  onPressed: () {
                    navigateTo(context, FilterAllTrainingProgramsScreen());
                  }, icon: Icon(Icons.edgesensor_high_outlined)),
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            ],
            title: Text(
              '${AppLocalizations.of(context).trans('training_programs')}',
            ),
            titleSpacing: 2.0,
            bottom: TabBar(
              isScrollable: true,
              labelColor: Theme.of(context).primaryColor,
              labelStyle: Theme.of(context).textTheme.headline3,
              indicatorColor: Theme.of(context).primaryColor,
              unselectedLabelColor: Colors.grey,
              unselectedLabelStyle: Theme.of(context).textTheme.headline3,
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
              padding: const EdgeInsets.only(left: 10.0,right: 10.0,bottom: 5.0,top: 16.0),
              child: TabBarView(
                children: [
                  SizedBox(),
                  ListView.builder(
                    itemBuilder: (context, index) => InkWell(
                      onTap: (){
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

                                  borderRadius: BorderRadius.all(Radius.circular(11.0)),
                                  border: Border.all(color: Colors.grey)),
                              child: Column(
                                crossAxisAlignment:CrossAxisAlignment.start,
                                children: [
                                  Text(
                                   'برنامج تدريبى للياقة البدنية العامة',
                                    style: Theme.of(context).textTheme.headline4,
                                  ),
                                  Row(
                                    children: [
                                      showTextWithIcon(
                                          context: context,
                                          iconUrl: 'images/calendar.png',
                                          titleText: '10 أسابيع'),
                                      SizedBox(width: 40.0,),
                                      showTextWithIcon(
                                          context: context,
                                          iconUrl: 'images/calendar.png',
                                          titleText: '29 فبراير 2022'),

                                    ],
                                  ),

                                  showTextWithIcon(
                                      context: context,
                                      iconUrl: 'images/locationMark.png',
                                      titleText: 'جولدز جيم الرياض'),
                                ],),
                            ),
                            Container(
                              height: 40,
                              width: media.width*0.31,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(38.0))),
                              child: Center(
                                child: Text(
                                  '250 ر.س',
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
          )),
    );
  }
}
