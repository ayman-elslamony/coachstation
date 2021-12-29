import 'package:coachstation/Helper/components.dart';
import 'package:coachstation/Localization/app_localizations.dart';
import 'package:coachstation/screens/SubScreens/VirtualExerciseHomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import 'AllNutritionalProgramsScreen.dart';

class NutritionalProgramsDetailsScreen extends StatefulWidget {
  @override
  _NutritionalProgramsDetailsScreenState createState() =>
      _NutritionalProgramsDetailsScreenState();
}

class _NutritionalProgramsDetailsScreenState
    extends State<NutritionalProgramsDetailsScreen> {
  int _currentAge = 0;
  int _currentWeight = 0;
  int _currentHeight = 0;
  bool _enableConfirmedButton = false;
  int programTypeResult = 0;
  int _currentSelectedLoseAndWeightWeight = 0;

//  if (programTypeResult == 1)  = 'junior';
//  if (programTypeResult == 2)  = 'average';
//  if (programTypeResult == 3)  = 'advanced';

Widget showSelectedItem({int index}){
  switch (index){
    case 1:
      return Column(
        children: [
          Text(
            '${AppLocalizations.of(context).trans('weight_required_to_lose_per_week')}',
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(
            height: 10.0,
          ),
          buttonWidget(
              context: context,
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => ShowAlertDialog(
                      onChange: changeLoseAndGainWeight,
                      currentValue: _currentSelectedLoseAndWeightWeight,
                      titleKey: 'choose_weight',
                      isNeededToLose: true,
                    ));
              },
              textKey: 'choose_weight'),
        ],
      );
    break;
    case 2:
      return Column(
        children: [
          Text(
            '${AppLocalizations.of(context).trans('weight_to_be_stabilized_per_week')}',
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(
            height: 10.0,
          ),
          buttonWidget(
              context: context,
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => ShowAlertDialog(
                      onChange: changeLoseAndGainWeight,
                      currentValue: _currentSelectedLoseAndWeightWeight,
                      isNeededToLose: true,
                      titleKey: 'choose_weight',
                    ));
              },
              textKey: 'choose_weight'),
        ],
      );
      break;
    case 3:
      return Column(
        children: [
          Text(
            '${AppLocalizations.of(context).trans('weight_to_gain_per_week')}',
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(
            height: 10.0,
          ),
          buttonWidget(
              context: context,
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => ShowAlertDialog(
                      onChange: changeLoseAndGainWeight,
                      currentValue: _currentSelectedLoseAndWeightWeight,
                      isNeededToLose: true,
                      titleKey: 'choose_weight',
                    ));
              },
              textKey: 'choose_weight'),
        ],
      );
      break;
    default:
      return SizedBox();
  }
}
  Widget showText({String textKey,BuildContext context}) {
    return Text(
      textKey,
      style: Theme.of(context).textTheme.headline2
    );
  }

  void changeAge(int age) {
    setState(() {
      _currentAge = age;
    });
    print('fdg');
    print(_currentAge);
  }

  void changeWeight(int value) {
    setState(() {
      _currentWeight = value;
    });
  }
  void changeLoseAndGainWeight(int value) {
    setState(() {
      _currentSelectedLoseAndWeightWeight = value;
    });
  }

  void changeHeight(int value) {
    setState(() {
      _currentHeight = value;
    });
  }


  Widget buttonWidget({BuildContext context, String textKey, Function onTap}) {

    return Container(
      margin: EdgeInsets.only(bottom: 15.0),
      width: 330,
      height: 55.0,
      child: MaterialButton(
        onPressed: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            showText(textKey: '${AppLocalizations.of(context).trans(textKey)}',context: context),
            if (textKey == 'age' && _currentAge != 0)
              showText(
                  textKey:
                      '${_currentAge} ${AppLocalizations.of(context).trans('year')}',context: context),
            if (textKey == 'height' && _currentHeight != 0)
              showText(textKey: '${_currentHeight} Cm ',context: context),
            if (textKey == 'weight' && _currentWeight != 0)
              showText(textKey: '${_currentWeight} Kg',context: context),
              if (_currentSelectedLoseAndWeightWeight != 0 && textKey == 'choose_weight') showText(textKey: '${_currentSelectedLoseAndWeightWeight} Kg',context: context),
          ],
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            25.0,
          ),
          color: Colors.white,
          border: Border.all(color: Colors.grey[500])),
    );
  }

  Widget loseWeightCard({BuildContext context, int index, String titleKey}) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.0),
      width: 330,
      height: 55.0,
      child:  SizedBox(
//        height: 50,
        child: RadioListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
          activeColor: Theme.of(context).primaryColor,
          title: defaultSubtitleTextOne(
              context: context,
              text: '${AppLocalizations.of(context).trans(titleKey)}'),
          value: index,
          groupValue: programTypeResult,
          onChanged: (value) {
            setState(() {
              print(value);
             programTypeResult = value;
            });
          }, //  <-- leading Checkbox
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            25.0,
          ),
          color: Colors.white,
          border: Border.all(color: Colors.grey[500])),
    );
  }



  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    if (_currentSelectedLoseAndWeightWeight != 0) {
      _enableConfirmedButton = true;
    }
    return Scaffold(
        appBar:
        defaultAppBar(context: context,
        titleKey: 'al_nutritional_programs',
        ),
        body: SizedBox(
          width: media.width,
          height: media.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  '${AppLocalizations.of(context).trans('please_enter_the_following_data')}',
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(
                  height: 40.0,
                ),
                buttonWidget(
                    context: context,
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => ShowAlertDialog(
                                onChange: changeAge,
                                currentValue: _currentAge,
                                titleKey: 'choose_age',
                              ));
                    },
                    textKey: 'age'),
                buttonWidget(
                    context: context,
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => ShowAlertDialog(
                                onChange: changeHeight,
                                currentValue: _currentHeight,
                                titleKey: 'choose_height',
                                isHeight: true,
                              ));
                    },
                    textKey: 'height'),
                buttonWidget(
                    context: context,
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => ShowAlertDialog(
                                onChange: changeWeight,
                                currentValue: _currentWeight,
                                titleKey: 'choose_weight',
                                isWeight: true,
                              ));
                    },
                    textKey: 'weight'),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  '${AppLocalizations.of(context).trans('program_type')}',
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(
                  height: 10.0,
                ),
                loseWeightCard(
                  context: context,
                  index: 1,
                  titleKey: 'weight_loss',
                ),
                loseWeightCard(
                  context: context,
                  index: 2,
                  titleKey: 'weight_stability',
                ),
                loseWeightCard(
                  context: context,
                  index: 3,
                  titleKey: 'increase_weight',
                ),
            if(programTypeResult != 0) showSelectedItem(index: programTypeResult),
                SizedBox(height: 30.0,),
                defaultButton(
                    function: (){
                      navigateTo(context, AllNutritionalProgramsScreen());
                    },
//                    _enableConfirmedButton
//                        ? () {
//                            navigateTo(context, VirtualExerciseHomeScreen());
//                          }
//                        : null,
                    text:
                        '${AppLocalizations.of(context).trans('submit_order')}',
                    width: media.width * 0.7,
                    background: _enableConfirmedButton
                        ? Theme.of(context).primaryColor
                        : Color(0xFFf3db7c)),
                SizedBox(height: 40.0,),
              ],
            ),
          ),
        ));
  }
}

