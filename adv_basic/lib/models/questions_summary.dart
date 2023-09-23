import 'package:adv_basic/models/summary_Item.dart';
import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData; // datos de resumen

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            // recorre los datos de resumen
            (data) {
              return SummaryItem(data); // crea un elemento de resumen
            },
          ).toList(),
        ),
      ),
    );
  }
}
