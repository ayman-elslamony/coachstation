import 'package:coachstation/Localization/app_localizations.dart';
import 'package:coachstation/screens/SubScreens/GoogleMapScreen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

const defaultColor = const Color(0xFFf1c40e);

Widget defaultButton({
  double width = double.infinity,
  Color background = defaultColor,
  bool isUpperCase = true,
  double radius = 18.0,
  @required Function function,
  @required String text,
}) =>
    Container(
      width: width,
      height: 48.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            fontFamily: 'CairoRegular',
            color: Colors.black,
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );
Widget defaultShowTime({BuildContext context,String textTime}){
  return Row(
  children: [
  Container(
  decoration: BoxDecoration(
  border: Border.all(
  color: Colors.red[500],
  ),
  color: Colors.red,
  borderRadius: BorderRadius.all(
  Radius.circular(20),
  ),
  ),
  width: 12,
  height: 12,
  child: SizedBox()),
  SizedBox(width: 5.0,),
  defaultSubtitleTextTwo(
  context: context, text: textTime),
  ],
  );
}
Widget defaultCard({
  @required Function function,
  @required BuildContext context,
  @required String text,
  @required String imageUrl,
  @required double cardWidth,
  @required double containerTextWidth,
  @required double cardHeight,

}) =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              imageUrl,
              fit: BoxFit.fill,
              height: cardHeight ?? 100,
              width: cardWidth ?? 120,
            ),
          ),
          Container(
            height: 28,
            width: containerTextWidth,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10.0),
                    topLeft: Radius.circular(18.0))),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontFamily: 'CairoRegular',
                  fontSize: 16,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );

Widget defaultLocationWithIcon(
    {@required BuildContext context, String textLocation}) {
  return InkWell(
    onTap: (){
      navigateTo(context, GoogleMapScreen());
    },
    child: Row(
      children: [
        ImageIcon(
          AssetImage('images/locationMark.png'),
          size: 15,
          color: Colors.red,
        ),
        SizedBox(
          width: 5.0,
        ),
        defaultSubtitleTextTwo(context: context, text: textLocation),
      ],
    ),
  );
}

Widget defaultArticle({
  @required Function function,
  @required BuildContext context,
  @required String textTitle,
  @required String textSubTitle,
  @required String imageUrl,
  @required double articleWidth,
  @required double articleHeight,
}) =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: articleHeight,
        width: articleWidth,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Align(
              alignment: AlignmentDirectional.topCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.fill,
                  height: articleHeight * 0.65,
                  width: articleWidth,
                ),
              ),
            ),
            Container(
              width: articleWidth,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  )),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 6.0),
                title: Text(
                  textTitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'CairoRegular',
                    fontSize: 15,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  textSubTitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'CairoRegular',
                    fontSize: 11,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );

Widget defaultTextButton({
  @required Function function,
  @required BuildContext context,
  @required String textKey,
}) =>
    TextButton(
      onPressed: function,
      child: Text(
        '${AppLocalizations.of(context).trans(textKey)}',
        style: TextStyle(
          fontFamily: 'CairoRegular',
          color: defaultColor,
          fontSize: 18,
        ),
      ),
    );

Widget defaultSubtitleTextOne({
  @required BuildContext context,
  @required String text,
  Color color
}) =>
    Text(
      text,
      style: TextStyle(
        fontFamily: 'CairoRegular',
        fontSize: 16,
        color: color??Colors.grey[800],
        fontWeight: FontWeight.bold,
      ),
    );

Widget defaultSubtitleTextTwo(
        {@required BuildContext context,
        @required String text,
        Color textColor}) =>
    Text(
      text,
      style: TextStyle(
        fontFamily: 'CairoRegular',
        fontSize: 14,
        color: textColor ?? Colors.grey[800],
        fontWeight: FontWeight.bold,
      ),
    );

