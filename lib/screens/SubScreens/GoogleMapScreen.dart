import 'package:coachstation/Helper/components.dart';
import 'package:flutter/material.dart';

class GoogleMapScreen extends StatefulWidget {
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          defaultAppBar(
            context: context,
            titleKey: 'map',
          ),
          SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
            child: Center(
                child: defaultButton(function: null, text: 'Show Map Here'),
            ),
          ),
              )),
        ],
      ),
    );
  }
}
