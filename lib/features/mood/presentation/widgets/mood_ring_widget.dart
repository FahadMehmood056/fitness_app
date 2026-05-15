// ignore_for_file: deprecated_member_use

import 'dart:math';
import 'package:fitness_app/core/constants/app_colors.dart';
import 'package:fitness_app/core/constants/app_text_styles.dart';
import 'package:fitness_app/core/utils/sb.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../bloc/mood_bloc.dart';

class MoodRingWidget extends StatelessWidget {
  final MoodLoaded state;
  const MoodRingWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 280,
          height: 280,
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              CustomPaint(
                size: const Size(280, 280),
                painter: _MoodRingPainter(),
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) => FadeTransition(
                  opacity: animation,
                  child: ScaleTransition(
                    scale: Tween<double>(
                      begin: 0.85,
                      end: 1.0,
                    ).animate(animation),
                    child: child,
                  ),
                ),
                child: SvgPicture.asset(
                  state.selectedMood.icon,
                  key: ValueKey(state.selectedMood),
                  width: 110,
                  height: 110,
                ),
              ),
              _DraggableDotWidget(state: state),
            ],
          ),
        ),
        SB.h(16),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Text(
            state.selectedMood.label,
            key: ValueKey(state.selectedMood),
            style: AppTextStyles.body.copyWith(
              fontSize: 28,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class _DraggableDotWidget extends StatefulWidget {
  final MoodLoaded state;

  static const double ringRadius = 122.0;
  static const double dotSize = 60.0;
  static const double center = 140.0;

  const _DraggableDotWidget({required this.state});

  @override
  State<_DraggableDotWidget> createState() => _DraggableDotWidgetState();
}

class _DraggableDotWidgetState extends State<_DraggableDotWidget> {
  late double _angle;

  DateTime _lastBlocUpdate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _angle = widget.state.currentAngle;
  }

  @override
  void didUpdateWidget(_DraggableDotWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.state.selectedMood != widget.state.selectedMood) {
      setState(() {
        _angle = widget.state.currentAngle;
      });
    }
  }

  void _onPanUpdate(DragUpdateDetails details) {
    final double x = _DraggableDotWidget.ringRadius * cos(_angle);
    final double y = _DraggableDotWidget.ringRadius * sin(_angle);

    final double newX = x + details.delta.dx;
    final double newY = y + details.delta.dy;
    final double newAngle = atan2(newY, newX);

    setState(() => _angle = newAngle);

    final now = DateTime.now();
    if (now.difference(_lastBlocUpdate).inMilliseconds > 100) {
      _lastBlocUpdate = now;
      context.read<MoodBloc>().add(UpdateDotAngle(newAngle));
    }
  }

  void _onPanEnd(DragEndDetails details) {
    context.read<MoodBloc>().add(UpdateDotAngle(_angle));
  }

  @override
  Widget build(BuildContext context) {
    final double x = _DraggableDotWidget.ringRadius * cos(_angle);
    final double y = _DraggableDotWidget.ringRadius * sin(_angle);

    return Positioned(
      left: _DraggableDotWidget.center + x - _DraggableDotWidget.dotSize / 2,
      top: _DraggableDotWidget.center + y - _DraggableDotWidget.dotSize / 2,
      child: GestureDetector(
        onPanUpdate: _onPanUpdate,
        onPanEnd: _onPanEnd,
        child: Container(
          width: _DraggableDotWidget.dotSize,
          height: _DraggableDotWidget.dotSize,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _MoodRingPainter extends CustomPainter {
  static const int _segmentCount = 11;
  static const double _strokeWidth = 36.0;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 2) - _strokeWidth / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);

    _drawGlow(canvas, center, rect, radius);
    _drawRingSegments(canvas, rect);
    _drawDividers(canvas, center, radius);
    _drawInnerCircle(canvas, center, radius);
  }

  void _drawGlow(Canvas canvas, Offset center, Rect rect, double radius) {
    final glowPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 56
      ..shader = SweepGradient(
        startAngle: -pi,
        endAngle: pi,
        colors: [
          const Color(0xFFF99955).withOpacity(0.18),
          const Color(0xFFF0B898).withOpacity(0.10),
          const Color(0xFF6EB9AD).withOpacity(0.12),
          const Color(0xFF9BBDE8).withOpacity(0.12),
          const Color(0xFFC9BBEF).withOpacity(0.12),
          const Color(0xFFF28DB3).withOpacity(0.10),
          const Color(0xFFF5A090).withOpacity(0.14),
          const Color(0xFFF99955).withOpacity(0.18),
        ],
      ).createShader(rect)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 22);
    canvas.drawCircle(center, radius, glowPaint);
  }

  void _drawRingSegments(Canvas canvas, Rect rect) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = _strokeWidth
      ..strokeCap = StrokeCap.butt
      ..shader = SweepGradient(
        startAngle: 0,
        endAngle: 2 * pi,
        colors: const [
          Color(0xFF6EB9AD),
          Color(0xFF9BBDE8),
          Color(0xFFC9BBEF),
          Color(0xFFD4A8E0),
          Color(0xFFF28DB3),
          Color(0xFFF5A090),
          Color(0xFFF99955),
          Color(0xFFF0B898),
          Color(0xFF8CCEC4),
          Color(0xFF6EB9AD),
        ],
        stops: const [
          0.00,
          0.11,
          0.22,
          0.33,
          0.44,
          0.55,
          0.66,
          0.77,
          0.88,
          1.00,
        ],
      ).createShader(rect);
    canvas.drawArc(rect, -pi / 2, 2 * pi, false, paint);
  }

  void _drawDividers(Canvas canvas, Offset center, double radius) {
    final sweepAngle = (2 * pi) / _segmentCount;
    final innerR = radius - _strokeWidth / 2;
    final outerR = radius + _strokeWidth / 2;
    const tiltRad = 1.0 * pi / 180.0;
    final dividerPaint = Paint()
      ..color = Colors.white.withOpacity(0.5)
      ..strokeWidth = 1.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    for (int i = 0; i < _segmentCount; i++) {
      final boundaryAngle = i * sweepAngle - pi;
      final startA = boundaryAngle - tiltRad;
      final endA = boundaryAngle + tiltRad;
      canvas.drawLine(
        Offset(
          center.dx + innerR * cos(startA),
          center.dy + innerR * sin(startA),
        ),
        Offset(center.dx + outerR * cos(endA), center.dy + outerR * sin(endA)),
        dividerPaint,
      );
    }
  }

  void _drawInnerCircle(Canvas canvas, Offset center, double radius) {
    canvas.drawCircle(
      center,
      radius - _strokeWidth / 2 + 1,
      Paint()
        ..color = AppColors.scaffoldBg
        ..style = PaintingStyle.fill,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
