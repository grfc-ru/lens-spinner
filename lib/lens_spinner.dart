library lens_spinner;

import 'dart:async';

import 'package:flutter/material.dart';

/// Here is a LENS spinner.
///
/// {@category Spinner}
class LensSpinner extends StatefulWidget {
  /// Width widget
  final double width;

  /// Repeat delay in seconds
  final int delay;

  /// Animation duration in milliseconds
  final int duration;

  /// Back line height
  final double backLineHeight;

  /// Back line color
  final Color backLineColor;

  /// Main line height
  final double mainLineHeight;

  /// Main line color
  final Color mainLineColor;

  /// Blur radius
  final double blurRadius;

  /// Spread radius
  final double spreadRadius;

  /// Shadow color
  final Color shadowColor;

  const LensSpinner({
    Key? key,
    required this.width,
    this.delay = 1,
    this.backLineHeight = 1,
    this.backLineColor = const Color(0xFF212121),
    this.mainLineHeight = 1,
    this.mainLineColor = Colors.blue,
    this.duration = 1000,
    this.blurRadius = 50.0,
    this.spreadRadius = 10.0,
    this.shadowColor = Colors.white,
  }) : super(key: key);

  @override
  State<LensSpinner> createState() => _LensSpinnerState();
}

class _LensSpinnerState extends State<LensSpinner> {
  double _width = 0.0;
  bool state = true;

  @override
  void initState() {
    Timer.periodic(Duration(seconds: widget.delay), (timer) {
      setState(() {
        _width == 0.0 ? _width = widget.width : _width = 0.0;
        state = !state;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Stack(
        children: [
          Center(
            child: Container(
              height: widget.backLineHeight,
              width: widget.width,
              color: widget.backLineColor,
            ),
          ),
          Align(
            alignment: state ? Alignment.centerRight : Alignment.centerLeft,
            child: AnimatedContainer(
              duration: Duration(milliseconds: widget.duration),
              curve: Curves.fastOutSlowIn,
              width: _width,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    height: widget.mainLineHeight,
                    color: widget.mainLineColor,
                  ),
                  Container(
                    width: 0,
                    height: 0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color:
                              state ? widget.shadowColor : Colors.transparent,
                          blurRadius: widget.blurRadius,
                          spreadRadius: widget.spreadRadius,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
