import 'package:coachstation/Helper/components.dart';
import 'package:coachstation/Localization/app_localizations.dart';
import 'package:flutter/material.dart';


class HomeWorkoutScreen extends StatefulWidget {

  @override
  _HomeWorkoutScreenState createState() =>
      _HomeWorkoutScreenState();
}

class _HomeWorkoutScreenState
    extends State<HomeWorkoutScreen> {
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
        appBar: defaultAppBar(context: context,
            titleKey: '',
            isTextNotKey: true),
        body: Padding(
          padding:
          const EdgeInsets.symmetric( horizontal: 15.0,vertical: 8.0),
          child: SizedBox(
            width: media.width,
            height: media.height,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      imgList[0],
                      fit: BoxFit.fill,
                      height: media.height * 0.32,
                      width: media.width,
                    ),
                  ),
                  SizedBox(height: 20.0,),
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
                ],
              ),
            ),
          ),
        )
    );
  }
}
