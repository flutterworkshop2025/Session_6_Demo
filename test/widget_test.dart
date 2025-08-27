// // This is a basic Flutter widget test.
// //
// // To perform an interaction with a widget in your test, use the WidgetTester
// // utility in the flutter_test package. For example, you can send tap and scroll
// // gestures. You can also use WidgetTester to find child widgets in the widget
// // tree, read text, and verify that the values of widget properties are correct.

// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';

// import 'package:demo/main.dart';

// void main() {
//   testWidgets('Counter increments smoke test', (WidgetTester tester) async {
//     // Build our app and trigger a frame.
//     await tester.pumpWidget(const MyApp());

//     // Verify that our counter starts at 0.
//     expect(find.text('0'), findsOneWidget);
//     expect(find.text('1'), findsNothing);

//     // Tap the '+' icon and trigger a frame.
//     await tester.tap(find.byIcon(Icons.add));
//     await tester.pump();

//     // Verify that our counter has incremented.
//     expect(find.text('0'), findsNothing);
//     expect(find.text('1'), findsOneWidget);
//   });
// }

import 'package:demo/feature/Tasks/data/model/Task.dart';
import 'package:demo/feature/Tasks/data/repo/task_repository.dart';
import 'package:demo/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await Hive.initFlutter();
    Hive.registerAdapter(TaskAdapter());
  });

  testWidgets('App builds successfully', (WidgetTester tester) async {
    // Open a temporary box for testing
    final taskBox = await Hive.openBox<Task>('testTasks');
    final taskRepo = TaskRepository(taskBox: taskBox);

    // Pass taskRepo to MyApp
    await tester.pumpWidget(MyApp(taskRepo: taskRepo));

    // Example: check if HomeScreen title or widget is present
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}

