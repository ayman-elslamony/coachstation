import 'package:coachstation/Helper/components.dart';
import 'package:coachstation/Localization/app_localizations.dart';
import 'package:flutter/material.dart';

class ChangeLanguageScreen extends StatefulWidget {
  @override
  _ChangeLanguageScreenState createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  List<int> listVal =[0,1];
  int val = 0;
  Widget checkedBoxCard(
      {BuildContext context, String text, int index}) {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25, top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(11.0),
          ),
          border: Border.all(color: Colors.grey)),
      child: RadioListTile(
        contentPadding: EdgeInsets.all(2.0),
        activeColor: Theme.of(context).primaryColor,
        title: defaultSubtitleTextOne(context: context, text: text),
        value: index,
        groupValue: val,
        onChanged: (value) {
          setState(() {
            print(value);
            val = value;
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
                  size: 23,
                )),
            title: Text(
              '${AppLocalizations.of(context).trans('language')}',
            ),
          ),
          SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0,horizontal: 15.0),
                child: Column(
                  children: [
                    SizedBox(height: 20.0,),
                    Image.asset(
                      'images/language.png',
                      color: Theme.of(context).primaryColor,
                      fit: BoxFit.fill,
                      height: 120,
                      width: 110,
                    ),
                    SizedBox(height: 80.0,),
                    checkedBoxCard(
                        context: context,
                        text: 'English',
                       index: listVal[0]
                    ),
                    SizedBox(height: 8.0,),
                    checkedBoxCard(
                      context: context,
                      text: 'عربى',
                        index: listVal[1]
                    ),

                  ],
                ),
              )),
        ],
      ),
    );
  }
}
