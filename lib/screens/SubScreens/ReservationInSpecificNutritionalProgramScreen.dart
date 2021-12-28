import 'package:coachstation/Helper/components.dart';
import 'package:coachstation/Localization/app_localizations.dart';
import 'package:flutter/material.dart';

class ReservationInSpecificNutritionalProgramScreen extends StatefulWidget {
  @override
  _ReservationInSpecificNutritionalProgramScreenState createState() =>
      _ReservationInSpecificNutritionalProgramScreenState();
}

class _ReservationInSpecificNutritionalProgramScreenState
    extends State<ReservationInSpecificNutritionalProgramScreen> {
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
                      '1',
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
                    '${AppLocalizations.of(context).trans('step1_of_2')}',
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
                                imgList[5],
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
                                    'برنامج رقم 1',
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                  defaultSubtitleTextTwo(
                                      context: context, text: 'مكثف'),
                                  defaultSubtitleTextTwo(
                                      context: context, text: '4 أسابيع'),
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
                      Text(
                        '${AppLocalizations.of(context).trans('total')}',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Container(
                        width: media.width * 0.5,
                        height: 60.0,
                        margin: const EdgeInsets.symmetric(vertical: 14.0),
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
                            navigateTo(context, ReservationScreenStepThree());
                          },
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
                          '2',
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
                    '${AppLocalizations.of(context).trans('step2_of_2')}',
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