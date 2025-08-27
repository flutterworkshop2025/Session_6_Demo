import 'package:flutter/material.dart';

import '../../../../../core/app_colors.dart';
import '../../../../../core/dummy_data.dart';
import '../../../data/model/qoute.dart';

class QouteScreen extends StatelessWidget {
  QouteScreen({super.key});

  final List<Qoute> qoutes = DummyData.qoutes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: qoutes.length,
          itemBuilder: (context, index) {
            final Qoute qoute = qoutes[index];
            return Card(
              color: Colors.white,
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '"${qoute.content ?? ""}"',
                      style: const TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "- ${qoute.author ?? "Unknown"}",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.mainColor,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