Widget defaultFormField({
  @required TextEditingController controller,
  @required TextInputType type,
  Function onSubmit,
  Function onChange,
  Function onTap,
  bool isPassword = false,
  @required Function validate,
  String label,
  IconData prefix,
  IconData suffix,
  Function suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      cursorColor: defaultColor,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Colors.grey[300])),
        focusedErrorBorder: textFormFieldBorder,
        focusedBorder: textFormFieldBorder,
        disabledBorder: textFormFieldBorder,
        errorBorder: textFormFieldBorder,
        errorStyle: TextStyle(color: defaultColor),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Colors.grey[300])),
      ),
    );
OutlineInputBorder textFormFieldBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15.0),
    borderSide: BorderSide(color: defaultColor));

Widget defaultAppBar({
  @required BuildContext context,
  String titleKey,
  List<Widget> actions,
  Function onClickedBackButton
}) =>
    SliverAppBar(
      leading: IconButton(
          onPressed: onClickedBackButton==null?() {
            Navigator.pop(context);
          }:onClickedBackButton,
          icon: const ImageIcon(
            AssetImage(
              'images/arrowLeft.png',
            ),
            size: 23,
          )),
      title: Text(
        '${AppLocalizations.of(context).trans(titleKey)}',
      ),
      titleSpacing: 2.0,
      actions: actions,
    );

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(start: 30.0, end: 30.0),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(
  context,
  widget,
) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) {
        return false;
      },
    );

void showToast({
  @required String text,
  @required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

// enum
enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;

  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }

  return color;
}

