library lens_spinner;

import 'dart:async';

import 'package:flutter/material.dart';

/// Here is a LENS spinner.
///
/// {@category Spinner}
class LensSpinner extends StatefulWidget {
  final double width;
  final int delay;
  final int duration;
  final double backLineHeight;
  final Color backLineColor;
  final double mainLineHeight;
  final Color mainLineColor;
  final double blurRadius;
  final double spreadRadius;
  final Color shadowColor;

  const LensSpinner({
    Key? key,

    /// Width widget
    required this.width,

    /// Repeat delay in seconds
    this.delay = 1,

    /// Animation duration in milliseconds
    this.duration = 1000,

    /// Back line height
    this.backLineHeight = 1,

    /// Back line color
    this.backLineColor = const Color(0xFF212121),

    /// Main line height
    this.mainLineHeight = 1,

    /// Main line color
    this.mainLineColor = Colors.blue,

    /// Blur radius
    this.blurRadius = 50.0,

    /// Spread radius
    this.spreadRadius = 1.0,

    /// Shadow color
    this.shadowColor = Colors.white,
  }) : super(key: key);

  @override
  State<LensSpinner> createState() => _LensSpinnerState();
}

/// State for LensSpinner class
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
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [
                          widget.mainLineColor,
                          widget.mainLineColor,
                          widget.backLineColor,
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: widget.shadowColor,
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
