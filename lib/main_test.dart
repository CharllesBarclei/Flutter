import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'main.dart';

void main() {
  testWidgets('CustomButton changes background color when pressed', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Find the CustomButton widget
    final customButtonFinder = find.byType(CustomButton);

    // Get the initial background color
    Color initialBackgroundColor = tester.widget<CustomButton>(customButtonFinder).backgroundColor;

    // Tap the CustomButton
    await tester.tap(customButtonFinder);
    await tester.pump();

    // Get the updated background color
    Color updatedBackgroundColor = tester.widget<CustomButton>(customButtonFinder).backgroundColor;

    // Verify that the background color has changed
    expect(updatedBackgroundColor, isNot(initialBackgroundColor));
  });

  testWidgets('Counter increments when CustomButton is pressed', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Find the CustomButton widget
    final customButtonFinder = find.byType(CustomButton);

    // Find the Text widget displaying the counter value
    final counterTextFinder = find.byKey(const Key('counter_text'));

    // Get the initial counter value
    int initialCounterValue = int.parse(tester.widget<Text>(counterTextFinder).data!);

    // Tap the CustomButton
    await tester.tap(customButtonFinder);
    await tester.pump();

    // Get the updated counter value
    int updatedCounterValue = int.parse(tester.widget<Text>(counterTextFinder).data!);

    // Verify that the counter has incremented
    expect(updatedCounterValue, initialCounterValue + 1);
  });
}
