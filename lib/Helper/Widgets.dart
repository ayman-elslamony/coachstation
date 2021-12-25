import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:groovin_widgets/groovin_widgets.dart';
import 'package:intl/intl.dart';
import 'package:coachstation/Localization/app_localizations.dart';
//import 'package:coachstation/models/HomeModel.dart';
//import 'package:coachstation/models/Product.dart';
//import 'package:coachstation/provider/CartProvider.dart';
//import 'package:coachstation/provider/ProductsProvider.dart';
//import 'package:coachstation/provider/VendorsProvider.dart';
import 'package:coachstation/provider/changeIndexPage.dart';
import 'package:coachstation/provider/locale_provider.dart';
//import 'package:coachstation/screens/MainScreens/MyOrders.dart';
//import 'package:coachstation/screens/MainScreens/NavigationHome.dart';

const TextStyle whiteCardTextStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'CairoBold',
  fontSize: 18,
);
const TextStyle rowTextStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'Net',
  fontSize: 12,
);
Widget submitButton(
        {Function onClicked,
        var height,
        String titleImgPath,
        String buttonTitle,
        var titleFontSize,
        double sidesPadding,
        @required double buttonW,
        var buttonColor,
        var titleColor,
        var borderColor,
        BuildContext context,
        double borderRadius}) =>
    Padding(
      padding: EdgeInsets.only(
          left: sidesPadding ?? 0.0, right: sidesPadding ?? 0.0, bottom: 5.0),
      child: GestureDetector(
        onTap: () {
          onClicked();
        },
        child: Container(
          height: height ?? 35.0,
          width: buttonW,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0.0),

            //elevation: 8.0,
            color: buttonColor ??
                Theme.of(context).iconTheme.color, // changed the color here
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 18.0,
              right: 18.0,
            ),
            // child: Padding(
            // padding: const EdgeInsets.symmetric(horizontal:18.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    buttonTitle,
                    style: TextStyle(
                        color: titleColor ?? Colors.white,
                        fontSize: titleFontSize ?? 17.0,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold),
                  ),
                  titleImgPath != null
                      ? const SizedBox(
                          width: 8.0,
                        )
                      : Container(),
                  titleImgPath != null
                      ? Image.asset(
                          titleImgPath,
                          height: 35,
                          width: 35.0,
                          color: titleColor ?? Colors.white,
                        )
                      : Container(),
                ],
              ),
            ),
          ),
          // )
        ),
      ),
    );

void showSnack({
  msg,
  BuildContext context,
  var scaffoldKey,
  fullHeight,
  marginBottom,
  isFloating = false,
  Color color,
}) {
  var _snackBar = SnackBar(
      behavior: isFloating ? SnackBarBehavior.floating : SnackBarBehavior.fixed,
      backgroundColor: color ?? const Color(0xffff1e1e).withOpacity(0.7),
      margin: EdgeInsets.fromLTRB(4, 0, 4, marginBottom ?? 5),
      content: SizedBox(
        height: fullHeight ?? 89,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
              "$msg",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontFamily: "DIN"),
              maxLines: null,
            )),
            fullHeight == null
                ? const SizedBox(
                    height: 60.0,
                  )
                : const SizedBox()
          ],
        ),
      ));

  scaffoldKey.currentState.showSnackBar(_snackBar);
}

Widget myExpansionTile(
    {double height,
    double width,
    String title,
    bool isExpanded,
    Function doExpansion,
    @required Widget expansionArrow,
    List<Widget> content,
    BuildContext context}) {
  return Container(
    height: isExpanded == true ? 38.0 : height,
    width: width,
    decoration: BoxDecoration(
        color: const Color(0xffF1F1F1),
        border: Border.all(color: const Color(0xffE8E5E5)),
        borderRadius: BorderRadius.circular(7)),
    child: GroovinExpansionTile(
      onExpansionChanged: doExpansion ?? (x) {},
      initiallyExpanded: isExpanded,
      title: Text(
        title,
        style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontFamily: "CairoBold",
            fontSize: 14.0),
      ),
      backgroundColor: const Color(0xffF1F1F1),
      trailing: expansionArrow ??
          const Icon(
            Icons.keyboard_arrow_down,
            size: 35.0,
            color: Color(0xff616161),
          ),
      children: content, //<Widget>[
      //Text('TEST',style: TextStyle(color: Colors.red),)
      //],
    ),
  );
}

Widget expansionTileCard(
    {itemHeight,
    itemWidth,
    String assetImageUrl,
    BuildContext ctx,
    String productTitle,
    String productPrice,
    String productOldPrice,
    String productCurrency,
    String quantity,
    bool isLast = false,
    BuildContext context,
    Function replace,
    bool isReplaceButtonVisible = true}) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            bottomLeft:
                isLast ? const Radius.circular(7) : const Radius.circular(0),
            bottomRight:
                isLast ? const Radius.circular(7) : const Radius.circular(0))),
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                  width: isLast ? 0 : 1,
                  color: isLast ? Colors.transparent : const Color(0xffE8E5E5)),
            ),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(0.0),
            leading: Image.network(
              "/storage/" + assetImageUrl,
              width: 59,
              height: 62,
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent loadingProgress) {
                if (loadingProgress == null) return child;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation(Theme.of(context).primaryColor),
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes
                        : null,
                  ),
                );
              },
            ),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text(
                productTitle,
                maxLines: null,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 12, color: Colors.black, fontFamily: 'CairoBold'),
              ),
            ),
            subtitle: Column(
              children: [
                Row(
                  children: <Widget>[
                    Text(
                      productPrice, // dummy data
                      style: const TextStyle(
                          fontSize: 14, color: Color(0xffDC0A0A)),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      productCurrency, // dummy data
                      style: TextStyle(
                          fontSize: 14, color: Theme.of(ctx).accentColor),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      productOldPrice, // dummy data
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[500],
                        decoration: productOldPrice != null
                            ? TextDecoration.lineThrough
                            : null,
                        decorationThickness: 1.0,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      productCurrency, // dummy data
                      style: TextStyle(
                          fontSize: 14, color: Theme.of(ctx).accentColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right:
              AppLocalizations.of(ctx).locale.languageCode == "en" ? 5 : null,
          left: AppLocalizations.of(ctx).locale.languageCode == "ar" ? 5 : null,
          bottom: 3.0,
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: const Color(0xffD9D9D9)),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 13.2, vertical: 2.0),
                  child: Text(
                    quantity,
                    style: TextStyle(color: Theme.of(ctx).accentColor),
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              isReplaceButtonVisible
                  ? InkWell(
                      onTap: replace,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(ctx).primaryColor,
                            border:
                                Border.all(color: Theme.of(ctx).primaryColor),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 13.2, vertical: 4.0),
                            child: Text(
                              AppLocalizations.of(context).trans('replace'),
                              style:
                                  // ignore: prefer_const_constructors
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ],
    ),
  );
}

showAlertDialog(BuildContext context,
    {Widget alertTitle, String content, onOk}) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text(
      AppLocalizations.of(context).trans("ok"),
      style: TextStyle(
          color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
    ),
    onPressed: onOk ??
        () {
          Navigator.pop(context);
        },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: alertTitle ?? const SizedBox(),
    content: Text(
      content,
      style: const TextStyle(fontSize: 16),
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

void showCustomDialog(context,
    {mainPhoto,
    isAccepting = false,
    secondBtn,
    firstBtn,
    onClicked,
    barrierDismissible = true,
    height,
    @required buttonW,
    buttonH,
    width,
    buttonText,
    title,
    subTitle,
    buttonColor,
    buttonBorderColor,
    buttonFontSize,
    secondButton}) {
  showGeneralDialog(
    barrierLabel: "Barrier",
    barrierDismissible: barrierDismissible,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 500),
    context: context,
    pageBuilder: (_, __, ___) {
      return StatefulBuilder(builder: (context, setState) {
        return Align(
          alignment: Alignment.center,
          child: Material(
            textStyle: const TextStyle(fontSize: 16, color: Colors.white),
            color: Colors.transparent,
            child: Container(
              // height: height??300,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Transform.scale(
                            scale: 1,
                            child:
                                mainPhoto ?? Image.asset('images/email.png'))),
                  ),
                  title != null
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            title,
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "CairoBold",
                                color: Colors.grey[900],
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      : const SizedBox(),
                  subTitle != null
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 40),
                          child: Text(subTitle,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "CairoBold",
                                  color: Colors.grey[700])),
                        )
                      : const SizedBox(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: secondBtn == null
                            ? MainAxisAlignment.center
                            : MainAxisAlignment.spaceAround,
                        children: [
                          isAccepting == true
                              ? Center(
                                  child: SpinKitCircle(
                                    color: Theme.of(context).backgroundColor,
                                    size: 30.0,
                                  ),
                                )
                              : firstBtn ??
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2),
                                    child: GestureDetector(
                                      onTap: onClicked ??
                                          () {
                                            // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Home()), (Route<dynamic> route) => false);
                                          },
                                      child: Container(
                                        height: buttonH ?? 40.0,
                                        width: buttonW,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          border: Border.all(
                                              color: buttonBorderColor ??
                                                  Theme.of(context)
                                                      .backgroundColor),
                                          //elevation: 8.0,
                                          color: buttonColor ??
                                              Theme.of(context)
                                                  .backgroundColor, // changed the color here
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 10.0,
                                            right: 10.0,
                                          ),
                                          // child: Padding(
                                          // padding: const EdgeInsets.symmetric(horizontal:18.0),
                                          child: Center(
                                            child: Text(
                                              buttonText ?? '',
                                              style: TextStyle(
                                                  fontSize: buttonFontSize,
                                                  fontFamily: 'CairoBold'),
                                            ),
                                          ),
                                        ),
                                        // )
                                      ),
                                    ),
                                  ),
                          secondButton ?? const SizedBox()
                        ],
                      ),
                    ),
                  )
                ],
              ),
              margin: const EdgeInsets.only(bottom: 50, left: 12, right: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        );
      });
    },
    transitionBuilder: (_, anim, __, child) {
      return SlideTransition(
        position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(anim),
        child: child,
      );
    },
  );
}

