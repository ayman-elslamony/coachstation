import 'package:coachstation/Helper/components.dart';
import 'package:coachstation/Localization/app_localizations.dart';
import 'package:coachstation/provider/changeIndexPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ShowVirtualExerciseDetails.dart';

class VirtualExerciseHomeScreen extends StatefulWidget {
  @override
  _VirtualExerciseHomeScreenState createState() =>
      _VirtualExerciseHomeScreenState();
}

class _VirtualExerciseHomeScreenState extends State<VirtualExerciseHomeScreen> {


  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return DefaultTabController(
      initialIndex: 0,
      length: 5,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: Consumer<ChangeIndex>(
                builder: (context, changeIndex, child) => IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const ImageIcon(
                      AssetImage(
                        'images/arrowLeft.png',
                      ),
                      size: 18,
                    )),
              ),
              title: Text(
                '${AppLocalizations.of(context).trans('virtual_exercise')}',
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
                    text: '${AppLocalizations.of(context).trans('fitness')}',
                  ),
                  Tab(
                    text: '${AppLocalizations.of(context).trans('athletics')}',
                  ),
                  Tab(
                    text: '${AppLocalizations.of(context).trans('zimba')}',
                  ),
                  Tab(
                    text: '${AppLocalizations.of(context).trans('yoga')}',
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                width: media.width,
                height: media.height,
                child: TabBarView(
                  children: [
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                      childAspectRatio: 1.2
                      ),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => defaultCard(
                          function: () {
                            print('dfvbdf');
                            navigateTo(context, ShowVirtualExerciseDetails(
                              titleOfExercise: 'Chest',
                            ));
                          },
                          context: context,
                          textTitle:
                          'Chest',
                          textSubTitleOne: '10 تمارين',
                          imageUrl: imgList[index],
                          cardWidth: media.width,
                          containerTextWidth: media.width * 0.4,
                          cardHeight: media.height*0.3),
                      itemCount: imgList.length,
                    ),
                   SizedBox(),
                   SizedBox(),
                   SizedBox(),
                   SizedBox(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
