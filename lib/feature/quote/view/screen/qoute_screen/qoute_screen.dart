import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/app_colors.dart';
import '../../../../../core/dummy_data.dart';
import '../../../data/model/qoute.dart';
import '../../../view_model/quote_bloc/quote_cubit.dart';
import '../../../view_model/quote_bloc/quote_state.dart';

class QouteScreen extends StatefulWidget {
  QouteScreen({super.key});

  @override
  State<QouteScreen> createState() => _QouteScreenState();
}

class _QouteScreenState extends State<QouteScreen> {
  @override
  void initState() {
    super.initState();
    context.read<QuoteCubit>().loadQoutes();
  }

  //final List<Qoute> qoutes = DummyData.qoutes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<QuoteCubit, QuoteState>(
          builder:
              (context, state) =>
                  (state is LoadingState)
                      ? CircularProgressIndicator()
                      : (state is SuccessState)
                      ? ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: state.qoutes.length,
                        itemBuilder: (context, index) {
                          final Qoute qoute = state.qoutes[index];
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
                                    '"${qoute.content}"',
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
                      )
                      : (state is FailureState)
                      ? Center(child: Text("${state.message}"))
                      : Center(child: Text("No quotes yet")),
        ),
      ),
    );
  }
}