class CheckedBoxLevel extends StatefulWidget {
  int result;
  Function onChange;

  CheckedBoxLevel({
    this.result,
    @required this.onChange,
  });

  @override
  _CheckedBoxLevelState createState() => _CheckedBoxLevelState();
}

class _CheckedBoxLevelState extends State<CheckedBoxLevel> {
  Widget showRaisedButton({BuildContext context, int index, String titleKey}) {
    return SizedBox(
      height: 50,
      child: RadioListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
        activeColor: Theme.of(context).primaryColor,
        title: defaultSubtitleTextOne(
            context: context,
            text: '${AppLocalizations.of(context).trans(titleKey)}'),
        value: index,
        groupValue: widget.result,
        onChanged: (value) {
          setState(() {
            print(value);
            widget.onChange(value);
            widget.result = value;
          });
        }, //  <-- leading Checkbox
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        '${AppLocalizations.of(context).trans('level')}',
        style: Theme.of(context).textTheme.headline5,
        textAlign: TextAlign.center,
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0))),
      contentPadding: EdgeInsets.only(top: 10.0),
      content: SizedBox(
        height: 180,
        child: Column(
          children: [
            showRaisedButton(
              context: context,
              index: 1,
              titleKey: 'junior',
            ),
            showRaisedButton(
              context: context,
              index: 2,
              titleKey: 'average',
            ),
            showRaisedButton(
              context: context,
              index: 3,
              titleKey: 'advanced',
            ),
          ],
        ),
      ),
    );
  }
}

class ShowAlertDialog extends StatefulWidget {
  int currentValue;
  String titleKey;
  bool isWeight;
  bool isHeight;
  bool isNeededToLose;
  Function onChange;

  ShowAlertDialog(
      {this.currentValue,
      this.titleKey,
      @required this.onChange,
      this.isHeight = false,
        this.isNeededToLose=false,
      this.isWeight = false});

  @override
  _ShowAlertDialogState createState() => _ShowAlertDialogState();
}

class _ShowAlertDialogState extends State<ShowAlertDialog> {
  int minValue = 0;
  int maxValue = 100;

  @override
  void initState() {
    widget.currentValue = 20;
    if (widget.isHeight) {
      minValue = 120;
      maxValue = 210;
      widget.currentValue = 120;
    }
    if (widget.isWeight && widget.isNeededToLose ==false) {
      minValue = 35;
      maxValue = 250;
      widget.currentValue = 35;
    }

    if (widget.isNeededToLose) {
      minValue = 1;
      maxValue = 60;
      widget.currentValue = 1;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        '${AppLocalizations.of(context).trans(widget.titleKey)}',
        style: Theme.of(context).textTheme.headline5,
        textAlign: TextAlign.center,
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0))),
      contentPadding: EdgeInsets.only(top: 10.0),
      content: SizedBox(
        width: 10.0,
        height: 160,
        child: Column(
          children: [
            NumberPicker(
              textMapper: (val) {
                if (widget.isWeight) {
                  return '${val} Kg';
                }
                if (widget.isHeight) {
                  return '${val} CM';
                }
                return '${val}';
              },
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 3.0,
                ),
              )),
              value: widget.currentValue,
              selectedTextStyle: Theme.of(context).textTheme.headline4,
              minValue: minValue,
              maxValue: maxValue,
              onChanged: (value) {
                print(value.toString());
                setState(() {
                  widget.onChange(value);
                  widget.currentValue = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
