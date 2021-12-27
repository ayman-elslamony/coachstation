import 'package:coachstation/Helper/components.dart';
import 'package:coachstation/Localization/app_localizations.dart';
import 'package:flutter/material.dart';

class ReservationScreenStepOne extends StatefulWidget {
  @override
  _ReservationScreenStepOneState createState() =>
      _ReservationScreenStepOneState();
}

class _ReservationScreenStepOneState extends State<ReservationScreenStepOne> {
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
                    '${AppLocalizations.of(context).trans('step1_of_3')}',
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
                          '${AppLocalizations.of(context).trans('monday')}',
                          isSelected: false),
                      checkedBoxCard(
                          context: context,
                          text:
                          '${AppLocalizations.of(context).trans('wednesday')}',
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
                                function:
                                enableNextButton == true ? () {
                                  navigateTo(context, ReservationScreenStepTwo());
                                } : null,
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

class ReservationScreenStepTwo extends StatefulWidget {
  @override
  _ReservationScreenStepTwoState createState() =>
      _ReservationScreenStepTwoState();
}

class _ReservationScreenStepTwoState extends State<ReservationScreenStepTwo> {

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
                          '2',
                          style: TextStyle(
                              fontFamily: 'CairoRegular',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        )),
                  ),
                  title: Text(
                    '${AppLocalizations.of(context).trans('submit_reservation')}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  subtitle: Text(
                    '${AppLocalizations.of(context).trans('step2_of_3')}',
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
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'أنس حافظ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4,
                                  ),
                                  defaultSubtitleTextTwo(
                                      context: context,
                                      text: 'مدرب كراتية'),
                                  defaultLocationWithIcon(
                                      context: context,
                                      textLocation: 'الرياض'),
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
                            top: 5.0,
                            bottom: 12.0,
                            right: 12.0,
                            left: 12.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Gold Gym',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4,
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'الأحد',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3,
                                ),
                                defaultShowTime(
                                    context: context,
                                    textTime: '30 10 ص'),
                                defaultShowTime(
                                    context: context,
                                    textTime: '30 10 ص'),
                                SizedBox()
                              ],
                            ) ,
                            SizedBox(height: 2.0,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'الأحد',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3,
                                ),
                                defaultShowTime(
                                    context: context,
                                    textTime: '30 10 ص'),
                                defaultShowTime(
                                    context: context,
                                    textTime: '30 10 ص'),
                                SizedBox()
                              ],
                            )
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey[700],
                        height: 2.9,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8.0),
                        child: Row(
                          children: [
                            Text(
                              'جماعى -7 أفراد',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3,
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey[700],
                        height: 2.9,
                      ),
                      Text(
                        '${AppLocalizations.of(context).trans('total')}',
                        style: Theme.of(context)
                            .textTheme
                            .headline4,
                      ),
                      Container(
                        width: media.width*0.5,
                        height: 60.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 14.0),
                        child: MaterialButton(
                          onPressed: null,
                          child: Text(
                            '250 ر.س',
                            style: TextStyle(
                              fontFamily: 'CairoRegular',
                              color: Colors.white,
                              fontSize: 21,
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
                ),
                Container(
                  width: media.width,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      defaultButton(
                          function: () {
                            navigateTo(context,
                                ReservationScreenStepThree());
                          }
                              ,
                          width: media.width * 0.6,
                          radius: 28,
                          background: defaultColor,
                          text:
                          '${AppLocalizations.of(context).trans('submit')}')
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
  _ReservationScreenStepThreeState createState() => _ReservationScreenStepThreeState();
}

class _ReservationScreenStepThreeState extends State<ReservationScreenStepThree> {

  int radioTilePaymentResult = 0;
  Widget radioTileCard({BuildContext context, int index, String titleKey,bool isTextNotTitleKey=false,String imgUrl}) {
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
              Image.asset(imgUrl??'images/insta.png',height: 35,width: 80,),
              defaultSubtitleTextOne(
                  context: context,
                  text: isTextNotTitleKey?titleKey:'${AppLocalizations.of(context).trans(titleKey)}'),
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
                          '3',
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
                    '${AppLocalizations.of(context).trans('step3_of_3')}',
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
                      index:2,
                      titleKey: 'STC Pay',
                      isTextNotTitleKey:true
                    ),
                    radioTileCard(
                      context: context,
                      index: 3,
                      titleKey: 'mada',
                    )
                    ,radioTileCard(
                      context: context,
                      index: 4,
                      titleKey: 'American Express',
                        isTextNotTitleKey:true
                    ),
                  ],
                ),
                Container(
                  width: media.width,
                  height: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      defaultButton(
                          function: () {

                          }
                          ,
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