void showSoonCustomDialog(context,
    {mainPhoto,
    onClicked,
    barrierDismissible = true,
    height,
    @required buttonW,
    buttonH,
    width,
    buttonText,
    title,
    subTitle}) {
  showGeneralDialog(
    barrierLabel: "Barrier",
    barrierDismissible: barrierDismissible,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 500),
    context: context,
    pageBuilder: (_, __, ___) {
      return Align(
        alignment: Alignment.center,
        child: Material(
          textStyle: const TextStyle(fontSize: 16, color: Colors.white),
          color: Colors.transparent,
          child: Container(
            // height: height??300,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      height: 100,
                      width: 100,
                      child: Transform.scale(
                          scale: 1,
                          child: mainPhoto ?? Image.asset('images/email.png'))),
                ),
                title != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          title,
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: "CairoBold",
                              color: Colors.grey[900],
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    : const SizedBox(),
                subTitle != null
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(subTitle,
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: "CairoBold",
                                color: Colors.grey[700])),
                      )
                    : const SizedBox(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    child: GestureDetector(
                      // onTap:
                      //   onClicked??(){
                      //   // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Home()), (Route<dynamic> route) => false);
                      //   },
                      child: Container(
                        height: buttonH ?? 1.0,
                        width: buttonW,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: Colors.transparent),
                          //elevation: 8.0,
                          color: Colors.transparent, // changed the color here
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(
                            left: 10.0,
                            right: 10.0,
                          ),
                          // child: Padding(
                          // padding: const EdgeInsets.symmetric(horizontal:18.0),
                          child: Center(),
                        ),
                        // )
                      ),
                    ),
                  ),
                )
              ],
            ),
            margin: const EdgeInsets.only(bottom: 50, left: 12, right: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      return SlideTransition(
        position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(anim),
        child: child,
      );
    },
  );
}

void showSuccessCustomDialog(context,
    {mainPhoto,
    onClicked,
    barrierDismissible = true,
    height,
    @required buttonW,
    @required buttonH,
    width,
    buttonText,
    secondBtn,
    title,
    subTitle}) {
  showGeneralDialog(
    barrierLabel: "Barrier",
    barrierDismissible: barrierDismissible,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 500),
    context: context,
    pageBuilder: (_, __, ___) {
      return Align(
        alignment: Alignment.center,
        child: Material(
          textStyle: const TextStyle(fontSize: 16, color: Colors.white),
          color: Colors.transparent,
          child: Container(
            // height: height??300,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      height: 100,
                      width: 100,
                      child: Transform.scale(
                          scale: 1,
                          child:
                              mainPhoto ?? Image.asset("images/checked.png"))),
                ),
                title != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          title,
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: "CairoBold",
                              color: Colors.grey[900],
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    : const SizedBox(),
                subTitle != null
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(subTitle,
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: "CairoBold",
                                color: Colors.grey[700])),
                      )
                    : const SizedBox(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 0),
                        child: GestureDetector(
                          onTap: onClicked ??
                              () {
                                //   // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Home()), (Route<dynamic> route) => false);
                              },
                          child: Container(
                            height: buttonH,
                            width: buttonW,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(color: Colors.transparent),
                              //elevation: 8.0,
                              color: Theme.of(context)
                                  .backgroundColor, // changed the color here
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 10.0,
                                right: 10.0,
                              ),
                              // child: Padding(
                              // padding: const EdgeInsets.symmetric(horizontal:18.0),
                              child: Center(
                                child: Text(
                                  '$buttonText',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'CairoBold',
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            // )
                          ),
                        ),
                      ),
                      secondBtn ?? const SizedBox()
                    ],
                  ),
                )
              ],
            ),
            margin: const EdgeInsets.only(bottom: 50, left: 12, right: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      return SlideTransition(
        position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(anim),
        child: child,
      );
    },
  );
}

void showNotificationsCustomDialog(context,
    {mainPhoto,
    key,
    onClicked,
    barrierDismissible = true,
    height,
    @required buttonW,
    buttonH,
    width,
    buttonText,
    title,
    subTitle}) {
  showGeneralDialog(
    barrierLabel: "Barrier",
    barrierDismissible: barrierDismissible,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 500),
    context: context,
    pageBuilder: (_, __, ___) {
      Timer(const Duration(milliseconds: 4000), () async {
        Navigator.pop(context);
      });
      return SafeArea(
        child: Dismissible(
            onDismissed: (val) {
              Navigator.pop(context);
            },
            key: key,
            child: Align(
              alignment: Alignment.topCenter,
              child: Material(
                textStyle: const TextStyle(fontSize: 16, color: Colors.white),
                color: Colors.transparent,
                child: Container(
                  height: 60,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            height: 35,
                            width: 35,
                            child: Transform.scale(
                                scale: 1,
                                child: mainPhoto ??
                                    Image.asset('images/email.png'))),
                      ),
                      title != null
                          ? Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                title,
                                style: TextStyle(
                                    fontSize: 11,
                                    fontFamily: "CairoBold",
                                    color: Colors.grey[900],
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          : const SizedBox(),
                      subTitle != null
                          ? Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(subTitle,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "CairoBold",
                                      color: Colors.grey[700])),
                            )
                          : const SizedBox(),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0),
                          child: GestureDetector(
                            // onTap:
                            //   onClicked??(){
                            //   // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Home()), (Route<dynamic> route) => false);
                            //   },
                            child: Container(
                              height: buttonH ?? 1.0,
                              width: buttonW,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(color: Colors.transparent),
                                color: Colors
                                    .transparent, // changed the color here
                              ),
                              child: const Padding(
                                padding: EdgeInsets.only(
                                  left: 10.0,
                                  right: 10.0,
                                ),
                                child: Center(),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  margin:
                      const EdgeInsets.only(bottom: 50, left: 12, right: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            )),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      return SlideTransition(
        position: Tween(begin: const Offset(0, 0), end: const Offset(0, 0))
            .animate(anim),
        child: child,
      );
    },
  );
}

void showCustomConsulateDialog(context,
    {mainPhoto,
    barrierDismissible = true,
    onClicked,
    height,
    buttonW,
    buttonH,
    width,
    buttonText,
    onVipClick,
    content,
    onNormalClick}) {
  showGeneralDialog(
    barrierLabel: "Barrier",
    barrierDismissible: barrierDismissible,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 500),
    context: context,
    pageBuilder: (_, __, ___) {
      return Align(
        alignment: Alignment.center,
        child: Material(
          textStyle: const TextStyle(fontSize: 16, color: Colors.white),
          color: Colors.transparent,
          child: Container(
            height: height,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: content,
            margin: const EdgeInsets.only(bottom: 50, left: 12, right: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      return SlideTransition(
        position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(anim),
        child: child,
      );
    },
  );
}

showCustomBottomSheet({BuildContext context, screenMedia, content}) {
  showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(40.0))),
      isScrollControlled: true,
      backgroundColor: Colors.white,
      context: context,
      builder: (ctx) {
        return content;
      });
}

searchWithIcon() {
  return Container(
    alignment: Alignment.centerLeft,
    margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    height: 50,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: Colors.grey[400],
      ),
    ),
    child: const Icon(Icons.search),
  );
}

enum ErrorAnimationProp { offset }

// class ShakingErrorText extends StatelessWidget {
//   final ShakingErrorController controller;
//   final int timesToShake;
//   final MultiTween<ErrorAnimationProp> _tween;
//
//   ShakingErrorText({
//     this.controller,
//     this.timesToShake = 4,
//   }) : _tween = MultiTween<ErrorAnimationProp>() {
//     List.generate(
//         timesToShake,
//         (_) => _tween
//           ..add(ErrorAnimationProp.offset, Tween<double>(begin: 0, end: 10),
//               Duration(milliseconds: 100))
//           ..add(ErrorAnimationProp.offset, Tween<double>(begin: 10, end: -10),
//               Duration(milliseconds: 100))
//           ..add(ErrorAnimationProp.offset, Tween<double>(begin: -10, end: 0),
//               Duration(milliseconds: 100)));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<ShakingErrorController>.value(
//       value: controller,
//       child: Consumer<ShakingErrorController>(
//         builder: (context, errorController, child) {
//           return CustomAnimation<MultiTweenValues<ErrorAnimationProp>>(
//             control: errorController.controlSignal,
//             curve: Curves.easeOut,
//             duration: _tween.duration,
//             tween: _tween,
//             animationStatusListener: (status) {
//               if (status == AnimationStatus.forward) {
//                 controller.onAnimationStarted();
//               }
//             },
//             builder: (BuildContext context, Widget child, tweenValues) {
//               return Transform.translate(
//                 offset: const Offset(tweenValues.get(ErrorAnimationProp.offset), 0),
//                 child: child,
//               );
//             },
//             child: Visibility(
//               visible: controller.isVisible && controller.isMounted,
//               maintainSize: controller.isMounted,
//               maintainAnimation: controller.isMounted,
//               maintainState: controller.isMounted,
//               child: Text(errorController.errorText,
//                   textAlign: TextAlign.start,
//                   style: TextStyle(color: Colors.red)),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// class MainWidget extends StatefulWidget {
//   BuildContext context;
//   AppBar appBar;
//   Widget body;
//   Color backgroundColor;
//   MainWidget({
//     @required this.appBar,
//     @required this.body,
//     this.backgroundColor,
//     this.context,
//   });
//   @override
//   _MainWidgetState createState() => _MainWidgetState(
//       appBar: appBar,
//       body: body,
//       backgroundColor: backgroundColor,
//       context: context);
// }

