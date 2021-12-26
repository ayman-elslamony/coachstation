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

  Widget trainerCard() {
    return InkWell(
      onTap: (){
        navigateTo(context, TrainerProfileScreen());
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0,left: 8.0,right: 8.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(11.0)),
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'النادى الرياضى',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    defaultSubtitleTextTwo(
                        context: context, text: 'المدرب محمد سيد'),
                    Row(
                      children: [
                        RatingBar.builder(
                          initialRating: 4,
                          minRating: 1,
                          itemSize: 15,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 4,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => ImageIcon(
                            AssetImage('images/star.png'),
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        Spacer(),
                        defaultLocationWithIcon(
                          context: context,
                          textLocation: 'الرياض'
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
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
              itemBuilder: (context, index) => trainerCard(),
              itemCount: 9,
            ),
          ),
        ),
      ),);
  }
}
