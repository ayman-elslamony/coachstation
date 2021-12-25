import 'package:carousel_slider/carousel_slider.dart';
import 'package:coachstation/Helper/components.dart';
import 'package:coachstation/Localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'InfoAboutTheTrainer.dart';
import 'TrainingPlaces.dart';

class TrainerProfileScreen extends StatefulWidget {
  @override
  _TrainerProfileScreenState createState() => _TrainerProfileScreenState();
}

class _TrainerProfileScreenState extends State<TrainerProfileScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<String> imgList = [
    'https://thumbs.dreamstime.com/t/gym-24699087.jpg',
    'https://media.istockphoto.com/photos/empty-gym-picture-id1132006407?k=20&m=1132006407&s=612x612&w=0&h=Z7nJu8jntywb9jOhvjlCS7lijbU4_hwHcxoVkxv77sg=',
    'https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX26664924.jpg',
    'https://media.istockphoto.com/photos/muscular-trainer-writing-on-clipboard-picture-id675179390?k=20&m=675179390&s=612x612&w=0&h=7LP7-OamGu-b8XG-VKcJuamK5s80ke-4oJ5siUrjFVA=',
    'https://www.muscleandfitness.com/wp-content/uploads/2019/11/Young-Muscular-Man-Doing-Lunges-In-Dark-Gym.jpg?w=1109&h=614&crop=1&quality=86&strip=all',
    'https://www.giggsmeat.com/wp-content/uploads/2020/10/4wqKj5zM2a-min.jpg'
  ];

  Widget socialMediaWidget({String urlImg, Function function}) {
    return InkWell(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
        child: CircleAvatar(
          radius: 20,
          child: ClipOval(
            child: Image.asset(
              urlImg,
              fit: BoxFit.cover,
              width: 50,
              height: 50,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const ImageIcon(
                AssetImage(
                  'images/arrowLeft.png',
                ),
                color: Colors.black87,
                size: 23,
              )),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  children: [
                    CarouselSlider(
                      carouselController: _controller,
                      items: imgList
                          .map((item) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    child: Image.network(item,
                                        fit: BoxFit.cover, width: 1000.0)),
                              ))
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
                    SizedBox(
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
                                color: (Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : Colors.black)
                                    .withOpacity(
                                        _current == entry.key ? 0.9 : 0.4)),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'أنس حافظ',
                                style: Theme.of(context).textTheme.headline3,
                              ),
                              defaultSubtitleTextTwo(
                                  context: context, text: 'مدرب كراتية'),
                              Row(
                                children: [
                                  RatingBar.builder(
                                    initialRating: 4,
                                    minRating: 1,
                                    itemSize: 15,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 4,
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 4.0),
                                    itemBuilder: (context, _) => ImageIcon(
                                      AssetImage('images/star.png'),
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                  Spacer(),
                                  ImageIcon(
                                    AssetImage('images/locationMark.png'),
                                    size: 15,
                                    color: Colors.red,
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Expanded(
                                      child: defaultSubtitleTextTwo(
                                          context: context, text: 'الرياض')),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 70,
                          height: 38.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              12.0,
                            ),
                            color: Colors.grey[300],
                          ),
                          child: Icon(
                            Icons.favorite_border,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    myDivider(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        socialMediaWidget(
                            function: () {}, urlImg: 'images/tiktok.png'),
                        socialMediaWidget(
                            function: () {}, urlImg: 'images/insta.png'),
                        socialMediaWidget(
                            function: () {}, urlImg: 'images/snap.png'),
                        socialMediaWidget(
                            function: () {}, urlImg: 'images/whatapp.png'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
                child: AppBar(
                  bottom: TabBar(
                    labelColor: Theme.of(context).primaryColor,
                    labelStyle: Theme.of(context).textTheme.headline3,
                    indicatorColor: Theme.of(context).primaryColor,
                    unselectedLabelColor: Colors.grey,
                    unselectedLabelStyle: Theme.of(context).textTheme.headline3,
//                    labelColor: Theme.of(context).primaryColor,
                    tabs: [
                      Tab(
                        text:
                            '${AppLocalizations.of(context).trans('about_the_coach')}',
                      ),
                      Tab(
                        text:
                            '${AppLocalizations.of(context).trans('training_places')}',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: media.width,
                height: media.height,
                child: TabBarView(
                  children: [
                    InfoAboutTheTrainer(),
                    TrainingPlaces(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