// class _MainWidgetState extends State<MainWidget> {
//   BuildContext context;
//   AppBar appBar;
//   Widget body;
//   Color backgroundColor;
//   _MainWidgetState(
//       {@required this.appBar,
//       @required this.body,
//       this.backgroundColor,
//       this.context});
//   @override
//   Widget build(BuildContext context) {
//     final media = MediaQuery.of(context).size;
//     return Consumer<ChangeIndex>(
//         builder: (context, changeIndex, child) => Container(
//               decoration: BoxDecoration(
//                   color: backgroundColor == null
//                       ? Colors.transparent
//                       : backgroundColor,
//                   gradient: backgroundColor == null
//                       ? LinearGradient(
//                           begin: Alignment.centerRight,
//                           end: Alignment.centerLeft,
//                           colors: [
//                             Color(0xFF4FA5D0),
//                             Color(0xFF80AAB2),
//                             Color(0xFF9CADA2),
//                             Color(0xFFB5B093),
//                             Color(0xFFD3B381),
//                             Color(0xFFEAB673),
//                           ],
//                         )
//                       : null),
//               child: Scaffold(
//                 backgroundColor: Colors.transparent,
//                 appBar: appBar,
//                 body: Stack(
//                   children: [
//                     body,
//                     Positioned(
//                       bottom: 0,
//                       left: 0,
//                       right: 0,
//                       child: Container(
//                         padding: EdgeInsets.only(top: 0),
//                         decoration: BoxDecoration(
//                           color: Theme.of(context).backgroundColor,
//                           borderRadius: BorderRadius.only(
//                             topRight: Radius.circular(16),
//                             topLeft: Radius.circular(16),
//                           ),
//                         ),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.only(
//                             topRight: Radius.circular(16),
//                             topLeft: Radius.circular(16),
//                           ),
//                           child: BottomNavigationBar(
//                             elevation: 0.0,
//                             items: [
//                               BottomNavigationBarItem(
//                                 icon: ImageIcon(
//                                   AssetImage('images/home1.png'),
//                                   size: media.width * 0.055,
//                                 ),
//                                 title: Text(
//                                   AppLocalizations.of(context).trans("Home"),
//                                   style: TextStyle(
//                                       fontSize: media.width * 0.028,
//                                       fontFamily: 'Net'),
//                                 ),
//                                 activeIcon: ImageIcon(
//                                   AssetImage('images/home1.png'),
//                                   size: media.width * 0.055,
//                                   color: Theme.of(context).accentColor,
//                                 ),
//                               ),
//                               BottomNavigationBarItem(
//                                 icon: ImageIcon(
//                                   AssetImage('images/search1.png'),
//                                   size: media.width * 0.055,
//                                 ),
//                                 title: Text(
//                                     AppLocalizations.of(context)
//                                         .trans("search"),
//                                     style: TextStyle(
//                                         fontSize: media.width * 0.028,
//                                         fontFamily: 'Net')),
//                                 activeIcon: ImageIcon(
//                                   AssetImage('images/search1.png'),
//                                   size: media.width * 0.055,
//                                   color: Theme.of(context).accentColor,
//                                 ),
//                               ),
//                               BottomNavigationBarItem(
//                                 icon: ImageIcon(
//                                   AssetImage('images/cart.png'),
//                                   size: media.width * 0.055,
//                                 ),
//                                 title: Text(
//                                     AppLocalizations.of(context).trans("cart"),
//                                     style: TextStyle(
//                                         fontSize: media.width * 0.028,
//                                         fontFamily: 'Net')),
//                                 activeIcon: ImageIcon(
//                                   AssetImage('images/cart.png'),
//                                   size: media.width * 0.055,
//                                   color: Theme.of(context).accentColor,
//                                 ),
//                               ),
//                               BottomNavigationBarItem(
//                                 icon: ImageIcon(
//                                   AssetImage('images/bookmark.png'),
//                                   size: media.width * 0.055,
//                                 ),
//                                 title: Text(
//                                     AppLocalizations.of(context)
//                                         .trans("favorites"),
//                                     style: TextStyle(
//                                         fontSize: media.width * 0.028,
//                                         fontFamily: 'Net')),
//                                 activeIcon: ImageIcon(
//                                   AssetImage('images/bookmark.png'),
//                                   size: media.width * 0.055,
//                                   color: Theme.of(context).accentColor,
//                                 ),
//                               ),
//                               BottomNavigationBarItem(
//                                 icon: ImageIcon(
//                                   AssetImage('images/person.png'),
//                                   size: media.width * 0.055,
//                                 ),
//                                 title: Text(
//                                     AppLocalizations.of(context).trans("more"),
//                                     style: TextStyle(
//                                         fontSize: media.width * 0.028,
//                                         fontFamily: 'Net')),
//                                 activeIcon: ImageIcon(
//                                   AssetImage('images/person.png'),
//                                   size: media.width * 0.055,
//                                   color: Theme.of(context).accentColor,
//                                 ),
//                               ),
//                             ],
//                             // unselectedItemColor: Colors.grey,
//                             showSelectedLabels: false,
//                             showUnselectedLabels: false,
//                             currentIndex: changeIndex.index,
//                             onTap: (index) {
//                               setState(() {
//                                 changeIndex.index = index;
//                               });
//                               // Navigator.push(
//                               //     context,
//                               //     MaterialPageRoute(
//                               //         builder: (context) => NavigationHome(
//                               //               idx: changeIndex.index,
//                               //             )));
//                             },
//                             type: BottomNavigationBarType.fixed,
//                             selectedIconTheme: IconThemeData(
//                                 color: Theme.of(context).primaryColor,
//                                 size: 20),
//                             unselectedIconTheme:
//                                 IconThemeData(color: Colors.white, size: 20),
//                             selectedItemColor: Theme.of(context).primaryColor,
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ));
//   }
// }

cartCard(context, {bool isOffer = false}) {
  final media = MediaQuery.of(context).size;
  return const Padding(
    padding: EdgeInsets.all(8.0),
  );
}

favouriteCard({
  @required BuildContext context,
  @required width,
  @required height,
  @required padding,
  @required itemTitle,
  @required image,
  @required price,
  @required counter,
  @required onCardTapped,
  @required onBookMark,
  @required vendor,
  bool isFavourite = true,
}) {
  return const InkWell();
}

showPriceBottomModal(
    {@required double widgetHeight,
    @required BuildContext context,
    @required media,
    @required image,
    @required itemTitle}) {
  showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10.0))),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (ctx) {
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
            gradient: LinearGradient(
                colors: [
                  Color(0xFFFF9114),
                  Color(0xFFFFCD94),
                ],
                begin: FractionalOffset(0.0, 1.0),
                end: FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: InkWell(
            onTap: () {
              // setState(() {
              //   _feedFocusNode.unfocus();
              // });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.close,
                            color: Theme.of(context).backgroundColor,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).primaryColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: media.width / 3,
                              // height: 120,
                              child: Transform.scale(scale: 1.0, child: image),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10))),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 20),
                                    child: Text(
                                      itemTitle,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontFamily: 'Poppins-Regular'),
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Warehouse: 83',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .backgroundColor,
                                                fontSize: 12,
                                                fontFamily: 'Poppins-Bold'),
                                          ),
                                          const Text(
                                            "\$123",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontFamily: 'Poppins-Bold'),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Text(
                          '${AppLocalizations.of(context).trans('color')}:',
                          style: TextStyle(
                              color: Theme.of(context).backgroundColor,
                              fontSize: 16,
                              fontFamily: 'Poppins-SemiBold'),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 30),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.red),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Text(
                          '${AppLocalizations.of(context).trans('size')}:',
                          style: TextStyle(
                              color: Theme.of(context).backgroundColor,
                              fontSize: 16,
                              fontFamily: 'Poppins-SemiBold'),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Container(
                                width: 35,
                                height: 35,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                child: Text(
                                  'S',
                                  style: TextStyle(
                                      color: Theme.of(context).backgroundColor,
                                      fontSize: 14,
                                      fontFamily: 'Poppins-SemiBold'),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Container(
                                width: 35,
                                height: 35,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                child: Text(
                                  'M',
                                  style: TextStyle(
                                      color: Theme.of(context).backgroundColor,
                                      fontSize: 14,
                                      fontFamily: 'Poppins-SemiBold'),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Container(
                                width: 35,
                                height: 35,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                child: Text(
                                  'L',
                                  style: TextStyle(
                                      color: Theme.of(context).backgroundColor,
                                      fontSize: 14,
                                      fontFamily: 'Poppins-SemiBold'),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Container(
                                width: 35,
                                height: 35,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                child: Text(
                                  'XL',
                                  style: TextStyle(
                                      color: Theme.of(context).backgroundColor,
                                      fontSize: 14,
                                      fontFamily: 'Poppins-SemiBold'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${AppLocalizations.of(context).trans('amount')}:',
                              style: TextStyle(
                                  color: Theme.of(context).backgroundColor,
                                  fontSize: 16,
                                  fontFamily: 'Poppins-SemiBold'),
                            ),
                            Container(
                              // width: width * 0.3,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Image.asset(
                                      'images/decrease.png',
                                      width: 14,
                                    ),
                                  ),
                                  const Text(
                                    '1',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily: 'Poppins-Bold'),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Image.asset(
                                        'images/increase.png',
                                        width: 14,
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 20.0, top: 25),
                        child: submitButton(
                            context: context,
                            borderColor: Theme.of(context).backgroundColor,
                            buttonColor: Theme.of(context).backgroundColor,
                            onClicked: () async {
                              // setState(() {
                              //   _feedFocusNode.unfocus();
                              // });
                            },
                            buttonTitle:
                                AppLocalizations.of(ctx).trans("add_item"),
                            sidesPadding: media.width * 0.12))
                  ],
                ),
              ],
            ),
          ),
        );
      });
}

