import 'dart:math';

import 'package:flutter/material.dart';

///
/// author: Vans Z
/// date: 2019-06-05
///

class BallClipRotateMultipleIndicator extends StatefulWidget {
  BallClipRotateMultipleIndicator({
    this.startAngle: 0,
    this.minRadius: 10,
    this.maxRadius: 20,
    this.dashCircleRadius: 10,
    this.color: Colors.white,
    this.duration: const Duration(milliseconds: 400),
  });

  final double startAngle;
  final double minRadius;
  final double maxRadius;
  final double dashCircleRadius;
  final Color color;
  final Duration duration;

  @override
  State<StatefulWidget> createState() => _BallClipRotateMultipleIndicator();
}

class _BallClipRotateMultipleIndicator
    extends State<BallClipRotateMultipleIndicator>
    with SingleTickerProviderStateMixin {
  late Animation<double> _radius;
  late Animation<double> _rotate;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(duration: widget.duration, vsync: this);
    _radius =
        Tween<double>(begin: widget.minRadius, end: widget.maxRadius).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0, 1, curve: Curves.fastOutSlowIn),
      ),
    );
    _rotate = Tween<double>(
      begin: 0,
      end: 180,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0, 1, curve: Curves.fastOutSlowIn),
      ),
    );
    _controller.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Size _measureSize() {
    return Size(2 * widget.maxRadius, 2 * widget.maxRadius);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          size: _measureSize(),
          painter: _BallClipRotateMultipleIndicatorPainter(
            angle: _rotate.value,
            radius: _radius.value,
            minRadius: widget.minRadius,
            maxRadius: widget.maxRadius,
            dashCircleRadius: widget.dashCircleRadius,
            startAngle: widget.startAngle,
            color: widget.color,
          ),
        );
      },
    );
  }
}

double _progress = .0;
double _lastExtent = .0;

class _BallClipRotateMultipleIndicatorPainter extends CustomPainter {
  _BallClipRotateMultipleIndicatorPainter({
    required this.angle,
    required this.radius,
    required this.minRadius,
    required this.maxRadius,
    required this.dashCircleRadius,
    required this.startAngle,
    required this.color,
  })  : outsideStartAngles = <double>[135, -45],
        insideStartAngles = <double>[225, 45];

  final double angle;
  final double radius;
  final double minRadius;
  final double maxRadius;
  final double dashCircleRadius;
  final double startAngle;
  final List<double> outsideStartAngles;
  final List<double> insideStartAngles;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2
      ..color = color;

    _progress += (_lastExtent - angle).abs();
    _lastExtent = angle;
    if (_progress >= double.maxFinite) {
      _progress = .0;
      _lastExtent = .0;
    }

    var halfWidth = size.width * .5;
    var halfHeight = size.height * .5;

    canvas.save();
    canvas.translate(halfWidth, halfHeight);
    canvas.rotate((_progress + startAngle) * pi / 180);
    var preScale = minRadius / maxRadius;
    var scale = preScale + (radius - minRadius) / maxRadius;
    canvas.scale(scale);

    for (var i = 0; i < outsideStartAngles.length; i++) {
      Rect rect =
          Rect.fromLTWH(-halfWidth, -halfHeight, size.width, size.height);
      canvas.drawArc(
          rect, outsideStartAngles[i] * pi / 180, 90 * pi / 180, false, paint);
    }
    canvas.restore();

    canvas.save();
    var dashCircleSize = dashCircleRadius * 2;
    canvas.translate(halfWidth, halfHeight);
    canvas.rotate((-_progress + startAngle) * pi / 180);
    canvas.scale(scale);
    for (var i = 0; i < insideStartAngles.length; i++) {
      Rect rect = Rect.fromLTWH(
          -dashCircleRadius, -dashCircleRadius, dashCircleSize, dashCircleSize);
      canvas.drawArc(
          rect, insideStartAngles[i] * pi / 180, 90 * pi / 180, false, paint);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
