import 'package:coachstation/Helper/components.dart';
import 'package:coachstation/Localization/app_localizations.dart';
import 'package:flutter/material.dart';

import 'ShowSpecificVirtualExerciseDetails.dart';

class ShowVirtualExerciseDetails extends StatefulWidget {
  String titleOfExercise;

  ShowVirtualExerciseDetails({this.titleOfExercise});

  @override
  _ShowVirtualExerciseDetailsState createState() =>
      _ShowVirtualExerciseDetailsState();
}

class _ShowVirtualExerciseDetailsState
    extends State<ShowVirtualExerciseDetails> {
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: defaultAppBar(context: context,
      titleKey: widget.titleOfExercise,isTextNotKey: true),
      body: Padding(
        padding:
        const EdgeInsets.symmetric( horizontal: 15.0,vertical: 8.0),
        child: SizedBox(
          width: media.width,
          height: media.height,
          child: ListView.builder(
            itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    onTap: () {
                      navigateTo(context,ShowSpecificVirtualExerciseDetails(
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
                            height: media.height*0.25,
                            width: media.width,
                          ),
                        ),
                        Container(
                          height: 45,
                          width: media.width*0.42,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(30.0))),
                          child: Center(
                            child: Text(
                              'Bench Press',
                             style: Theme.of(context).textTheme.headline3,
                            ),
                          ),
                        ),
                      ],
                    ))),
            itemCount: imgList.length,
          ),
        ),
      )
    );
  }
}