showAddressBottomModal({
  @required double widgetHeight,
  @required BuildContext context,
  @required media,
}) {
  showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10.0))),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (ctx) {
        return Material(
          elevation: 30,
          child: Container(
            decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(10.0)),
                color: Theme.of(context).primaryColor),
            child: InkWell(
              onTap: () {
                // setState(() {
                //   _feedFocusNode.unfocus();
                // });
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(
                              Icons.close,
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Text(
                          'Select your location form the map',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins-Bold',
                              fontSize: 25),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Text(
                          'Move the pin on the map to find your location and select the delivery address.',
                          style: TextStyle(
                              color: Theme.of(context).backgroundColor,
                              fontFamily: 'Poppins-Regular',
                              fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 0),
                          child: Text(
                            'Address',
                            style: TextStyle(
                                color: Theme.of(context).backgroundColor,
                                fontFamily: 'Poppins-Bold',
                                fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 0),
                          child: Theme(
                            data: ThemeData(
                                primaryColor: Colors.white,
                                accentColor: Colors.white,
                                hintColor: Colors.white),
                            child: SizedBox(
                              height: 45,
                              // constraints: BoxConstraints.tight(const Size(200, 50)),
                              child: TextFormField(
                                cursorColor: Theme.of(context).backgroundColor,
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  suffixIcon: const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                    size: 14,
                                  ),
                                  hintText:
                                      'Aqua Florya Mall Bakırköy / İstanbul',
                                  hintStyle: const TextStyle(
                                      color: Colors.white, fontFamily: "hel"),
                                  border: const UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Theme.of(context).backgroundColor),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(bottom: 20.0, top: 45),
                          child: submitButton(
                              context: context,
                              borderColor: Theme.of(context).accentColor,
                              buttonColor: Theme.of(context).accentColor,
                              onClicked: () async {
                                // setState(() {
                                //   _feedFocusNode.unfocus();
                                // });
                              },
                              buttonTitle:
                                  AppLocalizations.of(ctx).trans("next"),
                              sidesPadding: media.width * 0.12)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      });
}

showCountriesBottomModal({
  @required double widgetHeight,
  @required BuildContext context,
  @required media,
  @required List list,
}) {
  showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10.0))),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (ctx) {
        return Material(
          elevation: 30,
          child: Container(
            height: media.height * 0.6,
            decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(10.0)),
                color: Theme.of(context).primaryColor),
            child: InkWell(
              onTap: () {
                // setState(() {
                //   _feedFocusNode.unfocus();
                // });
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            height: 6,
                            width: media.width * 0.3,
                            decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .backgroundColor
                                    .withOpacity(0.6),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Text(
                          'Select country',
                          style: TextStyle(
                              color: Theme.of(context).backgroundColor,
                              fontFamily: 'Poppins-Bold',
                              fontSize: 25),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(
                                list.length,
                                (index) => Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: Text(
                                              '${list[index]}',
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontFamily:
                                                      'Poppins-Regular'),
                                            ),
                                          ),
                                          index == (list.length - 1)
                                              ? const SizedBox()
                                              : SizedBox(
                                                  width: media.width * 0.9,
                                                  child: const Divider(
                                                    color: Colors.black26,
                                                    thickness: 0.8,
                                                  ),
                                                ),
                                          index == (list.length - 1)
                                              ? const SizedBox(
                                                  height: 20,
                                                )
                                              : const SizedBox()
                                        ],
                                      ),
                                    )),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      });
}

filteredCard({
  @required BuildContext context,
  @required width,
  @required height,
  @required padding,
  @required itemTitle,
  @required image,
  @required price,
  @required counter,
  @required onCardTapped,
  @required onBookMark,
  @required vendor,
  bool isFavourite = true,
}) {
  return Padding(
    padding: padding,
    child: Stack(
      children: [
        Container(
            width: width * 0.5,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Container(
                  child: image,
                )),
                Container(
                  padding: const EdgeInsets.only(left: 20, bottom: 10),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(14),
                          bottomLeft: Radius.circular(14)),
                      color: Color(0xFFFFB866)
                      // gradient: new LinearGradient(
                      //     colors: [
                      //       const Color(0xff026196),
                      //       // const Color(0xFFFF9114),
                      //       const Color(0xFFFFCD94),
                      //     ],
                      //     begin: const FractionalOffset(0.0, 1.0),
                      //     end: const FractionalOffset(1.0, 0.0),
                      //     stops: [0.0, 1.0],
                      //     tileMode: TileMode.clamp),
                      ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          // alignment: Alignment.center,
                          width: width,
                          child: Text(
                            '$itemTitle',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Poppins-SemiBold',
                                height: 2),
                            overflow: TextOverflow.ellipsis,
                          )),
                      Text(
                        '\$$price',
                        style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontFamily: 'Poppins-Bold',
                            height: 1.5),
                      ),
                    ],
                  ),
                ),
              ],
            )),
        Positioned(
            top: 0,
            left: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: Text(
                '$vendor',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Poppins-Regular'),
              ),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(0),
                      bottomRight: Radius.circular(14)),
                  color: Theme.of(context).backgroundColor),
            )),
        Positioned(
            right: 10,
            bottom: 20,
            child: InkWell(
                onTap: onBookMark,
                child: Image.asset(
                  isFavourite == true
                      ? 'images/favourite.png'
                      : 'images/favouriteBordered.png',
                  color: Theme.of(context).backgroundColor,
                  width: 15,
                )))
      ],
    ),
  );
}

reviewCard({
  @required BuildContext context,
  @required media,
  @required padding,
  @required reviewText,
  @required image,
  @required rate,
  @required name,
  @required date,
  @required color,
  @required onTap,
  bool isFavourite = true,
}) {
  return Container(
    width: media.width,
    height: media.height * 0.3,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(14),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).backgroundColor),
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                'images/placeHolder.png',
                height: 25,
              ),
            ),
            Column(
              children: [
                const Text(
                  'Victor Flexin',
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'Poppins-Bold'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RatingBar(
                      initialRating: 3,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 14,
                      ratingWidget: RatingWidget(
                        full: Image.asset(
                          'images/rateStar.png',
                          color: Theme.of(context).backgroundColor,
                        ),
                        half: Image.asset('images/rateHalfStar.png',
                            color: Theme.of(context).backgroundColor),
                        empty: Image.asset('images/rateStarBordered.png',
                            color: Theme.of(context).backgroundColor),
                      ),
                      itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                      onRatingUpdate: (rating) {
                        debugPrint(rating.toString());
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2, left: 5),
                      child: Text(
                        '3.0',
                        style: TextStyle(
                            color: Theme.of(context).backgroundColor,
                            fontFamily: 'Poppins-Bold',
                            fontSize: 14),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'The dial on this timepiece is extremely unique, as it is a concentric circular pattern that is covered by sturdy sapphire glass.',
            style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontFamily: 'Poppins-SemiBold'),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            submitButton(
              context: context,
              borderColor: Theme.of(context).accentColor,
              buttonColor: Theme.of(context).accentColor,
              buttonTitle: 'Report',
              buttonW: 100.0,
              height: 35.0,
              titleColor: Colors.white,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).backgroundColor),
                  ),
                ),
                Text(
                  '09:30 - 23/06/2021',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 12,
                      fontFamily: 'Poppins-Regular'),
                ),
              ],
            )
          ],
        )
      ],
    ),
  );
}

void showRegisterDialog(context,
    {barrierDismissible = true,
    media,
    onUserRegister,
    onProviderRegister,
    onAdvertiserRegister}) {
  showGeneralDialog(
    barrierLabel: "Barrier",
    barrierDismissible: barrierDismissible,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 500),
    context: context,
    pageBuilder: (_, __, ___) {
      return Align(
        alignment: Alignment.center,
        child: Material(
          textStyle: const TextStyle(
              fontSize: 16, fontFamily: "hel", color: Colors.white),
          color: Colors.transparent,
          child: Container(
            // height: height??400,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: onUserRegister,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                      bottom: 15,
                    ),
                    child: SizedBox(
                      width: media.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Image.asset(
                              'images/user.png',
                              width: 25,
                              color: Theme.of(context).backgroundColor,
                            ),
                          ),
                          Text(
                            'تسجيل مستخدم',
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontFamily: 'CairoSemiBold'),
                          ),
                          const SizedBox(
                            width: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const Divider(
                  height: 6,
                  thickness: 1.5,
                ),
                InkWell(
                  onTap: onProviderRegister,
                  child: Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                        bottom: 15,
                      ),
                      child: SizedBox(
                        width: media.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Image.asset(
                                'images/hajj.png',
                                width: 25,
                              ),
                            ),
                            Text(
                              'تسجيل مقدم خدمة',
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontFamily: 'CairoSemiBold'),
                            ),
                            const SizedBox(
                              width: 20,
                            )
                          ],
                        ),
                      )),
                ),
                const Divider(
                  height: 6,
                  thickness: 1.5,
                ),
                InkWell(
                  onTap: onAdvertiserRegister,
                  child: Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                        bottom: 15,
                      ),
                      child: SizedBox(
                        width: media.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Image.asset(
                                'images/megaphone.png',
                                width: 25,
                              ),
                            ),
                            Text(
                              'تسجيل مسوق للخدمة',
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontFamily: 'CairoSemiBold'),
                            ),
                            const SizedBox(
                              width: 20,
                            )
                          ],
                        ),
                      )),
                ),
              ],
            ),
            margin: const EdgeInsets.only(bottom: 50, left: 12, right: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      return SlideTransition(
        position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(anim),
        child: child,
      );
    },
  );
}

giftCard({
  @required BuildContext context,
  @required media,
  @required padding,
  @required image,
  @required price,
  @required title,
  @required onTap,
  @required cardWidth,
  bool isFavourite = true,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    child: Material(
      elevation: 2.0,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey[300]),
            color: Colors.white),
        child: Column(
          children: [
            Container(
              width: cardWidth ?? 120,
              padding: EdgeInsets.all(2),
              child: image,
            ),
            Container(
              // height: 40,
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey[300])),
              ),
              width: cardWidth ?? 120,
              child: Column(
                children: [
                  Text(
                    '$title',
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                        fontFamily: "CairoSemiBold"),
                  ),
                  Text(
                    '$price',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 12,
                        fontFamily: "CairoBold"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget addressListTile({double height, double width}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6),
      color: Color(0xffF8F8F8),
    ),
    child: ListTile(
      leading: Transform.scale(
        child: Image.asset('images/maps-and-flags.png'),
        scale: 0.35,
      ),
      title: Text('Tabouk'),
      subtitle: Text('address details'),
      trailing: Transform.scale(
        child: Image.asset('images/delete.png'),
        scale: 0.35,
      ),
    ),
  );
}

formatStringDate({@required stringDate}) {
  var format = DateFormat('yyyy-MM-dd');
  DateTime dateTime = DateTime.parse(stringDate);
  // var finalDate = format.format(dateTime);
  return dateTime;
}

formatStringTime({@required stringTime}) {
  var format = DateFormat.Hm();
  DateTime dateTime = DateTime.parse(stringTime);
  var finalDate = format.format(dateTime);
  return dateTime;
}

format(Duration d) => d.toString().split('.').first.padLeft(8, "0");

