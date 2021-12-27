import 'package:coachstation/Helper/components.dart';
import 'package:coachstation/Localization/app_localizations.dart';
import 'package:coachstation/provider/locale_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'ChooseTheCoachScreen.dart';
import 'TrainerProfileScreen.dart';

class ReserveInTrainingProgramsScreen extends StatefulWidget {
  @override
  _ReserveInTrainingProgramsScreenState createState() =>
      _ReserveInTrainingProgramsScreenState();
}

class _ReserveInTrainingProgramsScreenState
    extends State<ReserveInTrainingProgramsScreen> {
  Widget checkedBoxCard(
      {BuildContext context, String text, bool isSelected = false}) {
    return Container(
      width: 330,
      height: 55.0,
      margin: EdgeInsets.only(bottom: 15.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(11.0),
          ),
          border: Border.all(color: Colors.grey)),
      child: CheckboxListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
        activeColor: Theme.of(context).primaryColor,
        title: defaultSubtitleTextOne(context: context, text: text),
        value: isSelected,
        onChanged: (newValue) {
          setState(() {
            isSelected = newValue;
          });
        },
        controlAffinity:
            ListTileControlAffinity.leading, //  <-- leading Checkbox
      ),
    );
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var _locale = Provider.of<LocaleProvider>(context).locale.languageCode;
    final media = MediaQuery.of(context).size;
    return Scaffold(
        appBar: defaultAppBar(context: context, titleKey: 'reservation'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Column(
              children: [
                ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: defaultColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        )),
                    child: Center(
                        child: Text(
                      '1',
                      style: TextStyle(
                          fontFamily: 'CairoRegular',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )),
                  ),
                  title: Text(
                    '${AppLocalizations.of(context).trans('reservation_details')}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  subtitle: Text(
                    '${AppLocalizations.of(context).trans('step1_of_4')}',
                    style: TextStyle(
                      fontFamily: 'CairoRegular',
                      fontSize: 14,
                      height: 1.2,
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            defaultFormField(
                                onTap: () {
                                  print('/dfbcb');
                                },
                                type: TextInputType.number,
                                validate: (String value) {
                                  if (value.isEmpty) {
                                    return _locale == 'en'
                                        ? "please Enter your location"
                                        : 'من فضلك ادخل المحافظة';
                                  }
                                  return null;
                                },
                                onChange: (String val) {
                                  setState(() {});
                                },
                                isClickable: true,
                                label: 'المحافظة',
                                suffix: Icons.keyboard_arrow_down),
                            SizedBox(
                              height: 12.0,
                            ),
                            defaultFormField(
                                onTap: () {
                                  print('/dfbcb');
                                },
                                type: TextInputType.number,
                                validate: (String value) {
                                  return null;
                                },
                                onChange: (String val) {
                                  setState(() {});
                                },
                                isClickable: true,
                                label: 'المنطقة',
                                suffix: Icons.keyboard_arrow_down),
                            SizedBox(
                              height: 12.0,
                            ),
                            defaultFormField(
                              validate: (String value) {
                                return null;
                              },
                              onTap: () {
                                print('/dfbcb');
                              },
                              type: TextInputType.number,
                              isClickable: false,
                              label: 'الشارع',
                            ),
                            SizedBox(
                              height: 12.0,
                            ),
                            defaultFormField(
                              onTap: () {
                                print('/dfbcb');
                              },
                              type: TextInputType.number,
                              validate: (String value) {
                                return null;
                              },
                              onChange: (String val) {
                                setState(() {});
                              },
                              isClickable: false,
                              label: 'العمارة',
                            ),
                            SizedBox(
                              height: 12.0,
                            ),
//                              SizedBox(
//                                width: media.width,
//                                height: media.height*0.6,
//                                child: Row(
//                                  children: [
//                                    defaultFormField(
//                                      onTap: (){
//                                        print('/dfbcb');
//                                      },
//                                      controller: numOfPeopleController,
//                                      type: TextInputType.number,
//                                      validate: (String value) {
//                                        return null;
//                                      },
//                                      onChange: (String val) {
//                                        setState(() {});
//                                      },
//                                      isClickable: false,
//                                      label: 'العمارة',
//                                    ),
//                                    defaultFormField(
//                                      onTap: (){
//                                        print('/dfbcb');
//                                      },
//                                      controller: numOfPeopleController,
//                                      type: TextInputType.number,
//                                      validate: (String value) {
//                                        return null;
//                                      },
//                                      onChange: (String val) {
//                                        setState(() {});
//                                      },
//                                      isClickable: false,
//                                      label: 'العمارة',
//
//                                    ),
//                                  ],
//                                ),
//                              ),
                            SizedBox(
                              height: 12.0,
                            ),
                            defaultFormField(
                              onTap: () {
                                print('/dfbcb');
                              },
                              type: TextInputType.number,
                              validate: (String value) {
                                return null;
                              },
                              onChange: (String val) {
                                setState(() {});
                              },
                              isClickable: false,
                              label: 'علامة مميزة',
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: media.width,
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            defaultButton(
                                function: () {
                                  navigateTo(
                                      context, ReservationScreenStepTwo());
                                },
                                width: media.width * 0.6,
                                radius: 28,
                                background: defaultColor,
                                text:
                                    '${AppLocalizations.of(context).trans('next')}')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class ReservationScreenStepTwo extends StatefulWidget {
  @override
  _ReservationScreenStepTwoState createState() =>
      _ReservationScreenStepTwoState();
}

class _ReservationScreenStepTwoState extends State<ReservationScreenStepTwo> {
  Widget checkedBoxCard(
      {BuildContext context, String text, bool isSelected = false}) {
    return Container(
      width: 330,
      height: 55.0,
      margin: EdgeInsets.only(bottom: 15.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(11.0),
          ),
          border: Border.all(color: Colors.grey)),
      child: CheckboxListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
        activeColor: Theme.of(context).primaryColor,
        title: defaultSubtitleTextOne(context: context, text: text),
        value: isSelected,
        onChanged: (newValue) {
          setState(() {
            isSelected = newValue;
          });
        },
        controlAffinity:
            ListTileControlAffinity.leading, //  <-- leading Checkbox
      ),
    );
  }

  final _formKey = GlobalKey<FormState>();

  bool enableNextButton = false;
  var numOfPeopleController = TextEditingController();
  bool isCoachSelected = false;
  int radioTileCardResult = 0;

  Widget radioTileCard({BuildContext context, int index, String titleKey}) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.0),
      width: 330,
      height: 55.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(11.0),
          ),
          border: Border.all(color: Colors.grey)),
      child: SizedBox(
//        height: 50,
        child: RadioListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
          activeColor: Theme.of(context).primaryColor,
          title: defaultSubtitleTextOne(
              context: context,
              text: '${AppLocalizations.of(context).trans(titleKey)}'),
          value: index,
          groupValue: radioTileCardResult,
          onChanged: (value) {
            setState(() {
              print(value);
              radioTileCardResult = value;
            });
          }, //  <-- leading Checkbox
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    enableNextButton = false;
    if (radioTileCardResult == 0 || radioTileCardResult == 2) {
      enableNextButton = false;
    }

    if (radioTileCardResult == 1 || radioTileCardResult == 3) {
      enableNextButton = true;
    }
    if (radioTileCardResult == 2 || numOfPeopleController != null) {
      enableNextButton = true;
    }
    final media = MediaQuery.of(context).size;
    return Scaffold(
        appBar: defaultAppBar(context: context, titleKey: 'reservation'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Column(
              children: [
                ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: defaultColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        )),
                    child: Center(
                        child: Text(
                      '2',
                      style: TextStyle(
                          fontFamily: 'CairoRegular',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )),
                  ),
                  title: Text(
                    '${AppLocalizations.of(context).trans('reservation_details')}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  subtitle: Text(
                    '${AppLocalizations.of(context).trans('step2_of_4')}',
                    style: TextStyle(
                      fontFamily: 'CairoRegular',
                      fontSize: 14,
                      height: 1.2,
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            '${AppLocalizations.of(context).trans('choose_the_coach')}',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ],
                      ),
                      isCoachSelected == false
                          ? Container(
                              width: 330,
                              height: 55.0,
                              margin: EdgeInsets.only(bottom: 15.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(11.0),
                                  ),
                                  border: Border.all(color: Colors.grey)),
                              child: ListTile(
                                onTap: () async {
                                  bool waitResult = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ChooseTheCoachScreen(),
                                    ),
                                  );
                                  if (waitResult) {
                                    setState(() {
                                      isCoachSelected = true;
                                    });
                                  }
                                },
                                title: Text(
                                  '${AppLocalizations.of(context).trans('choose_the_coach')}',
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 18.0,
                                ),
                              ),
                            )
                          : Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8.0),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(11.0)),
                                  border: Border.all(color: Colors.grey)),
                              child: Row(
                                children: [
                                  Stack(
                                    children: [
                                      CircleAvatar(
                                        radius: 45,
                                        child: ClipOval(
                                          child: Image.asset(
                                            "images/userProfile.png",
                                            fit: BoxFit.cover,
                                            width: 90,
                                            height: 90,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        child: CircleAvatar(
                                          radius: 15,
                                          child: ClipOval(
                                            child: Image.asset(
                                              "images/allah.png",
                                              fit: BoxFit.cover,
                                              width: 40,
                                              height: 40,
                                            ),
                                          ),
                                        ),
                                        left: 5.0,
                                        bottom: 0.0,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'النادى الرياضى',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3,
                                        ),
                                        defaultSubtitleTextTwo(
                                            context: context,
                                            text: 'المدرب محمد سيد'),
                                        Row(
                                          children: [
                                            RatingBar.builder(
                                              initialRating: 4,
                                              minRating: 1,
                                              itemSize: 15,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 4,
                                              itemPadding: EdgeInsets.symmetric(
                                                  horizontal: 4.0),
                                              itemBuilder: (context, _) =>
                                                  ImageIcon(
                                                AssetImage('images/star.png'),
                                                color: Colors.amber,
                                              ),
                                              onRatingUpdate: (rating) {
                                                print(rating);
                                              },
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isCoachSelected = false;
                                        });
                                      },
                                      icon: ImageIcon(
                                        AssetImage('images/deleteIcon.png'),
                                        color: Colors.red,
                                        size: 25.0,
                                      ))
                                ],
                              ),
                            ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Row(
                        children: [
                          Text(
                            '${AppLocalizations.of(context).trans('training_days')}',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      checkedBoxCard(
                          context: context,
                          text:
                              '${AppLocalizations.of(context).trans('saturday')}',
                          isSelected: true),
                      checkedBoxCard(
                          context: context,
                          text:
                              '${AppLocalizations.of(context).trans('sunday')}',
                          isSelected: true),
                      checkedBoxCard(
                          context: context,
                          text:
                              '${AppLocalizations.of(context).trans('monday')}',
                          isSelected: false),
                      checkedBoxCard(
                          context: context,
                          text:
                              '${AppLocalizations.of(context).trans('tuesday')}',
                          isSelected: false),
                      checkedBoxCard(
                          context: context,
                          text:
                              '${AppLocalizations.of(context).trans('wednesday')}',
                          isSelected: false),
                      checkedBoxCard(
                          context: context,
                          text:
                              '${AppLocalizations.of(context).trans('thursday')}',
                          isSelected: false),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Row(
                          children: [
                            Text(
                              '${AppLocalizations.of(context).trans('reservation_type')}',
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          ],
                        ),
                      ),
                      radioTileCard(
                        context: context,
                        index: 1,
                        titleKey: 'individually',
                      ),
                      radioTileCard(
                        context: context,
                        index: 2,
                        titleKey: 'collective',
                      ),
                      if (radioTileCardResult == 2)
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '${AppLocalizations.of(context).trans('number_of_people')}',
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              defaultFormField(
                                  controller: numOfPeopleController,
                                  type: TextInputType.number,
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return '${AppLocalizations.of(context).trans('invalid_num')}';
                                    }
                                    return null;
                                  },
                                  onChange: (String val) {
                                    setState(() {});
                                  }),
                            ],
                          ),
                        ),
                      Container(
                        width: media.width,
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            defaultButton(
                                function: enableNextButton == true
                                    ? () {
                                        navigateTo(context,
                                            ReservationScreenStepThree());
                                      }
                                    : null,
                                width: media.width * 0.6,
                                radius: 28,
                                background: enableNextButton == true
                                    ? defaultColor
                                    : Color(0xFFf3db7c),
                                text:
                                    '${AppLocalizations.of(context).trans('next')}')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class ReservationScreenStepThree extends StatefulWidget {
  @override
  _ReservationScreenStepThreeState createState() =>
      _ReservationScreenStepThreeState();
}

class _ReservationScreenStepThreeState
    extends State<ReservationScreenStepThree> {
  bool enableNextButton = true;
  int programTypeResult = 0;

  Widget showSubscriptionsCard({
    BuildContext context,
    int index,
    String titleKey,
    String prefixTitle,
    String postfixTitle,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.0),
      child: RadioListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
        activeColor: Theme.of(context).primaryColor,
        title: defaultSubtitleTextOne(
            context: context,
            text: '${AppLocalizations.of(context).trans(titleKey)}'),
        subtitle: Row(
          children: [
            Text(
              postfixTitle,
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
            defaultSubtitleTextTwo(
                context: context,
                text:
                    '  ${AppLocalizations.of(context).trans('instead_of')}  '),
            Text(
              prefixTitle,
              style: Theme.of(context).textTheme.headline4.copyWith(
                  decoration: TextDecoration.lineThrough, color: Colors.grey),
            ),
          ],
        ),
        value: index,
        groupValue: programTypeResult,
        onChanged: (value) {
          setState(() {
            print(value);
            programTypeResult = value;
          });
        }, //  <-- leading Checkbox
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            12.0,
          ),
          color: Colors.white,
          border: Border.all(color: Colors.grey[500])),
    );
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: defaultAppBar(context: context, titleKey: 'reservation'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Column(
            children: [
              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: defaultColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      )),
                  child: Center(
                      child: Text(
                    '3',
                    style: TextStyle(
                        fontFamily: 'CairoRegular',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )),
                ),
                title: Text(
                  '${AppLocalizations.of(context).trans('subscription_type')}',
                  style: Theme.of(context).textTheme.headline4,
                ),
                subtitle: Text(
                  '${AppLocalizations.of(context).trans('step3_of_4')}',
                  style: TextStyle(
                    fontFamily: 'CairoRegular',
                    fontSize: 14,
                    height: 1.2,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '${AppLocalizations.of(context).trans('subscription_type')}',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    showSubscriptionsCard(
                        context: context,
                        index: 1,
                        titleKey: 'by_share',
                        prefixTitle: '30 رس',
                        postfixTitle: '50 رس'),
                    showSubscriptionsCard(
                        context: context,
                        index: 2,
                        titleKey: 'Monthly',
                        prefixTitle: '90 رس',
                        postfixTitle: '120 رس'),
                    showSubscriptionsCard(
                        context: context,
                        index: 3,
                        titleKey: 'three_months',
                        prefixTitle: '100 رس',
                        postfixTitle: '150 رس'),
                  ],
                ),
              ),
              Container(
                width: media.width,
                height: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    defaultButton(
                        function: enableNextButton == true
                            ? () {
                                navigateTo(
                                    context, ReservationScreenStepFour());
                              }
                            : null,
                        width: media.width * 0.6,
                        radius: 28,
                        background: enableNextButton == true
                            ? defaultColor
                            : Color(0xFFf3db7c),
                        text: '${AppLocalizations.of(context).trans('next')}')
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReservationScreenStepFour extends StatefulWidget {
  @override
  _ReservationScreenStepFourState createState() =>
      _ReservationScreenStepFourState();
}

class _ReservationScreenStepFourState extends State<ReservationScreenStepFour> {
  bool enableNextButton = true;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: defaultAppBar(context: context, titleKey: 'reservation'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Column(
            children: [
              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: defaultColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      )),
                  child: Center(
                      child: Text(
                    '4',
                    style: TextStyle(
                        fontFamily: 'CairoRegular',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )),
                ),
                title: Text(
                  '${AppLocalizations.of(context).trans('subscription_type')}',
                  style: Theme.of(context).textTheme.headline4,
                ),
                subtitle: Text(
                  '${AppLocalizations.of(context).trans('step4_of_4')}',
                  style: TextStyle(
                    fontFamily: 'CairoRegular',
                    fontSize: 14,
                    height: 1.2,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                width: media.width,
                margin: const EdgeInsets.only(
                    bottom: 12.0, left: 10.0, right: 10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
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
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.network(
                              imgList[0],
                              fit: BoxFit.fill,
                              height: 88,
                              width: 90,
                            ),
                          ),
                          SizedBox(
                            width: 12.0,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'أنس حافظ',
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                defaultSubtitleTextTwo(
                                    context: context, text: 'مدرب كراتية'),
                                RatingBar.builder(
                                  initialRating: 4,
                                  minRating: 1,
                                  itemSize: 15,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 4,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 4.0),
                                  itemBuilder: (context, _) => ImageIcon(
                                    AssetImage('images/star.png'),
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey[700],
                      height: 2.9,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 5.0, bottom: 12.0, right: 12.0, left: 12.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                '${AppLocalizations.of(context).trans('address')}',
                                style: Theme.of(context).textTheme.headline3,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: media.width,
                            child: Text('الرياض - جدة',
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
                          Divider(
                            color: Colors.grey[700],
                            height: 2.9,
                          ),
                          Row(
                            children: [
                              Text(
                                '${AppLocalizations.of(context).trans('training_days')}',
                                style: Theme.of(context).textTheme.headline3,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: media.width,
                            child: Text(
                              'السبت الأحد الأربعاء',
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
                            height: 2.0,
                          ),
                          Divider(
                            color: Colors.grey[700],
                            height: 2.9,
                          ),
                          Row(
                            children: [
                              Text(
                                '${AppLocalizations.of(context).trans('reservation_type')}',
                                style: Theme.of(context).textTheme.headline3,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: media.width,
                            child: Text(
                              'جماعى - 3',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: 'CairoRegular',
                                fontSize: 14,
                                color: Colors.grey[800],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey[700],
                            height: 2.9,
                          ),
                          Row(
                            children: [
                              Text(
                                '${AppLocalizations.of(context).trans('subscription_type')}',
                                style: Theme.of(context).textTheme.headline3,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: media.width,
                            child: Text(
                              'شهرى 100 ر.س',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: 'CairoRegular',
                                fontSize: 14,
                                color: Colors.grey[800],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey[700],
                            height: 2.9,
                          ),
                        ],
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '${AppLocalizations.of(context).trans('total')}',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        Container(
                          width: media.width * 0.35,
//                          height: 60.0,
                          margin: const EdgeInsets.symmetric(vertical: 14.0),
                          child: MaterialButton(
                            onPressed: null,
                            child: Text(
                              '250 ر.س',
                              style: TextStyle(
                                fontFamily: 'CairoRegular',
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              22.0,
                            ),
                            color: Theme.of(context).accentColor,
                          ),
                        )
                      ],
                    ),

                  ],
                ),
              ),
              Container(
                width: media.width,
                height: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    defaultButton(
                        function: enableNextButton == true
                            ? () {
                                navigateTo(
                                    context, ReservationScreenStepFive());
                              }
                            : null,
                        width: media.width * 0.6,
                        radius: 28,
                        background: enableNextButton == true
                            ? defaultColor
                            : Color(0xFFf3db7c),
                        text: '${AppLocalizations.of(context).trans('next')}')
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReservationScreenStepFive extends StatefulWidget {
  @override
  _ReservationScreenStepFiveState createState() =>
      _ReservationScreenStepFiveState();
}

class _ReservationScreenStepFiveState extends State<ReservationScreenStepFive> {
  int radioTilePaymentResult = 0;

  Widget radioTileCard(
      {BuildContext context,
      int index,
      String titleKey,
      bool isTextNotTitleKey = false,
      String imgUrl}) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.0),
      width: 330,
      height: 55.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(11.0),
          ),
          border: Border.all(color: Colors.grey)),
      child: SizedBox(
        child: RadioListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
          activeColor: Theme.of(context).primaryColor,
          title: Row(
            children: [
              Image.asset(
                imgUrl ?? 'images/insta.png',
                height: 35,
                width: 80,
              ),
              defaultSubtitleTextOne(
                  context: context,
                  text: isTextNotTitleKey
                      ? titleKey
                      : '${AppLocalizations.of(context).trans(titleKey)}'),
            ],
          ),

          value: index,
          groupValue: radioTilePaymentResult,
          onChanged: (value) {
            setState(() {
              print(value);
              radioTilePaymentResult = value;
            });
          }, //  <-- leading Checkbox
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
        appBar: defaultAppBar(context: context, titleKey: 'reservation'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Column(
              children: [
                ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: defaultColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        )),
                    child: Center(
                        child: Text(
                      '4',
                      style: TextStyle(
                          fontFamily: 'CairoRegular',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )),
                  ),
                  title: Text(
                    '${AppLocalizations.of(context).trans('payment_methods')}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  subtitle: Text(
                    '${AppLocalizations.of(context).trans('step4_of_4')}',
                    style: TextStyle(
                      fontFamily: 'CairoRegular',
                      fontSize: 14,
                      height: 1.2,
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Column(
                  children: [
                    radioTileCard(
                      context: context,
                      index: 1,
                      titleKey: 'visa',
                    ),
                    radioTileCard(
                        context: context,
                        index: 2,
                        titleKey: 'STC Pay',
                        isTextNotTitleKey: true),
                    radioTileCard(
                      context: context,
                      index: 3,
                      titleKey: 'mada',
                    ),
                    radioTileCard(
                        context: context,
                        index: 4,
                        titleKey: 'American Express',
                        isTextNotTitleKey: true),
                  ],
                ),
                Container(
                  width: media.width,
                  height: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      defaultButton(
                          function: () {},
                          width: media.width * 0.6,
                          radius: 28,
                          background: defaultColor,
                          text:
                              '${AppLocalizations.of(context).trans('payment')}')
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
