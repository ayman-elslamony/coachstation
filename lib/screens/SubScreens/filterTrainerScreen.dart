import 'package:coachstation/Helper/components.dart';
import 'package:coachstation/Localization/app_localizations.dart';
import 'package:flutter/material.dart';

class FilterTrainerScreen extends StatefulWidget {
  @override
  _FilterTrainerScreenState createState() => _FilterTrainerScreenState();
}

class _FilterTrainerScreenState extends State<FilterTrainerScreen> {
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
      child: CheckboxListTile(
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
      body: CustomScrollView(
//        physics: const BouncingScrollPhysics(),
        slivers: [
          defaultAppBar(context: context, titleKey: 'filter'),
          SliverToBoxAdapter(
            child: Column(
              children: [
                ExpansionTile(
                    title: new Text(
                      '${AppLocalizations.of(context).trans('specialist')}',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    iconColor: Color(0xFF142c43),
                    backgroundColor: Colors.white,
                    collapsedIconColor: Color(0xFF142c43),
                    collapsedBackgroundColor: Colors.white,
                    initiallyExpanded: true,
                    onExpansionChanged: (_) {
                      setState(() {
                        removeDividerOfSpecialist = !removeDividerOfSpecialist;
                      });
                    },
                    children: <Widget>[
                      checkedBoxCard(
                          context: context,
                          text: 'لياقة وعلاج طبيعى',
                          isSelected: true),
                      checkedBoxCard(
                          context: context, text: 'كراتية', isSelected: true),
                      checkedBoxCard(
                          context: context,
                          text: 'تأهيل عسكرى',
                          isSelected: true),
                      checkedBoxCard(
                          context: context, text: 'كرة قدم', isSelected: false),
                    ]),
                removeDividerOfSpecialist == false
                    ? SizedBox()
                    : Divider(
                        color: Colors.grey,
                      ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                  ),
                  child: ExpansionTile(
                      title: new Text(
                        '${AppLocalizations.of(context).trans('national')}',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      iconColor: Color(0xFF142c43),
                      backgroundColor: Colors.white,
                      collapsedIconColor: Color(0xFF142c43),
                      collapsedBackgroundColor: Colors.white,
                      onExpansionChanged: (_) {
                        setState(() {
                          removeDividerOfNatinality =
                              !removeDividerOfNatinality;
                        });
                      },
                      children: <Widget>[
                        checkedBoxCard(
                            context: context, text: 'أنثى', isSelected: false),
                        checkedBoxCard(
                            context: context, text: 'ذكر', isSelected: true),
                      ]),
                ),
                removeDividerOfNatinality == false
                    ? SizedBox()
                    : Divider(
                        color: Colors.grey,
                      ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                  ),
                  child: ExpansionTile(
                      title: new Text(
                        '${AppLocalizations.of(context).trans('regions')}',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      iconColor: Color(0xFF142c43),
                      backgroundColor: Colors.white,
                      collapsedIconColor: Color(0xFF142c43),
                      collapsedBackgroundColor: Colors.white,
                      onExpansionChanged: (_) {
                        setState(() {
                          removeDividerOfRegion = !removeDividerOfRegion;
                        });
                      },
                      children: <Widget>[]),
                ),
                removeDividerOfRegion == false
                    ? SizedBox()
                    : Divider(
                        color: Colors.grey,
                      ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                  ),
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
                            text: 'كرة قدم',
                            isSelected: false),
                      ]),
                ),
                removeDividerOfRating == false
                    ? SizedBox()
                    : Divider(
                        color: Colors.grey,
                      ),
                SizedBox(
                  width: media.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      defaultButton(
                          function: () {},
                          text: '${AppLocalizations.of(context).trans('done')}',
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
                SizedBox(height: 30,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