Widget offerCard({Function function, BuildContext context}) => InkWell(
      // sized one for grids
      onTap: function,
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Color(0xffEBEBEB))),
        width: 150,
        height: 240,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 100,
                child: ClipRRect(
                  child: Image.network(
                    'https://www.kroger.com/product/images/large/front/0004850020274',
                    fit: BoxFit.fitHeight,
                    width: 1000.0,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(
                              Theme.of(context).primaryColor),
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes
                              : null,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Text(
                  'Orange Juice',
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
              ),
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Row(
                  children: <Widget>[
                    Text(
                      '23.61',
                      style: TextStyle(fontSize: 14, color: Color(0xffDC0A0A)),
                    ),
                    Text(
                      'SAR / item',
                      style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Stack(
                  children: <Widget>[
                    Text(
                      '23.61 SAR ',
                      style: TextStyle(fontSize: 12, color: Colors.grey[400]),
                    ),
                    SizedBox(
                      child: Divider(
                        color: Colors.grey[400],
                      ),
                      width: 32,
                    )
                  ],
                ),
              ),
            ),
            Center(
              child: FlatButton(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                onPressed: () {},
                child: Text(
                  'Add Item',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                    side: BorderSide(color: Theme.of(context).primaryColor)),
              ),
            )
          ],
        ),
      ),
    );

Widget itemCard(context, {bool isOffer = false, productImage}) {
  return InkWell(
    onTap: () {
      // Navigator.pushNamed(context, ProductDetails.routName);
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(color: Color(0xFFF9F8F6)),
            // width: 150,
            // height: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8, right: 8, left: 8, bottom: 2),
                  child: SizedBox(
                    // color: Colors.red,
                    height: 150,
                    width: 150,
                    child: ClipRRect(
                      child: productImage == null
                          ? Image.asset(
                              'images/shirt3.png',
                              fit: BoxFit.fill,
                              // width: 1000.0,
                            )
                          : Image.network(
                              '$productImage',
                              fit: BoxFit.fitHeight,
                              width: 1000.0,
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation(
                                        Theme.of(context).primaryColor),
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes
                                        : null,
                                  ),
                                );
                              },
                            ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                    child: Text(
                      'تي شيرت رجالي ماركة',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[900],
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Text(
                          '400 ر.س',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '500 ر.س',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[500],
                              decoration: TextDecoration.lineThrough),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                height: 30,
                width: 40,
                decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(20))),
                child: Transform.scale(
                    scale: 0.6,
                    child: Image.asset(
                      'images/cart3.png',
                      color: Colors.white,
                      width: 12,
                      height: 12,
                    )),
              )),
          Positioned(
              top: 10,
              left: 5,
              child: SizedBox(
                height: 30,
                width: 40,
                child: Transform.scale(
                    scale: 0.6,
                    child: Image.asset(
                      'images/heart.png',
                      color: Colors.grey[600],
                      width: 12,
                      height: 12,
                    )),
              )),
          isOffer
              ? Positioned(
                  top: 10,
                  right: 5,
                  child: Container(
                    // height:30,
                    // width: 40,
                    color: Color(0xFFAF0912),
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                    child: Text('12%',
                        style: TextStyle(
                            color: Colors.white,
                            height: 1.4,
                            fontFamily: 'CairoBold',
                            fontSize: 12)),
                  ))
              : SizedBox()
        ],
      ),
    ),
  );
}

Widget listItemCard(context, {bool isOffer = false}) {
  final media = MediaQuery.of(context).size;
  return InkWell(
    onTap: () {
      // Navigator.pushNamed(context, ProductDetails.routName);
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            width: media.width,
            height: media.height / 6,
            decoration: const BoxDecoration(color: Color(0xFFF9F8F6)),
            child: Row(
              children: [
                SizedBox(
                    // color: Colors.red,
                    height: 100,
                    width: 100,
                    child: ClipRRect(
                        child: Image.asset(
                      'images/shirt3.png',
                      fit: BoxFit.fill,
                      // width: 1000.0,
                    ))),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 160,
                        child: Text(
                          ' تي شيرت رجالي ماركة ',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[900],
                              fontFamily: 'CairoSemiBold'),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      Text(
                        '400 ر.س',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                            fontFamily: "Net"),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 30,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                  ),
                  child: Transform.scale(
                      scale: 0.6,
                      child: Image.asset(
                        'images/cart3.png',
                        color: Colors.white,
                        width: 12,
                        height: 12,
                      )),
                ),
              )),
          Positioned(
              top: 10,
              left: 5,
              child: SizedBox(
                height: 30,
                width: 40,
                child: Transform.scale(
                    scale: 0.6,
                    child: Image.asset(
                      'images/heart.png',
                      color: Colors.grey[600],
                      width: 12,
                      height: 12,
                    )),
              )),
          isOffer
              ? Positioned(
                  bottom: 10,
                  right: 0,
                  child: Container(
                    // height:30,
                    //width: 60,
                    color: Color(0xFFAF0912),
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                    child: Text('خصم 12%  ',
                        style: TextStyle(
                            color: Colors.white,
                            height: 1.4,
                            fontFamily: 'CairoBold',
                            fontSize: 12)),
                  ))
              : SizedBox()
        ],
      ),
    ),
  );
/* return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(color: Color(0xFFF9F8F6)),
         width:media.width,
          // height: 120,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8,right: 8,left: 8,bottom: 2),
                child: Container(
                  // color: Colors.red,
                  height: 80,
                  width: 80,
                  child: ClipRRect(
                    child:
                    Image.asset(
                      'images/shirt3.png',
                      fit: BoxFit.fill,
                      // width: 1000.0,
                    ),
                    // Image.network(
                    //   'https://www.kroger.com/product/images/large/front/0004850020274',
                    //   fit: BoxFit.fitHeight,
                    //   width: 1000.0,
                    //   loadingBuilder: (BuildContext context, Widget child,
                    //       ImageChunkEvent loadingProgress) {
                    //     if (loadingProgress == null) return child;
                    //     return Center(
                    //       child: CircularProgressIndicator(
                    //         valueColor:
                    //         AlwaysStoppedAnimation(Theme.of(context).primaryColor),
                    //         value: loadingProgress.expectedTotalBytes != null
                    //             ? loadingProgress.cumulativeBytesLoaded /
                    //             loadingProgress.expectedTotalBytes
                    //             : null,
                    //       ),
                    //     );
                    //   },
                    // ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  child: Text(
                    'تي شيرت رجالي ماركة',
                    style: TextStyle(fontSize: 14, color: Colors.grey[900],fontFamily: 'CairoSemiBold'),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    '400 ر.س',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600],fontFamily: "Net"),
                  ),
                ),
              ),

            ],
          ),
        ),
        Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              height:30,
              width: 40,
              decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20))
              ),
              child: Transform.scale(scale:0.6,child: Image.asset('images/cart3.png',color: Colors.white,width: 12,height: 12,)),
            )),
        Positioned(
            top: 10,
            left: 5,
            child: Container(
              height:30,
              width: 40,
              child: Transform.scale(scale:0.6,child: Image.asset('images/heart.png',color: Colors.grey[600],width: 12,height: 12,)),
            )),
        isOffer ? Positioned(
            top: 10,
            right: 5,
            child: Container(
              // height:30,
              // width: 40,
              color: Color(0xFFAF0912),
              padding: EdgeInsets.symmetric(vertical: 2,horizontal: 8),
              child: Text('12%',style: TextStyle(color: Colors.white,height: 1.4,fontFamily: 'CairoBold',fontSize: 12)),
            )) : SizedBox()
      ],
    ),
  );


*/
}

