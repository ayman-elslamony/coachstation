import 'package:coachstation/Helper/components.dart';
import 'package:coachstation/Localization/app_localizations.dart';
import 'package:coachstation/provider/changeIndexPage.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'ShowSpecificNutritionalProgramsScreen.dart';

class AllNutritionalProgramsScreen extends StatefulWidget {
  @override
  _AllNutritionalProgramsScreenState createState() =>
      _AllNutritionalProgramsScreenState();
}

class _AllNutritionalProgramsScreenState extends State<AllNutritionalProgramsScreen> {


  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
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
          title: Text(
            '${AppLocalizations.of(context).trans('al_nutritional_programs')}',
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
                text: '${AppLocalizations.of(context).trans('intensive_programs')}',
              ),
              Tab(
                text: '${AppLocalizations.of(context).trans('moderate_programs')}',
              ),
            ],
          ),
        ),
        body: SizedBox(
          width: media.width,
          height: media.height,
          child: TabBarView(
            children: [
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.2
                ),
                itemBuilder: (context, index) => defaultCard(
                    function: () {
                      navigateTo(context, ShowSpecificNutritionalProgramsScreen(
                        titleOfExercise: 'برنامج رقم 1',
                      ));
                    },
                    context: context,
                    textTitle:
                    'برنامج رقم 1',
                    textSubTitleOne: '4 أسابيع',
                    textSubTitleTwo: '250 رس',
                    imageUrl: imgList[index],
                    cardWidth: media.width,
                    containerTextWidth: media.width * 0.4,
                    cardHeight: media.height*0.3),
                itemCount: imgList.length,
              ),
              SizedBox(),
              SizedBox(),
            ],
          ),
        )
      ),
    );
  }
}
