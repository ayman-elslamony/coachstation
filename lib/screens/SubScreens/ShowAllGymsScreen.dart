import 'package:coachstation/Helper/components.dart';
import 'package:coachstation/Localization/app_localizations.dart';
import 'package:coachstation/provider/changeIndexPage.dart';
import 'package:coachstation/screens/MainScreens/NavigationHome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'FilterAllGymScreen.dart';
import 'ShowSpecificGymScreen.dart';

class ShowAllGymsScreen extends StatefulWidget {
  @override
  _ShowAllGymsScreenState createState() => _ShowAllGymsScreenState();
}

class _ShowAllGymsScreenState extends State<ShowAllGymsScreen> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return DefaultTabController(
      initialIndex: 1,
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          leading: Consumer<ChangeIndex>(
            builder: (context, changeIndex, child) => IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const ImageIcon(
                  AssetImage(
                    'images/arrowLeft.png',
                  ),
                  size: 15,
                )),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  navigateTo(context, FilterAllGymScreen());
                },
                icon: Icon(Icons.edgesensor_high_outlined)),
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          ],
          title: Text(
            '${AppLocalizations.of(context).trans('gyms')}',
          ),
          titleSpacing: 2.0,
          bottom: TabBar(
            isScrollable: true,
            labelColor: Theme.of(context).primaryColor,
            indicatorColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Colors.grey,
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
              Tab(
                text:
                    '${AppLocalizations.of(context).trans('physical_therapy')}',
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
                  itemBuilder: (context, index) => defaultCard(
                      function: () {
                        navigateTo(context, ShowSpecificGymScreen());
                      },
                      context: context,
                      textTitle: 'Gold Gym',
                      imageUrl: imgList[index],
                      cardWidth: media.width,
                      containerTextWidth: media.width * 0.62,
                      cardHeight: media.height * 0.25),
                  itemCount: 5,
                ),
                SizedBox(),
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
