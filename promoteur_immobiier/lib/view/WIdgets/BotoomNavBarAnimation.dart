import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math';

import '../../constants.dart';

class BotomNavBaranimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        //<-- main stack
        children: <Widget>[
          //<-- content of page
          ExhibitionBottomSheet(), //<-- bottom sheet
        ],
      ),
    );
  }
}

const double iconStartSize = 40;
const double iconEndSize = 120;
const double iconStartMarginTop = 36;
const double iconEndMarginTop = 60;
const double iconsVerticalSpacing = 24;
const double iconsHorizontalSpacing = 16;

const double minHeight = 60;

class ExhibitionBottomSheet extends StatefulWidget {
  @override
  _ExhibitionBottomSheetState createState() => _ExhibitionBottomSheetState();
}

class _ExhibitionBottomSheetState extends State<ExhibitionBottomSheet>
    with SingleTickerProviderStateMixin {
  double get itemBorderRadius => lerp(8, 24);

  double get iconLeftBorderRadius => itemBorderRadius;

  /*double get iconRightBorderRadius =>
      lerp(8, 0);*/ //<-- Right border radius lerps to 0 instead.

  double get iconSize => lerp(iconStartSize, iconEndSize);

  AnimationController _controller;

  double get maxHeight => MediaQuery.of(context).size.height;

//information sur le header
  double get headerTopMargin =>
      lerp(25, 20 + MediaQuery.of(context).padding.top);
  double get headerFontSize => lerp(14, 24);
//

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      //<-- initialize a controller
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); //<-- and remember to dispose it!
    super.dispose();
  }

//calcule de margin quand on l'agrondie
  double iconTopMargin(int index) =>
      lerp(iconStartMarginTop,
          iconEndMarginTop + index * (iconsVerticalSpacing + iconEndSize)) +
      headerTopMargin;

  double iconLeftMargin(int index) =>
      lerp(index * (iconsHorizontalSpacing + iconStartSize), 0);

  double lerp(double min, double max) =>
      lerpDouble(min, max, _controller.value); //faserha

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: lerp(minHeight, maxHeight),
            child: GestureDetector(
              onTap: _toggle,

              onVerticalDragUpdate:
                  _handleDragUpdate, //<-- Add verticalDragUpdate callback

              onVerticalDragEnd: _handleDragEnd,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 32),
                decoration: const BoxDecoration(
                  color: kMainColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                ),
                child: Stack(
                  //<-- Add a stack
                  children: <Widget>[
                    MenuButton(),
                    SheetHeader(
                      //<-- Add a header with params
                      fontSize: headerFontSize,
                      topMargin: headerTopMargin,
                    ),
                    for (Event event in events)
                      _buildFullItem(event), //<-- Add FullItems

                    for (Event event in events)
                      _buildIcon(event), //<-- With a menu button
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _buildIcon(Event event) {
    int index = events.indexOf(event); //<-- Get index of the event
    return Positioned(
      height: iconSize, //<-- Specify icon's size
      width: iconSize, //<-- Specify icon's size
      top: iconTopMargin(index), //<-- Specify icon's top margin
      left: iconLeftMargin(index), //<-- Specify icon's left margin
      child: ClipRRect(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(itemBorderRadius), //<-- Set the rounded corners
          right: Radius.circular(itemBorderRadius),
        ),
        child: Image.asset(
          'assets/${event.assetName}',
          fit: BoxFit.cover,
          alignment: Alignment(
              lerp(1, 0), 0), //<-- Play with alignment for extra style points
        ),
      ),
    );
  }

  Widget _buildFullItem(Event event) {
    int index = events.indexOf(event);
    return ExpandedEventItem(
      topMargin:
          iconTopMargin(index), //<--provide margins and height same as for icon
      leftMargin: iconLeftMargin(index),
      height: iconSize,
      isVisible:
          _controller.status == AnimationStatus.completed, //<--set visibility
      borderRadius: itemBorderRadius, //<-- pass border radius
      title: event.title, //<-- data to be displayed
      date: event.date, //<-- data to be displayed
    );
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    _controller.value -= details.primaryDelta /
        maxHeight; //<-- Update the _controller.value by the movement done by user.
  }

  void _handleDragEnd(DragEndDetails details) {
    if (_controller.isAnimating ||
        _controller.status == AnimationStatus.completed) return;

    final double flingVelocity = details.velocity.pixelsPerSecond.dy /
        maxHeight; //<-- calculate the velocity of the gesture
    if (flingVelocity < 0.0)
      _controller.fling(
          velocity: max(2.0, -flingVelocity)); //<-- either continue it upwards
    else if (flingVelocity > 0.0)
      _controller.fling(
          velocity: min(-2.0, -flingVelocity)); //<-- or continue it downwards
    else
      _controller.fling(
          velocity: _controller.value < 0.5
              ? -2.0
              : 2.0); //<-- or just continue to whichever edge is closer
  }

  void _toggle() {
    final bool isOpen = _controller.status == AnimationStatus.completed;
    _controller.fling(velocity: isOpen ? -2 : 2); //hethi!!
  }
}

class MenuButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      //<-- Align the icon to bottom right corner
      right: -3,
      bottom: 15,
      child: Icon(
        Icons.menu,
        color: Colors.white,
        size: 25,
      ),
    );
  }
}

class SheetHeader extends StatelessWidget {
  final double fontSize;
  final double topMargin;

  const SheetHeader(
      {Key key, @required this.fontSize, @required this.topMargin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: topMargin,
      child: Text(
        'Plus d\'information',
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

final List<Event> events = [
  Event('logo.jpg', 'Shenzhen GLOBAL DESIGN AWARD 2018', '4.20-30'),
  Event('s.jpg', 'Shenzhen GLOBAL DESIGN AWARD 2018', '4.20-30'),
  Event('s3.jpg', 'Dawan District Guangdong Hong Kong', '4.28-31'),
];

class Event {
  final String assetName;
  final String title;
  final String date;

  Event(this.assetName, this.title, this.date);
}

class ExpandedEventItem extends StatelessWidget {
  final double topMargin;
  final double leftMargin;
  final double height;
  final bool isVisible;
  final double borderRadius;
  final String title;
  final String date;

  const ExpandedEventItem({
    Key key,
    this.topMargin,
    this.height,
    this.isVisible,
    this.borderRadius,
    this.title,
    this.date,
    this.leftMargin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: topMargin,
      left: leftMargin,
      right: 0,
      height: height,
      child: AnimatedOpacity(
        opacity: isVisible ? 1 : 0,
        duration: Duration(milliseconds: 200),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: Colors.white,
          ),
          padding: EdgeInsets.only(left: height).add(EdgeInsets.all(8)),
          child: _buildContent(),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      children: <Widget>[
        Text(title, style: TextStyle(fontSize: 16)),
        SizedBox(height: 8),
        Row(
          children: <Widget>[
            Text(
              '1 ticket',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
            SizedBox(width: 8),
            Text(
              date,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        Spacer(),
        Row(
          children: <Widget>[
            Icon(
              Icons.place,
              color: Colors.grey.shade400,
              size: 16,
            ),
            Text(
              'Science Park 10 25A',
              style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 13,
              ),
            )
          ],
        )
      ],
    );
  }
}