//
//Widget buildTaskItem(Map model, context) => Dismissible(
//      key: Key(model['id'].toString()),
//      child: Padding(
//        padding: const EdgeInsets.all(20.0),
//        child: Row(
//          children: [
//            CircleAvatar(
//              radius: 40.0,
//              child: Text(
//                '${model['time']}',
//              ),
//            ),
//            SizedBox(
//              width: 20.0,
//            ),
//            Expanded(
//              child: Column(
//                mainAxisSize: MainAxisSize.min,
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: [
//                  Text(
//                    '${model['title']}',
//                    style: TextStyle(
//                      fontSize: 18.0,
//                      fontWeight: FontWeight.bold,
//                    ),
//                  ),
//                  Text(
//                    '${model['date']}',
//                    style: TextStyle(
//                      color: Colors.grey,
//                    ),
//                  ),
//                ],
//              ),
//            ),
//            SizedBox(
//              width: 20.0,
//            ),
//            IconButton(
//              onPressed: () {
//                AppCubit.get(context).updateData(
//                  status: 'done',
//                  id: model['id'],
//                );
//              },
//              icon: Icon(
//                Icons.check_box,
//                color: Colors.green,
//              ),
//            ),
//            IconButton(
//              onPressed: () {
//                AppCubit.get(context).updateData(
//                  status: 'archive',
//                  id: model['id'],
//                );
//              },
//              icon: Icon(
//                Icons.archive,
//                color: Colors.black45,
//              ),
//            ),
//          ],
//        ),
//      ),
//      onDismissed: (direction) {
//        AppCubit.get(context).deleteData(
//          id: model['id'],
//        );
//      },
//    )
//
//Widget tasksBuilder({
//  @required List<Map> tasks,
//}) =>
//    ConditionalBuilder(
//      condition: tasks.length > 0,
//      builder: (context) => ListView.separated(
//        itemBuilder: (context, index) {
//          return buildTaskItem(tasks[index], context);
//        },
//        separatorBuilder: (context, index) => myDivider(),
//        itemCount: tasks.length,
//      ),
//      fallback: (context) => Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: [
//            Icon(
//              Icons.menu,
//              size: 100.0,
//              color: Colors.grey,
//            ),
//            Text(
//              'No Tasks Yet, Please Add Some Tasks',
//              style: TextStyle(
//                fontSize: 16.0,
//                fontWeight: FontWeight.bold,
//                color: Colors.grey,
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//Widget buildArticleItem(article, context) => InkWell(
//      onTap: () {
//        navigateTo(
//          context,
//          WebViewScreen(article['url']),
//        );
//      },
//      child: Padding(
//        padding: const EdgeInsets.all(20.0),
//        child: Row(
//          children: [
//            Container(
//              width: 120.0,
//              height: 120.0,
//              decoration: BoxDecoration(
//                borderRadius: BorderRadius.circular(
//                  10.0,
//                ),
//                image: DecorationImage(
//                  image: NetworkImage('${article['urlToImage']}'),
//                  fit: BoxFit.cover,
//                ),
//              ),
//            ),
//            SizedBox(
//              width: 20.0,
//            ),
//            Expanded(
//              child: Container(
//                height: 120.0,
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  mainAxisAlignment: MainAxisAlignment.start,
//                  children: [
//                    Expanded(
//                      child: Text(
//                        '${article['title']}',
//                        style: Theme.of(context).textTheme.bodyText1,
//                        maxLines: 3,
//                        overflow: TextOverflow.ellipsis,
//                      ),
//                    ),
//                    Text(
//                      '${article['publishedAt']}',
//                      style: TextStyle(
//                        color: Colors.grey,
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//            ),
//            SizedBox(
//              width: 15.0,
//            ),
//          ],
//        ),
//      ),
//    );
//
//Widget articleBuilder(list, context, {isSearch = false}) => ConditionalBuilder(
//      condition: list.length > 0,
//      builder: (context) => ListView.separated(
//        physics: BouncingScrollPhysics(),
//        itemBuilder: (context, index) => buildArticleItem(list[index], context),
//        separatorBuilder: (context, index) => myDivider(),
//        itemCount: 10,
//      ),
//      fallback: (context) =>
//          isSearch ? Container() : Center(child: CircularProgressIndicator()),
//    );

//Widget buildListProduct(
//  model,
//  context, {
//  bool isOldPrice = true,
//}) =>
//    Padding(
//      padding: const EdgeInsets.all(20.0),
//      child: Container(
//        height: 120.0,
//        child: Row(
//          children: [
//            Stack(
//              alignment: AlignmentDirectional.bottomStart,
//              children: [
//                Image(
//                  image: NetworkImage(model.image),
//                  width: 120.0,
//                  height: 120.0,
//                ),
//                if (model.discount != 0 && isOldPrice)
//                  Container(
//                    color: Colors.red,
//                    padding: EdgeInsets.symmetric(
//                      horizontal: 5.0,
//                    ),
//                    child: Text(
//                      'DISCOUNT',
//                      style: TextStyle(
//                        fontSize: 8.0,
//                        color: Colors.white,
//                      ),
//                    ),
//                  ),
//              ],
//            ),
//            SizedBox(
//              width: 20.0,
//            ),
//            Expanded(
//              child: Column(
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: [
//                  Text(
//                    model.name,
//                    maxLines: 2,
//                    overflow: TextOverflow.ellipsis,
//                    style: TextStyle(
//                      fontSize: 14.0,
//                      height: 1.3,
//                    ),
//                  ),
//                  Spacer(),
//                  Row(
//                    children: [
//                      Text(
//                        model.price.toString(),
//                        style: TextStyle(
//                          fontSize: 12.0,
//                          color: defaultColor,
//                        ),
//                      ),
//                      SizedBox(
//                        width: 5.0,
//                      ),
//                      if (model.discount != 0 && isOldPrice)
//                        Text(
//                          model.oldPrice.toString(),
//                          style: TextStyle(
//                            fontSize: 10.0,
//                            color: Colors.grey,
//                            decoration: TextDecoration.lineThrough,
//                          ),
//                        ),
//                      Spacer(),
//                      IconButton(
//                        onPressed: () {
//                          ShopCubit.get(context).changeFavorites(model.id);
//                        },
//                        icon: CircleAvatar(
//                          radius: 15.0,
//                          backgroundColor:
//                              ShopCubit.get(context).favorites[model.id]
//                                  ? defaultColor
//                                  : Colors.grey,
//                          child: Icon(
//                            Icons.favorite_border,
//                            size: 14.0,
//                            color: Colors.white,
//                          ),
//                        ),
//                      ),
//                    ],
//                  ),
//                ],
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
