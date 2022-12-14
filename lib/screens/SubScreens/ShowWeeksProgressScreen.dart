import 'package:coachstation/Helper/components.dart';
import 'package:coachstation/Localization/app_localizations.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';


class ShowWeeksProgressScreen extends StatefulWidget {
  @override
  _ShowWeeksProgressScreenState createState() => _ShowWeeksProgressScreenState();
}

class _ShowWeeksProgressScreenState extends State<ShowWeeksProgressScreen> {
  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();




  Widget showDetailsTitles({String text}) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: Theme.of(context).textTheme.headline2.copyWith(
        height: 1.4
      )
    );
  }


  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
        appBar:defaultAppBar(context: context,
          isTextNotKey: true,
          titleKey:  'الأسبوع الأول',
        ),
        body: SizedBox(
          width: media.width,
          height: media.height,
          child:  Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView.separated(
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 14.0),
                  child: ExpansionTileCard(
                    contentPadding: EdgeInsets.all(0.0),
                    baseColor: Colors.white,
                    expandedColor: Colors.white,
                    initiallyExpanded: index==0?true:false,
                    leading: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 15.0),
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.all(Radius.circular(12.0)),
                          color: Colors.green),
                      child: Text(
                        'الإثنين',
                        style: Theme.of(context).textTheme.headline1.copyWith(
                        color: Colors.white,
                      ),
                      ),
                    ),
                    title: Row(
                      children: [
                        Text(
                          'عدد السعرات'
                          ,style: Theme.of(context).textTheme.headline3,
                        ),
                        Spacer(),
                        defaultSubtitleTextTwo(context: context, text: '1700 cool')
                      ],
                    ),
                    children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 8.0,
                      ),
                      child:ListView.builder(itemBuilder: (context,index)=>
                          Container(
                        width: media.width * 0.95,
                        margin: const EdgeInsets.only(
                            bottom: 12.0, left: 10.0, right: 10.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey[300]),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            )),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 8.0, top: 8.0, left: 8.0, right: 8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'الإفطار - 185 سعر حرارى',
                                              style: Theme.of(context).textTheme.headline3
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                showDetailsTitles(
                                                    text: 'صدر دجاج مسلوق'),
                                                showDetailsTitles(
                                                    text: 'صدر دجاج مسلوق'),
                                                showDetailsTitles(
                                                    text: 'صدر دجاج مسلوق'),
                                              ],
                                            )
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.grey[300],
                              height: 2.3,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.verified_rounded,
                                    color: Colors.green,
                                  ),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  Text(
                                    'تم',
                                    style: Theme.of(context).textTheme.headline3.copyWith(
                                      color: Colors.green
                                    )
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      itemCount: 8,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                      ),
                  ),
                ),
              ],
            ),
        ),
                separatorBuilder:  (context, index) =>myDivider(),
                itemCount: 4),
          )
          ,
        )
    );
  }
}