Widget offerCountItem({
  var productColor,
  var locale,
  dynamic product,
  var itemId,
  Function onPressed,
  Function onAddButtonClicked,
  double height,
  double width,
  bool isItemSelected = false,
  int itemCounter,
  double positionedBottom,
  double positionedTop,
  double positionedRight,
  double positionedLeft,
  bool isEnglish = true,
  dynamic discount = "",
  bool isFavored = false,
  bool hasDiscount = true,
  bool isOutOfStock = false,
  bool isAddbuttonVisable = true,
  Function favore,
  String imgUrl = "",
  dynamic productTitle = "Product Name & info",
  dynamic productPrice = 20,
  String productCurrency = "SAR",
  BuildContext ctx,
  dynamic oldPrice,
  String addItem = "Add Item",
  dynamic inCart, // for the button,
  dynamic qty,
  Widget loader,
  Function onIncrease,
  dynamic productOption,
  bool isNotified = false,
  Widget counterBtn,
}) {
  return InkWell(
    onTap: onPressed,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Material(
        elevation: 2.0,
        color: Colors.white,
        child: Container(
          decoration:
              BoxDecoration(border: Border.all(color: Color(0xffEBEBEB))),
          width: width,
          height: height,
          child: Stack(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: SizedBox(
                      height: 90,
                      width: 90,
                      child: ClipRRect(
                          child: Image.asset("images/item1.png",
                              fit: BoxFit.contain, width: 1000.0)),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 4, left: 4, bottom: 8),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: width * 0.6,
                                  child: Text(
                                    "productTitle",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                productColor != null && productColor != ""
                                    ? Container(
                                        width: 18.0,
                                        height: 18.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                          color: Color(int.parse(
                                              "0xff${productColor.substring(1)}00")),
                                        ),
                                      )
                                    : Container()
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 2),
                                child: Row(
                                  children: <Widget>[
                                    productPrice == ""
                                        ? Container()
                                        : Text(
                                            "$productPrice", // dummy data
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xffDC0A0A)),
                                          ),
                                    productPrice == ""
                                        ? Container()
                                        : SizedBox(
                                            width: 5.0,
                                          ),
                                    Text(
                                      '$productCurrency', // dummy data
                                      style: TextStyle(
                                          fontSize: 14,
                                          color:
                                              //Color(0xff707070),
                                              Theme.of(ctx).accentColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            productPrice == ""
                                ? Container()
                                : SizedBox(
                                    width: 5.0,
                                  ), // this is new
                            hasDiscount == true
                                ? Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 4, vertical: 5.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: Color(0xffF1D83B),
                                    ),
                                    child: Text(
                                      "${AppLocalizations.of(ctx).trans("discount")}  $discount%",
                                      style: TextStyle(
                                          color: Color(0xffDC0A0A),
                                          fontSize: 8),
                                    ),
                                  )
                                : SizedBox(),
                          ],
                        ),
                        hasDiscount == true
                            ? SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4, vertical: 4),
                                  child: Stack(
                                    children: <Widget>[
                                      Text(
                                        oldPrice == "0"
                                            ? ""
                                            : '$oldPrice    $productCurrency',
                                        style: TextStyle(
                                            decoration: hasDiscount != false ||
                                                    oldPrice != "0"
                                                ? TextDecoration.lineThrough
                                                : null,
                                            fontSize:
                                                productPrice == "" ? 14 : 12,
                                            color: productPrice == ""
                                                ? Theme.of(ctx).primaryColor
                                                : Colors.grey[600]),
                                      ),
                                      // hasDiscount == false || oldPrice == "0"
                                      //     ? Container()
                                      //     : SizedBox(
                                      //         child: Divider(
                                      //           color: Colors.grey[400],
                                      //           height: 15,
                                      //           thickness: 1.5,
                                      //         ),
                                      //         width: 24,
                                      //       )
                                    ],
                                  ),
                                ),
                              )
                            : SizedBox(),
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                child: isOutOfStock
                    ? Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffEBEBEB)),
                          color: Colors.black12,
                        ),
                        alignment:
                            AppLocalizations.of(ctx).locale.languageCode == "en"
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                        width: width * 2,
                        height: height,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 18.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: AppLocalizations.of(ctx)
                                              .locale
                                              .languageCode ==
                                          "ar"
                                      ? EdgeInsets.only(right: 15.0, bottom: 2)
                                      : EdgeInsets.only(left: 15.0, bottom: 2),
                                  child: Text(
                                    AppLocalizations.of(ctx)
                                        .trans("out_of_stock"),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Net",
                                        fontSize: 18,
                                        color: Colors.grey[900]),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : SizedBox(),
              ),
              Positioned(
                top: 8.0,
                right: isEnglish ? 10 : null,
                left: isEnglish ? null : 10,
                child: isFavored
                    ? IconButton(
                        onPressed: () async {},
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      )
                    : Container(),
              ),
              Positioned(
                bottom: 8.0,
                right: isEnglish ? 10 : null,
                left: isEnglish ? null : 10,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget moreGridItem(
    {BuildContext context,
    String assetImgPath,
    String title,
    Function navigateTo,
    var imgColor}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 3.0),
    child: GestureDetector(
      onTap: () {
        navigateTo();
      },
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 115.0,
                width: 115.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Theme.of(context).primaryColor.withOpacity(0.3)),
              ),
              Container(
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Theme.of(context).primaryColor,
                  // gradient: LinearGradient(colors: [
                  //   Color(0xffddaa1e),
                  //   Colors.yellow
                  // ]
                  // )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                    child: Image.asset(
                      assetImgPath,
                      color: imgColor ?? Colors.white,
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 1.0),
            child: Text(
              title ?? '',
              style: TextStyle(color: Colors.black, fontSize: 12.0),
            ),
          )
        ],
      ),
    ),
  );
}

class CustomDropDown extends StatelessWidget {
  final int value;
  final String hint;
  final String errorText;
  final List<DropdownMenuItem> items;
  final Function onChanged;

  const CustomDropDown(
      {Key key,
      this.value,
      this.hint,
      this.items,
      this.onChanged,
      this.errorText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: Color(0xffF5F5F5), borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: DropdownButton<int>(
          dropdownColor: Colors.white,
          focusColor: Colors.white,
          value: value,
          hint: Text(
            hint,
            style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            overflow: TextOverflow.ellipsis,
          ),
          items: items,
          onChanged: (item) {
            onChanged(item);
          },
          isExpanded: true,
          underline: Container(),
          icon: Icon(Icons.keyboard_arrow_down, color: Color(0xff707070)),
        ),
      ),
    );
  }
}

customBottomSheet({
  @required Widget content,
  @required BuildContext context,
}) {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (ctx) {
        return content;
      });
}

