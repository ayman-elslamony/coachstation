import 'package:coachstation/Helper/components.dart';
import 'package:coachstation/Localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProgramDetailsScreen extends StatefulWidget {
  String titleOfExercise;

  ProgramDetailsScreen({this.titleOfExercise});

  @override
  _ProgramDetailsScreenState createState() =>
      _ProgramDetailsScreenState();
}

class _ProgramDetailsScreenState
    extends State<ProgramDetailsScreen> {
  Widget showExerciseDetails({String titleText, String subTitleText}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titleText,
            style: TextStyle(
              fontFamily: 'CairoRegular',
              fontSize: 17,
              color: Colors.grey[400],
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            subTitleText,
            style: TextStyle(
              height: 1.5,
              fontFamily: 'CairoRegular',
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }



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
                  size: 18,
                )),
            title: Text(
              widget.titleOfExercise,
            ),
          ),
          SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 29.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.start,
                  children: [

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
                    SizedBox(height: 20.0,),
                    showExerciseDetails(
                        titleText: 'الهدف',
                        subTitleText: 'Bench Press'),
                    showExerciseDetails(
                        titleText: 'المدة', subTitleText: '5 اسابيع'),
                    showExerciseDetails(
                        titleText: 'المستوى', subTitleText: 'مبتدئ'),
                    showExerciseDetails(
                        titleText: 'عدد أيام التمرين أسبوعياً', subTitleText: '4 Days'),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
