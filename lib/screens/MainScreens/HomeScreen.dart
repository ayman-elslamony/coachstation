import 'package:carousel_slider/carousel_slider.dart';
import 'package:coachstation/Helper/components.dart';
import 'package:coachstation/Localization/app_localizations.dart';
import 'package:coachstation/screens/SubScreens/ShowAllArticlesScreen.dart';
import 'package:coachstation/screens/SubScreens/ShowAllGymsScreen.dart';
import 'package:coachstation/screens/SubScreens/ShowOneArticleScreen.dart';
import 'package:coachstation/screens/SubScreens/ShowSpecificGymScreen.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<String> gymList = [
    'https://thumbs.dreamstime.com/t/gym-24699087.jpg',
    'https://media.istockphoto.com/photos/empty-gym-picture-id1132006407?k=20&m=1132006407&s=612x612&w=0&h=Z7nJu8jntywb9jOhvjlCS7lijbU4_hwHcxoVkxv77sg=',
    'https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX26664924.jpg',
  ];
  final List<String> discoverList = [
    'https://media.istockphoto.com/photos/muscular-trainer-writing-on-clipboard-picture-id675179390?k=20&m=675179390&s=612x612&w=0&h=7LP7-OamGu-b8XG-VKcJuamK5s80ke-4oJ5siUrjFVA=',
    'https://www.muscleandfitness.com/wp-content/uploads/2019/11/Young-Muscular-Man-Doing-Lunges-In-Dark-Gym.jpg?w=1109&h=614&crop=1&quality=86&strip=all',
    'https://www.giggsmeat.com/wp-content/uploads/2020/10/4wqKj5zM2a-min.jpg',
  ];



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
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            elevation: 0.0,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            expandedHeight: 60,
            title: Image.asset("images/appBarIcon.png",height: 40,),
            centerTitle: true,
            actions: [],
            leading: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset("images/appBarMenuIcon.png",height: 10,),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                CarouselSlider(
                  carouselController: _controller,
                  items: imgList
                      .map((item) => ClipRRect(
                          borderRadius:
                              BorderRadius.all(Radius.circular(0.0)),
                          child: Image.network(item,
                              fit: BoxFit.cover, width: 1000.0)))
                      .toList(),
                  options: CarouselOptions(
                      height: 200,
                      viewportFraction: 1.0,
                      enlargeCenterPage: false,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(seconds: 1),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imgList.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: 12.0,
                        height: 12.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                (Theme.of(context).brightness == Brightness.dark
                                        ? Colors.white
                                        : Theme.of(context).accentColor)
                                    .withOpacity(
                                        _current == entry.key ? 0.9 : 0.4)),
                      ),
                    );
                  }).toList(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            '${AppLocalizations.of(context).trans('next_exercise_date')}',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ],
                      ),
                      Container(
                        padding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                                  color: Theme.of(context).primaryColor),
                              child: Column(
                                children: [
                                  Text(
                                    'الإثنين',
                                    style:
                                    Theme.of(context).textTheme.headline3,
                                  ),
                                  defaultSubtitleTextTwo(
                                      context: context, text: '5 اكتوبر')
                                ],
                              ),
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
                                    style:
                                    Theme.of(context).textTheme.headline3,
                                  ),
                                  defaultSubtitleTextTwo(
                                      context: context,
                                      text: 'المدرب محمد سيد'),
                                  defaultShowTime(
                                    context: context,
                                    textTime: '30 10 ص'
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '${AppLocalizations.of(context).trans('discover')}',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: media.height * 0.15,
                        child: ListView.builder(
                          itemBuilder: (context, index) => defaultCard(
                              function: () {},
                              context: context,
                              textTitle:
                              '${AppLocalizations.of(context).trans('discover')}',
                              imageUrl: discoverList[index],
                              cardWidth: media.width * 0.35,
                              containerTextWidth: media.width * 0.25,
                              cardHeight: 100),
                          itemCount: discoverList.length,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      subtitleOfHomeScreen(
                          function: () {
                            navigateTo(context, ShowAllGymsScreen());
                          }, context: context, textKey: 'gyms'),
                      SizedBox(
                        width: media.width,
                        height: media.height * 0.15,
                        child: ListView.builder(
                          itemBuilder: (context, index) => defaultCard(
                              function: () {
                                navigateTo(context, ShowSpecificGymScreen());
                              },
                              context: context,
                              textTitle:
                              '${AppLocalizations.of(context).trans('gyms')}',
                              imageUrl: gymList[index],
                              cardWidth: media.width * 0.4,
                              containerTextWidth: media.width * 0.32,
                              cardHeight: 100),
                          itemCount: gymList.length,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      subtitleOfHomeScreen(
                          function: () {
                            navigateTo(context, ShowAllArticlesScreen());
                          },
                          context: context,
                          textKey: 'articles'),
                      SizedBox(
                        width: media.width,
                        height: media.height * 0.23,
                        child: ListView.builder(
                          itemBuilder: (context, index) => defaultArticle(
                              function: () {
                                navigateTo(context, ShowOneArticleScreen());
                              },
                              context: context,
                              textSubTitle:
                              'لقم تم توليد هذا النص من مولد النص العربى',
                              textTitle:
                              '${AppLocalizations.of(context).trans('gyms')}',
                              imageUrl: imgList[0],
                              articleWidth: media.width * 0.4,
                              imageHeight: media.height * 0.11,
                              articleHeight: media.height * 0.22),
                          itemCount: imgList.length,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      SizedBox(height: 50,),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
