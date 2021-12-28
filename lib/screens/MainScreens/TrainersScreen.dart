import 'package:coachstation/Helper/components.dart';
import 'package:coachstation/Localization/app_localizations.dart';
import 'package:coachstation/provider/changeIndexPage.dart';
import 'package:coachstation/screens/SubScreens/TrainerProfileScreen.dart';
import 'package:coachstation/screens/SubScreens/filterTrainerScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TrainersScreen extends StatefulWidget {
  @override
  _TrainersScreenState createState() => _TrainersScreenState();
}

class _TrainersScreenState extends State<TrainersScreen> {
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
      child: Consumer<ChangeIndex>(
          builder: (context, changeIndex, child) =>
          Scaffold(
            appBar: defaultAppBar(
                context: context, titleKey: 'trainer',
                onClickedBackButton: (){
                  changeIndex.changeIndexFunction(0);
                },
                actions: [
                  IconButton(
                      onPressed: () {
                        navigateTo(context, FilterTrainerScreen());
                      }, icon: Icon(Icons.edgesensor_high_outlined)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                ]),
          body: SizedBox(
            height: media.height,
            width: media.width,
            child: ListView.builder(
              itemBuilder: (context, index) => defaultTrainerCard(
                onTap: (){
                  navigateTo(context, TrainerProfileScreen());
                },
                context: context
              ),
              itemCount: 9,
            ),
          ),
        ),
      ),);
  }
}
