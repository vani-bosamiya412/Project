import 'package:flutter/material.dart';

import '../../SignUp/signup.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late int _currentPage = 0;
  final PageController _pageController = PageController();

  final Map<int, String> _answers = {};

  String? _gender;
  DateTime? _dob;
  double? _height;
  double? _weight;

  final List<Map<String, dynamic>> _questions = [
    {
      "question": "What's your main fitness goal?",
      "options": ["Lose Weight", "Build Muscles", "Stay Fit", "Improve Stamina"]
    },
    {
      "question": "What’s your training routine?",
      "options": ["Beginner Plan", "Intermediate Plan", "Advanced Plan"]
    },
    {
      "question": "What’s your fitness experience?",
      "options": ["Just Starting", "6 Months+", "1+ Year", "3+ Years"]
    },
    {
      "question": "How many days per week can you workout?",
      "options": ["2 Days", "3 Days", "4 Days", "Everyday"]
    },
    {
      "question": "When do you prefer to workout?",
      "options": ["Morning", "Afternoon", "Evening", "Flexible"]
    }
  ];

  void _previousPage() {
    if(_currentPage > 0) {
      _pageController.previousPage(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut
      );
    }
  }

  void _nextPage() {
    if(_currentPage < _questions.length) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut
      );
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUp()));
    }
  }

  Future<void> _pickDOB() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() => _dob = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    double progress = (_currentPage + 1) / (_questions.length + 1);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  if (_currentPage > 0)
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: _previousPage,
                    ),
                  Expanded(
                    child: LinearProgressIndicator(
                      value: progress,
                      backgroundColor: Colors.grey[300],
                      color: Colors.pinkAccent,
                      minHeight: 6,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  if(_currentPage < _questions.length)
                    TextButton(
                      onPressed: () => _nextPage(),
                      child: Text("Skip", style: TextStyle(fontSize: 18),)
                    ),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                physics: NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  setState(() => _currentPage = index);
                },
                itemCount: _questions.length + 1,
                itemBuilder: (context, index) {
                  if (index < _questions.length) {
                    final question = _questions[index];
                    final selected = _answers[index];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30,),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(question["question"], style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                        ),
                        SizedBox(height: 20,),
                        Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            itemCount: question["options"].length,
                            itemBuilder: (context, i) {
                              final option = question["options"][i];
                              final isSelected = selected == option;

                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _answers[index] = option;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 8),
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: isSelected ? Colors.pinkAccent : Colors.grey.shade400,
                                      width: 2
                                    ),
                                    color: isSelected ? Colors.pinkAccent.withValues(alpha: 0.1) : Colors.white,
                                  ),
                                  child: Text(option, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: isSelected ? Colors.pinkAccent : Colors.black87),),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  } else {
                    return SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 30),
                            Text("Lastly what are your baseline stats?", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                            SizedBox(height: 8),
                            Text("Optional and can be added later.", style: TextStyle(color: Colors.grey)),
                            SizedBox(height: 20),
                            DropdownButtonFormField<String>(
                              value: _gender,
                              decoration: InputDecoration(
                                labelText: "Gender",
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.pinkAccent, width: 2),
                                ),
                              ),
                              items: ["Female", "Male"].map((g) => DropdownMenuItem(value: g, child: Text(g))).toList(),
                              onChanged: (val) {
                                setState(() => _gender = val);
                              },
                            ),
                            SizedBox(height: 15,),
                            GestureDetector(
                              onTap: _pickDOB,
                              child: InputDecorator(
                                decoration: InputDecoration(
                                  labelText: "Date of Birth",
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.pinkAccent, width: 2),
                                  ),
                                ),
                                child: Text(_dob != null ? "${_dob!.day}/${_dob!.month}/${_dob!.year}" : "Select Date", style: TextStyle(color: _dob != null ? Colors.black87 : Colors.grey,),),
                              ),
                            ),
                            SizedBox(height: 15),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: "Height (cm)",
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.pinkAccent, width: 2),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              onChanged: (val) => _height = double.tryParse(val),
                            ),
                            SizedBox(height: 15),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: "Weight (kg)",
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.pinkAccent, width: 2),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              onChanged: (val) => _weight = double.tryParse(val),
                            ),
                            SizedBox(height: 15),
                            Text("⚠️ Weight needed to calculate calories burned", style: TextStyle(color: Colors.grey),),
                          ],
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: (_currentPage < _questions.length && _answers[_currentPage] == null) ? Colors.grey : Colors.pinkAccent,
                  minimumSize: Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  if (_currentPage < _questions.length && _answers[_currentPage] == null) {
                    return;
                  }
                  _nextPage();
                },
                child: Text(_currentPage == _questions.length ? "Get Started" : "Next", style: TextStyle(fontSize: 20, letterSpacing: 1.2, fontFamily: "Luckiest Guy"),),
              ),
            )
          ],
        )
      ),
    );
  }
}
