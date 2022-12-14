import 'package:carousel_slider/carousel_slider.dart';
import 'package:coachstation/Helper/components.dart';
import 'package:coachstation/Localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'InfoAboutTheTrainer.dart';
import 'TrainerProfileScreen.dart';
import 'TrainingPlaces.dart';

class ShowPresentDetailsScreen extends StatefulWidget {
  @override
  _ShowPresentDetailsScreenState createState() => _ShowPresentDetailsScreenState();
}

class _ShowPresentDetailsScreenState extends State<ShowPresentDetailsScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  Widget socialMediaWidget({String urlImg, Function function,bool enableColor=false}) {
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
              color: enableColor==true?defaultColor:null,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Scaffold(
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
              size: 18,
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
                              color: ( Theme.of(context).accentColor)
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
                              'Gold Gym',
                              style: Theme.of(context).textTheme.headline3,
                            ),
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
                              ],
                            )
                          ],
                        ),
                      ),
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
                          function: () {}, urlImg: 'images/call.png',enableColor: true),
                      socialMediaWidget(
                          function: () {}, urlImg: 'images/whatapp.png'),
                      socialMediaWidget(
                          function: () {}, urlImg: 'images/snap.png'),
                      socialMediaWidget(
                          function: () {}, urlImg: 'images/tiktok.png'),
                    ],
                  ),
                ],
              ),
            ),
            myDivider(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8.0),
                  child: Text(
                    '${AppLocalizations.of(context).trans('address')}',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
              ],
            ),
      InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 8.0, right: 8.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(11.0)),
                  border: Border.all(color: Colors.grey[300])),
              child: Column(
                children: [
                  SizedBox(
                    width: media.width,
                    child: Text(
                      ' ?????? ???? ?????????? ?????? ???????? ???? ???????? ???????? ????????????  ?????? ???? ?????????? ?????? ???????? ???? ???????? ???????? ????????????  ?????? ???? ?????????? ?????? ???????? ???? ???????? ???????? ????????????  ?????? ???? ?????????? ?????? ???????? ???? ???????? ???????? ????????????',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: 'CairoRegular',
                        fontSize: 13,
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Spacer(),
                      defaultLocationWithIcon(
                          context: context, textLocation: '????????????'),
                    ],
                  )
                ],
              ),
            ),
          )),
            SizedBox(height: 30,),
            defaultButton(
                function:() {},
                text: '${AppLocalizations.of(context).trans('get_the_present')}',
                radius: 20,
                width: media.width * 0.6),
            SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}

