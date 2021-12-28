import 'package:coachstation/Helper/components.dart';
import 'package:coachstation/screens/SubScreens/TrainerProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ChooseTheCoachScreen extends StatefulWidget {
  @override
  _ChooseTheCoachScreenState createState() => _ChooseTheCoachScreenState();
}

class _ChooseTheCoachScreenState extends State<ChooseTheCoachScreen> {
  RefreshController _refreshController =
  RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // _locale = Provider.of<LocaleProvider>(context, listen: false).locale;
    // Provider.of<HomeProvider>(context,listen: false).clearTopOffers();
    // Provider.of<HomeProvider>(context,listen: false).clearLatestProducts();
    // Provider.of<HomeProvider>(context,listen: false).clearMaxSelling();
    // Provider.of<HomeProvider>(context,listen: false).getTopOffers(context: context,locale: _locale).then((_) {
    //   _topOffers = Provider.of<HomeProvider>(context,listen: false).topOffers;
    //   debugPrint(_topOffers.toString());
    // });
    // Provider.of<HomeProvider>(context,listen: false).getLatestProducts(context: context,locale: _locale).then((_) {
    //   _latestProducts = Provider.of<HomeProvider>(context,listen: false).latestProducts;
    //   debugPrint(_latestProducts.toString());
    // });
    // Provider.of<HomeProvider>(context,listen: false).getMaxSellingProducts(context: context,locale: _locale).then((_) {
    //   _maxSellingProducts = Provider.of<HomeProvider>(context,listen: false).latestProducts;
    //   debugPrint(_maxSellingProducts.toString());
    // });

    _refreshController.refreshCompleted();
  }



  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return SmartRefresher(
      enablePullDown: true,
      controller: _refreshController,
      onRefresh: _onRefresh,
      child:  Scaffold(
        appBar: defaultAppBar(
            context: context, titleKey: 'choose_the_coach',
            onClickedBackButton: (){
              Navigator.of(context).pop(true);
            },
            ),
        body: SizedBox(
          height: media.height,
          width: media.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
                  child: defaultFormField(
                      onTap: (){
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
                      prefix:Icons.search
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView.builder(
                    itemBuilder: (context, index) => defaultTrainerCard(
                        onTap: (){
                          navigateTo(context, TrainerProfileScreen());
                        },
                        context: context
                    ),
                    itemCount: 9,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),);
  }
}
