import 'package:coachstation/Helper/components.dart';
import 'package:coachstation/Localization/app_localizations.dart';
import 'package:flutter/material.dart';

class VirtualExercise extends StatefulWidget {
  @override
  _VirtualExerciseState createState() => _VirtualExerciseState();
}

class _VirtualExerciseState extends State<VirtualExercise> {

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const ImageIcon(
                  AssetImage(
                    'images/arrowLeft.png',
                  ),
                  size: 23,
                )),
            title: Text(
              '${AppLocalizations.of(context).trans('VirtualExercise')}',
            ),
          ),
          SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: 20.0,),
//                  defaultButton(
//                      function: () {},
//                      text: '${AppLocalizations.of(context).trans('change')}',
//                      width: media.width * 0.7),
//                  defaultButton(
//                      function: () {},
//                      text: '${AppLocalizations.of(context).trans('change')}',
//                      width: media.width * 0.7),
//                  defaultButton(
//                      function: () {},
//                      text: '${AppLocalizations.of(context).trans('change')}',
//                      width: media.width * 0.7),
//                  defaultButton(
//                      function: () {},
//                      text: '${AppLocalizations.of(context).trans('change')}',
//                      width: media.width * 0.7),
                  defaultButton(
                      function: () {},
                      text: '${AppLocalizations.of(context).trans('change')}',
                      width: media.width * 0.7),

                ],
              )),
        ],
      ),
    );
  }
}
