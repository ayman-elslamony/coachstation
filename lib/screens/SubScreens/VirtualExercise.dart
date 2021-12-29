import 'package:coachstation/Helper/components.dart';
import 'package:coachstation/Localization/app_localizations.dart';
import 'package:coachstation/provider/changeIndexPage.dart';
import 'package:coachstation/screens/MainScreens/NavigationHome.dart';
import 'package:coachstation/screens/SubScreens/VirtualExerciseHomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';


class VirtualExercise extends StatefulWidget {
  @override
  _VirtualExerciseState createState() => _VirtualExerciseState();
}

class _VirtualExerciseState extends State<VirtualExercise> {
  int _currentAge = 0;
  int _currentWeight = 0;
  int _currentHeight = 0;
  int _currentLevel = 0;
  bool _enableConfirmedButton = false;

  Widget showText({String textKey,BuildContext context}) {
    return Text(
      textKey,
    style: Theme.of(context).textTheme.headline3,);
  }

  void changeAge(int age) {
    setState(() {
      _currentAge = age;
    });
    print('fdg');
    print(_currentAge);
  }

  void changeWeight(int age) {
    setState(() {
      _currentWeight = age;
    });
  }

  void changeHeight(int age) {
    setState(() {
      _currentHeight = age;
    });
  }

  void changeLevel(int age) {
    setState(() {
      _currentLevel = age;
    });
  }

  Widget buttonWidget({BuildContext context, String textKey, Function onTap}) {
    String levelKey = '';
    if (_currentLevel == 1) levelKey = 'junior';
    if (_currentLevel == 2) levelKey = 'average';
    if (_currentLevel == 3) levelKey = 'advanced';
    return Container(
      margin: EdgeInsets.only(bottom: 30.0),
      width: 300,
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
            if (textKey == 'level' && _currentLevel != 0)
              showText(
                  textKey: '${AppLocalizations.of(context).trans(levelKey)}',context: context),
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

  List<int> listVal = [0, 1];
  int val = 0;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    if (_currentAge != 0 &&
        _currentHeight != 0 &&
        _currentWeight != 0 &&
        _currentLevel != 0) {
      _enableConfirmedButton = true;
    }
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
                  size: 15,
                )),
            title: Text(
              '${AppLocalizations.of(context).trans('virtual_exercise')}',
            ),
          ),
          SliverToBoxAdapter(
              child: Column(
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
              buttonWidget(
                  context: context,
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => CheckedBoxLevel(
                              result: _currentLevel,
                              onChange: changeLevel,
                            ));
                  },
                  textKey: 'level'),
              SizedBox(
                height: 20.0,
              ),
              defaultButton(
                  function: () {
                    navigateTo(context, VirtualExerciseHomeScreen());
                  },
//                  _enableConfirmedButton?(){
//                    navigateTo(context, VirtualExerciseHomeScreen());
//          }:null,
                  text: '${AppLocalizations.of(context).trans('submit_order')}',
                  width: media.width * 0.7,
                  background: _enableConfirmedButton
                      ? Theme.of(context).primaryColor
                      : Color(0xFFf3db7c)),
            ],
          )),
        ],
      ),

    );
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
  Function onChange;

  ShowAlertDialog(
      {this.currentValue,
      this.titleKey,
      @required this.onChange,
      this.isHeight = false,
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
    if (widget.isWeight) {
      minValue = 35;
      maxValue = 250;
      widget.currentValue = 35;
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
