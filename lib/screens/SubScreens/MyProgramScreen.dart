import 'package:coachstation/Helper/components.dart';
import 'package:coachstation/Localization/app_localizations.dart';
import 'package:coachstation/provider/changeIndexPage.dart';
import 'package:coachstation/screens/MainScreens/NavigationHome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ShowSpecificVirtualExerciseDetails.dart';

class MyProgramScreen extends StatefulWidget {
  @override
  _MyProgramScreenState createState() => _MyProgramScreenState();
}

class _MyProgramScreenState extends State<MyProgramScreen> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return DefaultTabController(
      initialIndex: 2,
      length: 3,
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
          title: Text(
            '${AppLocalizations.of(context).trans('virtual_exercise')}',
          ),
          titleSpacing: 2.0,
          bottom: TabBar(
            isScrollable: true,
            labelColor: Theme.of(context).primaryColor,
            indicatorColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                text:
                    '${AppLocalizations.of(context).trans('virtual_exercise')}',
              ),
              Tab(
                text: '${AppLocalizations.of(context).trans('home_workout')}',
              ),
              Tab(
                text:
                    '${AppLocalizations.of(context).trans('nutritional_programs')}',
              ),
            ],
          ),
        ),
        body: SizedBox(
          width: media.width,
          height: media.height,
          child: TabBarView(
            children: [
              ListView.builder(
                itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                        onTap: () {
                          navigateTo(
                              context,
                              ShowSpecificVirtualExerciseDetails(
                                titleOfExercise: 'Bench Press',
                              ));
                        },
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                imgList[index],
                                fit: BoxFit.fill,
                                height: media.height * 0.25,
                                width: media.width,
                              ),
                            ),
                            Container(
                              height: 50,
                              width: media.width * 0.42,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10.0),
                                      bottomLeft: Radius.circular(30.0))),
                              child: Center(
                                child: Text('Bench Press',
                                    style:
                                        Theme.of(context).textTheme.headline3),
                              ),
                            ),
                          ],
                        ))),
                itemCount: imgList.length,
              ),
              ListView.builder(
                itemBuilder: (context, index) => Container(
                  width: media.width * 0.95,
                  margin: const EdgeInsets.only(
                      bottom: 12.0, left: 10.0, right: 10.0),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 8.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey[300]),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      )),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('?????????? ??????????',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.headline3),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            showTextWithIcon(
                                context: context,
                                iconUrl: 'images/clock.png',
                                titleText: '3 ????????'),
                            showTextWithIcon(
                                context: context,
                                iconUrl: 'images/calendar.png',
                                titleText: '?????????? ???? 20 ???????????? 2022'),
                            SizedBox()
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      SizedBox(
                        width: media.width,
                        height: 40,
                        child: Center(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Container(
                              height: 35,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                              ),
                              decoration: BoxDecoration(
                                  color: Theme.of(context).accentColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0))),
                              child: Center(
                                  child: Text(
                                '??????????',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    .copyWith(color: Colors.white),
                              )),
                            ),
                            itemCount: 4,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                itemCount: 8,
              ),
              ListView.builder(
                itemBuilder: (context, index) => defaultCard(
                    function: () {},
                    context: context,
                    textTitle: '???????????? ?????? 1',
                    textSubTitleOne: '4 ????????????',
                    imageUrl: imgList[index],
                    cardWidth: media.width,
                    containerTextWidth: media.width * 0.4,
                    cardHeight: media.height * 0.3),
                itemCount: imgList.length,
              ),
            ],
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