//item(
//    {@required context,
//    @required media,
//    VendorProduct product,
//    locale,
//    VendorModel vendor,
//    cartQuantity,
//    price,
//    addFromSearchItem,
//    bool inCart = false}) {
//      var locale=Provider.of<LocaleProvider>(context).locale.languageCode;
//
//  print(product.vendor_id);
//  print(product.product.cart_details);
//  return Padding(
//    padding: const EdgeInsets.all(10.0),
//    child: Container(
//      width: media.width,
//      height: 120,
//      decoration: BoxDecoration(
//          color: Colors.white,
//          border: Border.all(color: Colors.grey[300], width: 0.8),
//          borderRadius: BorderRadius.circular(5)),
//      child: Stack(
//        children: [
//          Row(
//            children: [
//              Padding(
//                padding: EdgeInsets.all(8),
//                child: Container(
//                  width: 100,
//                  height: media.height / 4.5,
//                  decoration: BoxDecoration(
//                      image: DecorationImage(
//                          image: NetworkImage(
//                            '${product.product.image}',
//                          ),
//                          fit: BoxFit.fill)),
//                ),
//              ),
//              // Container(
//              //   height: media.height / 4.5,
//              //   color: Colors.grey[300],
//              //   width: 0.8,
//              // ),
//              Column(
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: [
//                  Expanded(
//                    child: Padding(
//                      padding: const EdgeInsets.only(
//                          top: 10, right: 10, left: 10, bottom: 5),
//                      child: SizedBox(
//                          // height: 45,
//                          width: media.width * 0.50,
//                          child: Text(
//                            '${product.product.name ?? "item"}',
//                            maxLines: 2,
//                          )),
//                    ),
//                  ),
//                  // Padding(
//                  //   padding: const EdgeInsets.only(
//                  //       top: 0, right: 10, left: 10, bottom: 0),
//                  //   child: Text(
//                  //     '${vendor.name ?? "vendor"} ',
//                  //     style: TextStyle(
//                  //         color: Colors.black, fontWeight: FontWeight.bold),
//                  //   ),
//                  // ),
//                  Expanded(
//                    child: Padding(
//                      padding: const EdgeInsets.only(
//                          top: 0, right: 10, left: 10, bottom: 0.0),
//                      child: Row(
//                        children: [
//                          Text(
//                            // '${price}',
//                            "${product.price}",
//                            style: TextStyle(
//                                color: Colors.red,
//                                fontSize: 16,
//                                fontWeight: FontWeight.bold),
//                          ),
//                          const SizedBox(
//                            width: 5,
//                          ),
//                          Text('SAR', style: TextStyle(fontSize: 14)),
//                        ],
//                      ),
//                    ),
//                  ),
//                  vendor != null && vendor.has_delivery == true
//                      ? Padding(
//                          padding: const EdgeInsets.all(8.0),
//                          child: Row(
//                            children: [
//                              Padding(
//                                padding: const EdgeInsets.all(3.0),
//                                child: Container(
//                                  width: 15,
//                                  height: 15,
//                                  decoration: BoxDecoration(
//                                      color: Colors.white,
//                                      shape: BoxShape.circle),
//                                  child: Center(
//                                      child: Image.asset(
//                                    'images/check.png',
//                                    width: 15,
//                                  )),
//                                ),
//                              ),
//                              Text('${AppLocalizations.of(context).trans('deliveryAvailable')}',
//                                  style: TextStyle(
//                                      fontSize: 12,
//                                      color: Colors.black,
//                                      height: 1)),
//                            ],
//                          ),
//                        )
//                      : Padding(
//                          padding: const EdgeInsets.all(8.0),
//                          child: Row(
//                            children: [
//                              Padding(
//                                padding: const EdgeInsets.all(3.0),
//                                child: Container(
//                                  width: 15,
//                                  height: 15,
//                                  decoration: BoxDecoration(
//                                      color: Colors.white,
//                                      shape: BoxShape.circle),
//                                  child: Center(
//                                      child: Image.asset(
//                                    'images/uncheck.png',
//                                    width: 15,
//                                  )),
//                                ),
//                              ),
//                              Text('${AppLocalizations.of(context).trans('deliveryNotAvailable')}',
//                                  style: TextStyle(
//                                      fontSize: 12,
//                                      color: Colors.black,
//                                      height: 1)),
//                            ],
//                          ),
//                        ),
//                ],
//              )
//            ],
//          ),
//          Positioned(
//            left:locale=='en'?null:10.0,
//            right:locale=='en'?10.0:null ,
//            bottom:locale=='en'? 35:10,
//            child: Container(
//              height: 30,
//              width: 80,
//              child: product.product.cart_details.isNotEmpty &&
//                      product.product.cart_details.firstWhere(
//                              (element) =>
//                                  element['vendor_id'] == product.vendor_id,
//                              orElse: () {}) !=
//                          null
//                  ? Row(
//                      // mainAxisAlignment:
//                      // MainAxisAlignment.spaceBetween,
//                      children: [
//                        InkWell(
//                          onTap: () {
//                            Provider.of<CartProvider>(context, listen: false)
//                                .addToCart(
//                              context: context,
//                              locale: locale,
//                              product_id: product.product.id,
//                              vendor_id: vendor.id,
//                            )
//                                .then((_) {
//                              Provider.of<VendorsProvider>(context,
//                                      listen: false)
//                                  .getVendorProducts(
//                                      context: context,
//                                      locale: locale,
//                                      vendorId: vendor.id);
//                              Provider.of<CartProvider>(context, listen: false)
//                                  .getCartData(context, locale);
//                              Provider.of<ProductsProvider>(context,
//                                      listen: false)
//                                  .getProductDetails(
//                                context: context,
//                                locale: locale,
//                                productId: product.product.id,
//                                vendorId: vendor.id,
//                              );
//                            });
//                          },
//                          child: Container(
//                            width: 25,
//                            height: 19,
//                            child: Center(
//                                child: Text(
//                              '+',
//                              style: TextStyle(
//                                  fontSize: 20, color: Colors.white, height: 1),
//                            )),
//                            color: Theme.of(context).primaryColor,
//                          ),
//                        ),
//                        Container(
//                          decoration: BoxDecoration(
//                              border: Border(
//                                  top: BorderSide(color: Colors.grey.shade400),
//                                  bottom:
//                                      BorderSide(color: Colors.grey.shade400))),
//                          width: 25,
//                          height: 19,
//                          child: Center(
//                              child: Text(
//                            '$cartQuantity',
//                            style:
//                                TextStyle(color: Colors.black54, fontSize: 12,height: 1.3),
//                          )),
//                        ),
//                        InkWell(
//                          onTap: () {
//                            Provider.of<CartProvider>(context, listen: false)
//                                .removeFromCart(
//                              context: context,
//                              locale: locale,
//                              product_id: product.product.id,
//                              vendor_id: vendor.id,
//                            )
//                                .then((_) {
//                              Provider.of<CartProvider>(context, listen: false)
//                                  .getCartData(context, locale);
//                              Provider.of<VendorsProvider>(context,
//                                      listen: false)
//                                  .getVendorProducts(
//                                      context: context,
//                                      locale: locale,
//                                      vendorId: vendor.id);
//                              Provider.of<ProductsProvider>(context,
//                                      listen: false)
//                                  .getProductDetails(
//                                    context: context,
//                                    locale: locale,
//                                    productId: product.product.id,
//                                    vendorId: vendor.id,
//                                  )
//                                  .then((_) {});
//                              //  Provider.of<VendorsProvider>(context,
//                              //           listen: false)
//                              //       .getVendorProducts(
//                              //           context: context,
//                              //           locale: locale,
//                              //           vendorId: vendor.id)
//                              //       .then((_) {});
//                            });
//                          },
//                          child: Container(
//                            width: 25,
//                            height: 19.5,
//                            child: Center(
//                                child: Text(
//                              '-',
//                              style: TextStyle(
//                                  fontSize: 20, color: Colors.white, height: 1),
//                            )),
//                            color: Theme.of(context).primaryColor,
//                          ),
//                        ),
//                      ],
//                    )
//                  : InkWell(
//                      onTap: addFromSearchItem ??
//                          () async {
//                            Provider.of<CartProvider>(context, listen: false)
//                                .addToCart(
//                              context: context,
//                              locale: locale,
//                              product_id: product.product.id,
//                              vendor_id: vendor.id,
//                            )
//                                .then((_) {
//                              Provider.of<VendorsProvider>(context,
//                                      listen: false)
//                                  .getVendorProducts(
//                                      context: context,
//                                      locale: locale,
//                                      vendorId: vendor.id);
//                              Provider.of<CartProvider>(context, listen: false)
//                                  .getCartData(context, locale);
//                              Provider.of<ProductsProvider>(context,
//                                      listen: false)
//                                  .getProductDetails(
//                                context: context,
//                                locale: locale,
//                                productId: product.product.id,
//                                vendorId: vendor.id,
//                              );
//                            });
//                          },
//                      child: Container(
//                        height: 25,
//                        width: 80,
//                       decoration: BoxDecoration(
//                          color: Theme.of(context).primaryColor,
//                          borderRadius: BorderRadius.circular(5)
//                       ),
//                        child: Row(
//                          mainAxisAlignment: MainAxisAlignment.center,
//                          children: [
//                            Icon(
//                              Icons.shopping_cart,
//                              color: Colors.white,
//                              size: 12,
//                            ),
//                            const SizedBox(
//                              width: 1,
//                            ),
//                            Text('${AppLocalizations.of(context).trans("add")}',
//                                style: TextStyle(
//                                    color: Colors.white,
//                                    height: 1,
//                                    fontWeight: FontWeight.normal,
//                                    fontFamily: "Net",
//                                    fontSize: 12))
//                          ],
//                        ),
//                      ),
//                    ),
//              decoration: BoxDecoration(
//                borderRadius: BorderRadius.circular(5),
//              ),
//            ),
//          ),
//          inCart == true
//              ? Positioned(
//                  top: 10,
//                  left: 10.0,
//                  child: Container(
//                    child: Image.asset(
//                      'images/delete.png',
//                      color: Colors.grey[500],
//                    ),
//                    width: 25,
//                    height: 25,
//                  ),
//                )
//              : const SizedBox(),
//        ],
//      ),
//    ),
//  );
//}


//cartItem(
//    {@required context,
//    @required media,
//    CartProduct product,
//    locale,
//    quantity,
//    addToCart,
//    removeFromCart,
//    image,
//    bool inCart = false}) {
//  var _locale = Provider.of<LocaleProvider>(context).locale.languageCode;
//  print(_locale);
//  return Stack(
//    children: [
//      Padding(
//        padding: const EdgeInsets.all(8.0),
//        child: Container(
//          width: media.width,
//          height: 120,
//          decoration: BoxDecoration(
//              border: Border.all(color: Colors.grey[300], width: 0.8),
//              borderRadius: BorderRadius.circular(5)),
//          child: Stack(
//            children: [
//              Row(
//                children: [
//                  Padding(
//                    padding: EdgeInsets.all(8),
//                    child: Container(
//                      width: 100,
//                      height: media.height / 4.5,
//                      decoration: BoxDecoration(
//                          image: DecorationImage(
//                              image: NetworkImage(
//                                product.product.image,
//                              ),
//                              fit: BoxFit.fill)),
//                    ),
//                  ),
//                  Container(
//                    width: 100,
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: [
//                        Padding(
//                          padding: const EdgeInsets.only(
//                              top: 10, right: 10, left: 10, bottom: 5),
//                          child: SizedBox(
//                              // height: 45,
//                              width: media.width * 0.50,
//                              child: Text(
//                                '${product.product.name ?? "item"}',
//                                maxLines: 2,
//                              )),
//                        ),
//                        Padding(
//                          padding: const EdgeInsets.only(
//                              top: 0, right: 10, left: 10, bottom: 5),
//                          child: Text(
//                            '${product.product.name ?? ""} ',
//                            style: TextStyle(
//                                color: Colors.black,
//                                fontWeight: FontWeight.bold),
//                          ),
//                        ),
//                        Padding(
//                          padding: const EdgeInsets.only(
//                              top: 0, right: 10, left: 10, bottom: 0.0),
//                          child: Row(
//                            children: [
//                              Text(
//                                // '${price}',
//                                "${product.price}",
//                                overflow: TextOverflow.ellipsis,
//                                style: TextStyle(
//                                    color: Colors.red,
//                                    fontSize: 12,
//                                    fontWeight: FontWeight.bold),
//                              ),
//                              const SizedBox(
//                                width: 5,
//                              ),
//                              Text('SAR', style: TextStyle(fontSize: 14)),
//                            ],
//                          ),
//                        ),
//                        // vendor!= null && vendor.has_delivery == true
//                        //     ?
//                        // Padding(
//                        //   padding:
//                        //   const EdgeInsets.all(8.0),
//                        //   child: Row(
//                        //     children: [
//                        //       Padding(
//                        //         padding:
//                        //         const EdgeInsets.all(
//                        //             3.0),
//                        //         child: Container(
//                        //           width: 15,
//                        //           height: 15,
//                        //           decoration:
//                        //           BoxDecoration(
//                        //               color: Colors.white,
//                        //               shape: BoxShape
//                        //                   .circle),
//                        //           child: Center(
//                        //               child: Image.asset(
//                        //                 'images/check.png',
//                        //                 width: 15,
//                        //               )),
//                        //         ),
//                        //       ),
//                        //       Text('متاح التوصيل',
//                        //           style: TextStyle(
//                        //               fontSize: 12,
//                        //               color: Colors.black,
//                        //               height: 1)),
//                        //     ],
//                        //   ),
//                        // )
//                        //     :
//                        // Padding(
//                        //   padding:
//                        //   const EdgeInsets.all(8.0),
//                        //   child: Row(
//                        //     children: [
//                        //       Padding(
//                        //         padding:
//                        //         const EdgeInsets.all(
//                        //             3.0),
//                        //         child: Container(
//                        //           width: 15,
//                        //           height: 15,
//                        //           decoration:
//                        //           BoxDecoration(
//                        //               color: Colors.white,
//                        //               shape: BoxShape
//                        //                   .circle),
//                        //           child: Center(
//                        //               child: Image.asset(
//                        //                 'images/uncheck.png',
//                        //                 width: 15,
//                        //               )),
//                        //         ),
//                        //       ),
//                        //       Text('غير متاح التوصيل',
//                        //           style: TextStyle(
//                        //               fontSize: 12,
//                        //               color: Colors.black,
//                        //               height: 1)),
//                        //     ],
//                        //   ),
//                        // ),
//                      ],
//                    ),
//                  ),
//                  // Expanded(
//                  //   child: Padding(
//                  //     padding: const EdgeInsets.only(
//                  //       left: 5,
//                  //       top: 50,
//                  //       right: 20,
//                  //     ),
//                  //     child: Container(
//                  //       height: 30,
//                  //       width: 80,
//                  //       child: Row(
//                  //         // mainAxisAlignment:
//                  //         // MainAxisAlignment.spaceBetween,
//                  //         children: [
//                  //           InkWell(
//                  //             onTap: addToCart,
//                  //             child: Container(
//                  //               width: 30,
//                  //               height: 30,
//                  //               child: Center(
//                  //                   child: Text(
//                  //                 '+',
//                  //                 style: TextStyle(
//                  //                     fontSize: 25,
//                  //                     color: Colors.white,
//                  //                     height: 1),
//                  //               )),
//                  //               color: Theme.of(context).primaryColor,
//                  //             ),
//                  //           ),
//                  //           Container(
//                  //             decoration: BoxDecoration(
//                  //                 border: Border(
//                  //                     top: BorderSide(
//                  //                         color: Colors.grey.shade400),
//                  //                     bottom: BorderSide(
//                  //                         color: Colors.grey.shade400))),
//                  //             width: 30,
//                  //             height: 29.5,
//                  //             child: Center(
//                  //                 child: Text(
//                  //               "$quantity",
//                  //               // '${pricingItems[index].product.cart_details[0]['quantity']}',
//                  //               style: TextStyle(
//                  //                   color: Colors.black54, fontSize: 14),
//                  //             )),
//                  //           ),
//                  //           InkWell(
//                  //             onTap: removeFromCart,
//                  //             child: Container(
//                  //               width: 30,
//                  //               height: 29,
//                  //               child: Center(
//                  //                   child: Text(
//                  //                 '-',
//                  //                 style: TextStyle(
//                  //                     fontSize: 25,
//                  //                     color: Colors.white,
//                  //                     height: 1),
//                  //               )),
//                  //               color: Theme.of(context).primaryColor,
//                  //             ),
//                  //           ),
//                  //         ],
//                  //       ),
//                  //       decoration: BoxDecoration(
//                  //         borderRadius: BorderRadius.circular(5),
//                  //       ),
//                  //     ),
//                  //   ),
//                  // )
//                ],
//              ),
//              inCart == true
//                  ? Positioned(
//                      top: 10,
//                      right: _locale == 'en' ? 10 : null,
//                      left: _locale == 'en' ? null : 10,
//                      child: InkWell(
//                        onTap: () {
//                          Provider.of<CartProvider>(context, listen: false)
//                              .deletFromCart(
//                                  product_id: product.product_id,
//                                  context: context,
//                                  locale: locale,
//                                  vendor_id: product.vendor_id)
//                              .then((value) {
//                            Provider.of<CartProvider>(context, listen: false)
//                                .getCartData(context, locale);
//                          });
//                        },
//                        child: Container(
//                          child: Image.asset(
//                            'images/delete.png',
//                            color: Colors.grey[500],
//                          ),
//                          width: 25,
//                          height: 25,
//                        ),
//                      ),
//                    )
//                  : const SizedBox(),
//            ],
//          ),
//        ),
//      ),
//      inCart == true
//          ? Positioned(
//              bottom: 20,
//              right: _locale == 'en' ? 10.0 : null,
//              left: _locale == 'en' ? null : 20.0,
//              child: Padding(
//                padding: const EdgeInsets.only(
//                  left: 5,
//                  top: 50,
//                  right: 20,
//                ),
//                child: Container(
//                  height: 30,
//                  // width: 80,
//                  child: Row(
//                    // mainAxisAlignment:
//                    // MainAxisAlignment.spaceBetween,
//                    children: [
//                      InkWell(
//                        onTap: addToCart,
//                        child: Container(
//                          width: 30,
//                          height: 30,
//                          child: Center(
//                              child: Text(
//                            '+',
//                            style: TextStyle(
//                                fontSize: 25, color: Colors.white, height: 1),
//                          )),
//                          color: Theme.of(context).primaryColor,
//                        ),
//                      ),
//                      Container(
//                        decoration: BoxDecoration(
//                            border: Border(
//                                top: BorderSide(color: Colors.grey.shade400),
//                                bottom:
//                                    BorderSide(color: Colors.grey.shade400))),
//                        width: 30,
//                        height: 29.5,
//                        child: Center(
//                            child: Text(
//                          "$quantity",
//                          // '${pricingItems[index].product.cart_details[0]['quantity']}',
//                          style: TextStyle(color: Colors.black54, fontSize: 14),
//                        )),
//                      ),
//                      InkWell(
//                        onTap: removeFromCart,
//                        child: Container(
//                          width: 30,
//                          height: 29,
//                          child: Center(
//                              child: Text(
//                            '-',
//                            style: TextStyle(
//                                fontSize: 25, color: Colors.white, height: 1),
//                          )),
//                          color: Theme.of(context).primaryColor,
//                        ),
//                      ),
//                    ],
//                  ),
//                  decoration: BoxDecoration(
//                    borderRadius: BorderRadius.circular(5),
//                  ),
//                ),
//              ))
//          : SizedBox()
//    ],
//  );
//}

//Widget faveCard(
//    {context,
//    locale,
//    productId,
//    String imagePath,
//    bool isFave = false,
//    Function onFavouriteChangeInUi,
//    cardTitle}) {
//  final media = MediaQuery.of(context).size;
//  return Container(
//    height: 200,
//    child: Padding(
//      padding: const EdgeInsets.all(8.0),
//      child: Stack(
//        children: [
//          Container(
//            width: media.width,
//            height: 200,
//            decoration: BoxDecoration(
//              color: Colors.transparent,
//              border: Border.all(color: Colors.grey[300]),
//              borderRadius: BorderRadius.circular(10),
//            ),
//            child: Column(
//              children: [
//                Expanded(
//                  child: Container(
//                      width: media.width,
//                      height: 200,
//                      decoration: BoxDecoration(
//                        borderRadius: BorderRadius.only(
//                            topLeft: Radius.circular(10),
//                            topRight: Radius.circular(11)),
//                      ),
//                      child: ClipRRect(
//                          child: imagePath == null
//                              ? Image.asset(
//                                  'images/placeholder.png',
//                                  fit: BoxFit.fill,
//                                  // width: 1000.0,
//                                )
//                              : Image.network("$imagePath", fit: BoxFit.fill,
//                                  loadingBuilder: (BuildContext context,
//                                      Widget child,
//                                      ImageChunkEvent loadingProgress) {
//                                  if (loadingProgress == null) return child;
//                                  return Center(
//                                    child: CircularProgressIndicator(
//                                      valueColor: AlwaysStoppedAnimation(
//                                          Theme.of(context).primaryColor),
//                                      value: loadingProgress
//                                                  .expectedTotalBytes !=
//                                              null
//                                          ? loadingProgress
//                                                  .cumulativeBytesLoaded /
//                                              loadingProgress.expectedTotalBytes
//                                          : null,
//                                    ),
//                                  );
//                                }, errorBuilder: (BuildContext context,
//                                      Object exception, StackTrace stackTrace) {
//                                  return Image.asset(
//                                    'images/placeholder.png',
//                                    fit: BoxFit.fill,
//                                  );
//                                }))),
//                ),
//                Padding(
//                  padding: const EdgeInsets.symmetric(horizontal: 5),
//                  child: Container(
//                    alignment:
//                        AppLocalizations.of(context).locale.languageCode == "ar"
//                            ? Alignment.centerRight
//                            : Alignment.centerLeft,
//                    child: Text(
//                      '${cardTitle}',
//                      style: TextStyle(
//                          fontSize: 11,
//                          color: Colors.black,
//                          //overflow: TextOverflow.ellipsis,
//                          fontFamily: 'CairoSemiBold'),
//                      overflow: TextOverflow.ellipsis,
//                      maxLines: 2,
//                    ),
//                  ),
//                ),
//              ],
//            ),
//          ),
//          Positioned(
//              top: 5,
//              left: 5,
//              child: InkWell(
//                onTap: () {
//                  if (onFavouriteChangeInUi != null) {
//                    onFavouriteChangeInUi();
//                  }
//                  Provider.of<ProductsProvider>(context, listen: false)
//                      .toggleFavourite(context: context, productId: productId)
//                      .then((_) {
//                    Provider.of<ProductsProvider>(context, listen: false)
//                        .getFavouritesList(context, locale);
//                  });
//                },
//                child: Container(
//                  height: 30,
//                  width: 40,
//                  child: Transform.scale(
//                      scale: 0.6,
//                      child: isFave
//                          ? Image.asset(
//                              'images/unlike.png',
//                              width: 12,
//                              height: 12,
//                              color: Colors.red,
//                            )
//                          : Image.asset(
//                              'images/unlike.png',
//                              width: 12,
//                              height: 12,
//                              color: Colors.grey[400],
//                            )),
//                ),
//              )),
//        ],
//      ),
//    ),
//  );
//}

Widget loader({@required context, @required size}) {
  return SpinKitWave(
    size: size,
    color: Theme.of(context).primaryColor,
  );
}

//Future<void> showMyDialog(context) async {
//  return showDialog<void>(
//    context: context,
//    barrierDismissible: false, // user must tap button!
//    builder: (BuildContext context) {
//      final media = MediaQuery.of(context).size;
//      return AlertDialog(
//        // title: Transform.scale (scale: 0.8,child: Image.asset("images/checked.png",width: 150,height: 150,)),
//        shape: RoundedRectangleBorder(
//            side: BorderSide(color: Colors.red),
//            borderRadius: BorderRadius.all(Radius.circular(12.0))),
//        contentPadding: EdgeInsets.only(top: 10.0),
//        content: Container(
//          height: 400,
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.start,
//            crossAxisAlignment: CrossAxisAlignment.center,
//            children: <Widget>[
//              SizedBox(
//                height: 20,
//              ),
//              Transform.scale(
//                  scale: 0.8,
//                  child: Image.asset(
//                    "images/checked.png",
//                    width: 150,
//                    height: 150,
//                  )),
//              Text(
//                  '${AppLocalizations.of(context).trans('order_send_success')}',
//                  style: TextStyle(
//                      fontSize: 14,
//                      color: Colors.grey[900],
//                      fontWeight: FontWeight.bold)),
//              SizedBox(
//                height: 10,
//              ),
//              // Text('${AppLocalizations.of(context).trans('order_no')}125487#',
//              //     style: TextStyle(
//              //         fontSize: 14,
//              //         color: Colors.grey[700],
//              //         fontWeight: FontWeight.normal)),
//              SizedBox(
//                height: 50,
//              ),
//              InkWell(
//                onTap: () {
//                  print('Confirmed');
//                  Navigator.push(context,
//                      MaterialPageRoute(builder: (context) => MyOrders()));
//                },
//                child: Container(
//                  width: 250,
//                  height: 45,
//                  decoration: BoxDecoration(color: Color(0xFF207cc4)),
//                  child: Center(
//                      child: Text(
//                    '${AppLocalizations.of(context).trans('track_orders')}',
//                    style: TextStyle(
//                        fontSize: 14,
//                        color: Colors.white,
//                        fontWeight: FontWeight.normal),
//                  )),
//                ),
//              ),
//              SizedBox(
//                height: 10,
//              ),
//              InkWell(
//                onTap: () {
//                  Provider.of<ChangeIndex>(context, listen: false)
//                      .changeIndexFunction(0);
//                  Navigator.pushNamed(context, NavigationHome.routName);
//                },
//                child: Container(
//                  width: 250,
//                  height: 45,
//                  decoration: BoxDecoration(color: Colors.grey[200]),
//                  child: Center(
//                      child: Text(
//                    '${AppLocalizations.of(context).trans('Home')}',
//                    style: TextStyle(
//                        fontSize: 14,
//                        fontWeight: FontWeight.normal,
//                        color: Color(0xFF207cc4)),
//                  )),
//                ),
//              )
//            ],
//          ),
//        ),
//        actions: <Widget>[],
//      );
//    },
//  );
//}
