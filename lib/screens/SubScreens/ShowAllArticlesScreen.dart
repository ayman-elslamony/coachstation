import 'package:coachstation/Helper/components.dart';
import 'package:coachstation/Localization/app_localizations.dart';
import 'package:flutter/material.dart';

import 'ShowOneArticleScreen.dart';
import 'ShowSpecificVirtualExerciseDetails.dart';

class ShowAllArticlesScreen extends StatefulWidget {

  @override
  _ShowAllArticlesScreenState createState() =>
      _ShowAllArticlesScreenState();
}

class _ShowAllArticlesScreenState
    extends State<ShowAllArticlesScreen> {
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
        appBar: defaultAppBar(context: context,
            titleKey: 'articles'),
        body: Padding(
          padding:
          const EdgeInsets.symmetric( horizontal: 15.0,vertical: 8.0),
          child: SizedBox(
            width: media.width,
            height: media.height,
            child: ListView.builder(
              itemBuilder: (context, index) => defaultArticle(
                  function: () {
                    navigateTo(context, ShowOneArticleScreen());
                  },
                  context: context,
                  textSubTitle:
                  'لقم تم توليد هذا النص من مولد النص العربى',
                  textTitle:
                  '${AppLocalizations.of(context).trans('gyms')}',
                  imageUrl: imgList[0],
                  articleWidth: media.width,
                  imageHeight: media.height * 0.3,
                  articleHeight: media.height * 0.39),
              itemCount: imgList.length,
            ),
          ),
        )
    );
  }
}
