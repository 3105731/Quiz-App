import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Summary extends StatelessWidget {
  Summary(this.SummaryData, {Key? key}) : super(key: key);

  final List<Map<String, Object>> SummaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...SummaryData.map(
                  (e) => Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor:
                        e['user_answer'] == e['correct_answer']
                            ? Colors.blueAccent
                            :Colors.red[300],
                        child: Text(
                          ((e['question_index'] as int) + 1).toString(),
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e['question'].toString(),
                              style: TextStyle(
                                color: Colors.purple[100],
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              e['user_answer'].toString(),
                              style: TextStyle(
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              e['correct_answer'].toString(),
                              style: TextStyle(
                                color: Colors.indigo,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}