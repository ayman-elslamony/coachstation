import 'package:coachstation/Helper/components.dart';
import 'package:coachstation/Localization/app_localizations.dart';
import 'package:flutter/material.dart';

class FilterAllGymScreen extends StatefulWidget {
  @override
  _FilterAllGymScreenState createState() => _FilterAllGymScreenState();
}

class _FilterAllGymScreenState extends State<FilterAllGymScreen> {

  Widget checkedBoxCard(
      {BuildContext context, String text, bool isSelected = false}) {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25, top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(11.0),
          ),
          border: Border.all(color: Colors.grey[300])),
      child: Theme(
        data: ThemeData(unselectedWidgetColor: Colors.grey[300]),
        child: RadioListTile(
          groupValue: true,
          contentPadding: EdgeInsets.all(2.0),
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
        appBar: defaultAppBar(context: context, titleKey: 'filter'),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SingleChildScrollView(
              child: SizedBox(
                width: media.width,
                height: media.height,
                child: Column(
                  children: [
                    ExpansionTile(
                        title: new Text(
                          '${AppLocalizations.of(context).trans('regions')}',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        iconColor: Color(0xFF142c43),
                        backgroundColor: Colors.white,
                        collapsedIconColor: Color(0xFF142c43),
                        collapsedBackgroundColor: Colors.white,
                        initiallyExpanded: true,

                        children: <Widget>[
                          checkedBoxCard(
                              context: context, text: '??????', isSelected: true),
                          checkedBoxCard(
                              context: context,
                              text: '????????????',
                              isSelected: false),
                          checkedBoxCard(
                              context: context,
                              text: '????????????',
                              isSelected: false),
                          checkedBoxCard(
                              context: context, text: '????????', isSelected: false),
                          SizedBox(height: 12.0,),
                        ]),

                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: ExpansionTile(
                          title: new Text(
                            '${AppLocalizations.of(context).trans('reviews')}',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          iconColor: Color(0xFF142c43),
                          backgroundColor: Colors.white,
                          collapsedIconColor: Color(0xFF142c43),
                          collapsedBackgroundColor: Colors.white,

                          children: <Widget>[
                            checkedBoxCard(
                                context: context,
                                text: '???????? ??????????',
                                isSelected: false),
                            SizedBox(height: 12.0,),
                          ]),
                    ),

                  ],
                ),
              ),
            ),
            Container(
              width: media.width,
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  defaultButton(
                      function: () {},
                      text:
                      '${AppLocalizations.of(context).trans('done')}',
                      width: media.width * 0.4),
                  defaultButton(
                      function: () {},
                      width: media.width * 0.4,
                      background: Colors.grey[300],
                      text:
                      '${AppLocalizations.of(context).trans('reset')}')
                ],
              ),
            ),
          ],
        ));
  }
}
