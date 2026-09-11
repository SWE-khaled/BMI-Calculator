import 'package:bmi_application/result_page.dart';
import 'package:flutter/material.dart';

enum Type { Male, Female }

class BmiPage extends StatefulWidget {
  const BmiPage({super.key});

  @override
  State<BmiPage> createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  double height = 175;
  Type type = Type.Male;
  int weight = 70;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F171A),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 40,
            left: 20,
            right: 10,
            bottom: 14,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 11, 18, 20),
                    radius: 20,
                    child: Icon(
                      Icons.speed_rounded,
                      color: Color(0xFF00E676),
                      size: 15,
                    ),
                  ),
                  SizedBox(width: 4),
                  Text(
                    "BMI Tracker",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      letterSpacing: 0.3,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "METRICS SETUP",
                    style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF9EAEC0), // Muted grey/gold tint
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Body Profile',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: -0.5,
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1B2B28),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFF00E676).withOpacity(0.3),
                      ),
                    ),
                    child: const Icon(
                      Icons.monitor_weight_outlined,
                      color: Color(0xFF00E676),
                      size: 20,
                    ),
                  ),

                  SizedBox(width: 10),
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1B2B28),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFF00E676).withOpacity(0.3),
                      ),
                    ),
                    child: const Icon(
                      Icons.pie_chart_outline,
                      color: Color(0xFF00E676),
                      size: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6),

              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          type = Type.Male;
                        });
                      },
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 24.0,
                          horizontal: 16.0,
                        ),
                        decoration: BoxDecoration(
                          color: type == Type.Male
                              ? const Color(0xFF00E676)
                              : const Color(0xFF162226),
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(
                            color: type == Type.Male
                                ? const Color(0xFF00E676)
                                : const Color(0xFF00E676).withOpacity(0.2),
                            width: 1.5,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              radius: 28,
                              backgroundColor: type == Type.Male
                                  ? const Color(0xFF0F171A)
                                  : const Color(0xFF131D21),
                              child: const Icon(
                                Icons.male_rounded,
                                size: 28.0,
                                color: Color(0xFF00E676),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'MALE',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: type == Type.Male
                                    ? const Color(0xFF0F171A)
                                    : const Color(0xFF00E676),
                                letterSpacing: 1.1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          type = Type.Female;
                        });
                      },
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 24.0,
                          horizontal: 16.0,
                        ),
                        decoration: BoxDecoration(
                          color: type == Type.Female
                              ? const Color(0xFF00E676)
                              : const Color(0xFF162226),
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(
                            color: type == Type.Female
                                ? const Color(0xFF00E676)
                                : const Color(0xFF00E676).withOpacity(0.2),
                            width: 1.5,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              radius: 28,
                              backgroundColor: type == Type.Female
                                  ? const Color(0xFF0F171A)
                                  : const Color(0xFF131D21),
                              child: const Icon(
                                Icons.female_rounded,
                                size: 28.0,
                                color: Color(0xFF00E676),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'FEMALE',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: type == Type.Female
                                    ? const Color(0xFF0F171A)
                                    : const Color(0xFF00E676),
                                letterSpacing: 1.1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),

              Container(
                height: 200,
                width: 400,
                decoration: BoxDecoration(
                  color: const Color(0xFF1B2B28),
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: const Color(0xFF00E676).withOpacity(0.3),
                    width: 1.5,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'HEIGHT',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF9EAEC0),
                              letterSpacing: 1.2,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 4.0,
                            ),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 48, 74, 86),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: const Text(
                              'LIVE CALIBRATED',
                              style: TextStyle(
                                fontSize: 10.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 0.8,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            height.round().toString(),

                            style: const TextStyle(
                              fontSize: 48.0,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              letterSpacing: -1.0,
                            ),
                          ),
                          const SizedBox(width: 6.0),
                          const Text(
                            'cm',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF00E676),
                            ),
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderThemeData(
                          trackHeight: 14,
                          thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 10.0,
                          ),
                          overlayShape: const RoundSliderOverlayShape(
                            overlayRadius: 24.0,
                          ),
                        ),
                        child: Slider(
                          onChanged: (double value) {
                            height = value;
                            setState(() {});
                          },
                          value: height,
                          thumbColor: const Color(0xFFE2E8F0),
                          activeColor: const Color(0xFF2A3A40),
                          inactiveColor: const Color(0xFF2A3A40),
                          min: 80,
                          max: 220,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 18, right: 18),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: 3.0,
                                  height: 8.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF334155),
                                    borderRadius: BorderRadius.circular(2.0),
                                  ),
                                ),
                                Text(
                                  "80",
                                  style: TextStyle(
                                    color: Color(0xFF9EAEC0),
                                    fontWeight: .bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 110),
                            Column(
                              children: [
                                Container(
                                  width: 3.0,
                                  height: 8.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF334155),
                                    borderRadius: BorderRadius.circular(2.0),
                                  ),
                                ),
                                Text(
                                  "150",
                                  style: TextStyle(
                                    color: Color(0xFF9EAEC0),
                                    fontWeight: .bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 100),
                            Column(
                              children: [
                                Container(
                                  width: 3.0,
                                  height: 8.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF334155),
                                    borderRadius: BorderRadius.circular(2.0),
                                  ),
                                ),
                                Text(
                                  "220",
                                  style: TextStyle(
                                    color: Color(0xFF9EAEC0),
                                    fontWeight: .bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 6),

              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 12.0,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1B2B28),
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                          color: const Color(0xFF00E676).withOpacity(0.3),
                          width: 1.5,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "WEIGHT",
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF9EAEC0),
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                weight.toString(), //weight
                                style: const TextStyle(
                                  fontSize: 44.0,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                  letterSpacing: -1.0,
                                ),
                              ),
                              const SizedBox(width: 4.0),
                              const Text(
                                'kg',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF00E676),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12, right: 12),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (weight < 300) {
                                      weight++;
                                      setState(() {});
                                    }
                                  },
                                  borderRadius: BorderRadius.circular(30.0),
                                  child: Container(
                                    width: 48.0,
                                    height: 48.0,
                                    decoration: BoxDecoration(
                                      color: const Color(
                                        0xFF1F2E35,
                                      ), // Button background
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: const Color(
                                          0xFF00E676,
                                        ).withOpacity(0.3),
                                        width: 1.5,
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      size: 24.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                InkWell(
                                  onTap: () {
                                    if (weight > 0) {
                                      weight--;
                                      setState(() {});
                                    }
                                  },

                                  borderRadius: BorderRadius.circular(30.0),
                                  child: Container(
                                    width: 48.0,
                                    height: 48.0,
                                    decoration: BoxDecoration(
                                      color: const Color(
                                        0xFF1F2E35,
                                      ), // Button background
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: const Color(
                                          0xFF00E676,
                                        ).withOpacity(0.3),
                                        width: 1.5,
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.remove,
                                      size: 24.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 6),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 12.0,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1B2B28),
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                          color: const Color(0xFF00E676).withOpacity(0.3),
                          width: 1.5,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'AGE',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF9EAEC0),
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                age.toString(), //age
                                style: const TextStyle(
                                  fontSize: 44.0,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                  letterSpacing: -1.0,
                                ),
                              ),
                              const SizedBox(width: 4.0),
                              const Text(
                                'yrs',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF00E676),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12, right: 12),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (age < 120) {
                                      age++;
                                      setState(() {});
                                    }
                                  },
                                  borderRadius: BorderRadius.circular(30.0),
                                  child: Container(
                                    width: 48.0,
                                    height: 48.0,
                                    decoration: BoxDecoration(
                                      color: const Color(
                                        0xFF1F2E35,
                                      ), // Button background
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: const Color(
                                          0xFF00E676,
                                        ).withOpacity(0.3),
                                        width: 1.5,
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      size: 24.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                InkWell(
                                  onTap: () {
                                    if (age > 0) {
                                      age--;
                                      setState(() {});
                                    }
                                  },
                                  borderRadius: BorderRadius.circular(30.0),
                                  child: Container(
                                    width: 48.0,
                                    height: 48.0,
                                    decoration: BoxDecoration(
                                      color: const Color(
                                        0xFF1F2E35,
                                      ), // Button background
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: const Color(
                                          0xFF00E676,
                                        ).withOpacity(0.3),
                                        width: 1.5,
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.remove,
                                      size: 24.0,
                                      color: Colors.white,
                                    ),
                                  ),
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
              SizedBox(height: 6),
              SizedBox(
                width: double.infinity,
                height: 56.0,
                child: ElevatedButton(
                  onPressed: () {
                    double bmi = weight / ((height / 100) * (height / 100));

                    String result;

                    if (bmi < 18.5) {
                      result = "Underweight";
                    } else if (bmi < 25) {
                      result = "Healthy Range";
                    } else if (bmi < 30) {
                      result = "Overweight";
                    } else {
                      result = "Obese";
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ResultPage(bmiResult: bmi, resultText: result),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00E676), ////////////////
                    elevation: 10.0,
                    shadowColor: const Color(0xFF69F0AE).withOpacity(0.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.bolt_rounded,
                        color: Color(0xFF0D1B1E),
                        size: 24.0,
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        'Calculate BMI',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF0D1B1E),
                          letterSpacing: 0.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
