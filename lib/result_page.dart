import 'dart:math';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  final double bmiResult;
  final String resultText;

  const ResultPage({
    super.key,
    required this.bmiResult ,
    required this.resultText , //health
  });

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _bmiAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    _bmiAnimation = Tween<double>(
      begin: 0.0,
      end: widget.bmiResult,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F171A),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF0F171A),
        elevation: 0,
        title: const Text(
          "Result View",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.9,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: .center,
          children: [
            const Text(
              "Your BMI RESULT",
              style: TextStyle(
                color: Color.fromARGB(255, 30, 120, 66),
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: -1,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 28.0,
                  horizontal: 20.0,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF162226),
                  borderRadius: BorderRadius.circular(28.0),
                  border: Border.all(
                    color: const Color(0xFF00E676).withOpacity(0.15),
                    width: 1.5,
                  ),
                ),
                child: AnimatedBuilder(
                  animation: _bmiAnimation,
                  builder: (context, child) {
                    double currentValue = _bmiAnimation.value;

                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // ------------ painter------------
                        SizedBox(
                          width: 220,
                          height: 140,
                          child: CustomPaint(
                            painter: BmiGaugePainter(bmiValue: currentValue),
                          ),
                        ),
                        const SizedBox(height: 8.0),

                        // ------------ number BMI------------
                        Text(
                          currentValue.toStringAsFixed(1),
                          style: const TextStyle(
                            fontSize: 52.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            letterSpacing: -1.5,
                            height: 1.0,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        const Text(
                          'kg/m²',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF64748B),
                          ),
                        ),
                        const SizedBox(height: 20.0),

                        // state result
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF112520),
                            borderRadius: BorderRadius.circular(30.0),
                            border: Border.all(
                              color: const Color(0xFF00E676).withOpacity(0.4),
                              width: 1.0,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 8.0,
                                height: 8.0,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF00E676),
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFF00E676),
                                      blurRadius: 6,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              Text(
                                widget.resultText,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF00E676),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 25,),
            SizedBox(
                width: 270.0,
                height: 54.0,
                child: ElevatedButton(
                  onPressed: () {
                     
                       Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00E676),
                    elevation: 8.0,
                    shadowColor: const Color(0xFF00E676).withOpacity(0.35),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      Text(
                        'RECALCULATE BMI',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0F171A),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

//  Painter 
class BmiGaugePainter extends CustomPainter {
  final double bmiValue;

  BmiGaugePainter({required this.bmiValue});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height * 0.85);
    final radius = size.width * 0.42;
    const strokeWidth = 12.0;

    const startAngle = pi;
    const totalSweepAngle = pi;

    final backgroundPaint = Paint()
      ..color = const Color(0xFF233138)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      totalSweepAngle,
      false,
      backgroundPaint,
    );

    double progressFraction = ((bmiValue - 10) / 30).clamp(0.0, 1.0);
    double activeSweepAngle = totalSweepAngle * progressFraction;

    final activeGlowPaint = Paint()
      ..color = const Color(0xFF00E676).withOpacity(0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth + 6
      ..strokeCap = StrokeCap.round
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);

    final activePaint = Paint()
      ..color = const Color(0xFF00E676)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    if (activeSweepAngle > 0) {
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        activeSweepAngle,
        false,
        activeGlowPaint,
      );

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        activeSweepAngle,
        false,
        activePaint,
      );
    }

    final tickPaint = Paint()
      ..color = const Color(0xFF162226)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;

    for (int i = 1; i < 12; i++) {
      double angle = startAngle + (totalSweepAngle / 12) * i;
      double innerR = radius - (strokeWidth / 2);
      double outerR = radius + (strokeWidth / 2);

      Offset startPoint = Offset(
        center.dx + innerR * cos(angle),
        center.dy + innerR * sin(angle),
      );
      Offset endPoint = Offset(
        center.dx + outerR * cos(angle),
        center.dy + outerR * sin(angle),
      );

      canvas.drawLine(startPoint, endPoint, tickPaint);
    }

    _drawTickText(canvas, center, radius, startAngle, "0");
    _drawTickText(canvas, center, radius, startAngle + (totalSweepAngle * 0.283), "18.5", color: const Color(0xFF00E676));
    _drawTickText(canvas, center, radius, startAngle + (totalSweepAngle * 0.5), "25", color: const Color(0xFF00E676));
    _drawTickText(canvas, center, radius, startAngle + (totalSweepAngle * 0.666), "30");
    _drawTickText(canvas, center, radius, startAngle + totalSweepAngle, "40");

    double needleAngle = startAngle + activeSweepAngle;

    final needlePaint = Paint()
      ..color = const Color(0xFF00E676)
      ..strokeWidth = 3.5
      ..strokeCap = StrokeCap.round;

    Offset needleEnd = Offset(
      center.dx + (radius - 6) * cos(needleAngle),
      center.dy + (radius - 6) * sin(needleAngle),
    );

    canvas.drawLine(center, needleEnd, needlePaint);

    final hubOutlinePaint = Paint()
      ..color = const Color(0xFF233138)
      ..style = PaintingStyle.fill;

    final hubInnerPaint = Paint()
      ..color = const Color(0xFF00E676)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, 9.0, hubOutlinePaint);
    canvas.drawCircle(center, 5.0, hubInnerPaint);

    final tipDotPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawCircle(needleEnd, 3.5, tipDotPaint);
  }

  void _drawTickText(Canvas canvas, Offset center, double radius, double angle, String text, {Color color = const Color(0xFF64748B)}) {
    double textRadius = radius + 18.0;
    Offset textPos = Offset(
      center.dx + textRadius * cos(angle),
      center.dy + textRadius * sin(angle),
    );

    final textSpan = TextSpan(
      text: text,
      style: TextStyle(
        color: color,
        fontSize: 11.0,
        fontWeight: FontWeight.bold,
      ),
    );

    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    Offset finalPos = Offset(
      textPos.dx - (textPainter.width / 2),
      textPos.dy - (textPainter.height / 2),
    );

    textPainter.paint(canvas, finalPos);
  }

  @override
  bool shouldRepaint(covariant BmiGaugePainter oldDelegate) {
    return oldDelegate.bmiValue != bmiValue;
  }
}