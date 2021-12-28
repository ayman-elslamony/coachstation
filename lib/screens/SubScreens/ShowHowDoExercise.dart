import 'package:carousel_slider/carousel_slider.dart';
import 'package:coachstation/Helper/components.dart';
import 'package:coachstation/Localization/app_localizations.dart';
import 'package:coachstation/provider/changeIndexPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ShowSpecificVirtualExerciseDetails.dart';
//import 'package:better_player/better_player.dart';



class ShowHowDoExercise extends StatefulWidget {
  String title;

  ShowHowDoExercise({this.title});

  @override
  _ShowHowDoExerciseState createState() => _ShowHowDoExerciseState();
}

class _ShowHowDoExerciseState extends State<ShowHowDoExercise> {
  Widget showExerciseDetails({String text}) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: TextStyle(
        fontFamily: 'CairoRegular',
        fontSize: 14,
        height: 1.5,
        color: Colors.grey[800],
        fontWeight: FontWeight.bold,
      ),
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
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                CarouselSlider(
                  items: imgList
                      .map((item) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                child: Image.network(item,
                                    fit: BoxFit.cover, width: 1000.0)),
                          ))
                      .toList(),
                  options: CarouselOptions(
                    height: 200,
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
                  height: 10.0,
                ),
                Text(
                  '${AppLocalizations.of(context).trans('description')}',
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(
                  width: media.width,
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
                  height: 20.0,
                ),
//                AspectRatio(
//                  aspectRatio: 16 / 9,
//                  child: BetterPlayer.network(
//                    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
//                    betterPlayerConfiguration: BetterPlayerConfiguration(
//                      aspectRatio: 16 / 9,
//                    ),
//                  ),
//                ),
              ],
            ),
          ),
        ));
  }
}
