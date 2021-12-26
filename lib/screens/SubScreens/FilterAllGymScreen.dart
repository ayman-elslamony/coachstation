import 'package:coachstation/Helper/components.dart';
import 'package:coachstation/Localization/app_localizations.dart';
import 'package:flutter/material.dart';

class FilterAllGymScreen extends StatefulWidget {
  @override
  _FilterAllGymScreenState createState() => _FilterAllGymScreenState();
}

class _FilterAllGymScreenState extends State<FilterAllGymScreen> {
  bool removeDividerOfSpecialist = true;
  bool removeDividerOfNatinality = true;
  bool removeDividerOfRegion = true;
  bool removeDividerOfRating = true;

  Widget checkedBoxCard(
      {BuildContext context, String text, bool isSelected = false}) {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25, top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(11.0),
          ),
          border: Border.all(color: Colors.grey)),
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
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        iconColor: Color(0xFF142c43),
                        backgroundColor: Colors.white,
                        collapsedIconColor: Color(0xFF142c43),
                        collapsedBackgroundColor: Colors.white,
                        initiallyExpanded: true,
                        onExpansionChanged: (_) {
                          setState(() {
                            removeDividerOfSpecialist =
                                !removeDividerOfSpecialist;
                          });
                        },
                        children: <Widget>[
                          checkedBoxCard(
                              context: context, text: 'جدة', isSelected: true),
                          checkedBoxCard(
                              context: context,
                              text: 'الرياض',
                              isSelected: false),
                          checkedBoxCard(
                              context: context,
                              text: 'الدمام',
                              isSelected: false),
                          checkedBoxCard(
                              context: context, text: 'تبوك', isSelected: false),
                        ]),
                    removeDividerOfSpecialist == false
                        ? SizedBox()
                        : Divider(
                            color: Colors.grey,
                          ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: ExpansionTile(
                          title: new Text(
                            '${AppLocalizations.of(context).trans('reviews')}',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          iconColor: Color(0xFF142c43),
                          backgroundColor: Colors.white,
                          collapsedIconColor: Color(0xFF142c43),
                          collapsedBackgroundColor: Colors.white,
                          onExpansionChanged: (_) {
                            setState(() {
                              removeDividerOfRating = !removeDividerOfRating;
                            });
                          },
                          children: <Widget>[
                            checkedBoxCard(
                                context: context,
                                text: 'افضل تقييم',
                                isSelected: false),
                            SizedBox(height: 15.0,)
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
                      background: Colors.grey,
                      text:
                      '${AppLocalizations.of(context).trans('reset')}')
                ],
              ),
            ),
          ],
        ));
  }
}
