// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

//#Important! Click the "generate tests" button if you have made any changes to this file.

//#Read more about Gherkin syntax https://cucumber.io/docs/gherkin/reference/
//#Read more about bdd_widget_test package https://pub.dev/packages/bdd_widget_test

//#Example of BDD(Gherkin) syntax:
//#
//#Feature: Counter
//#  Scenario: Initial counter value is 0
//#    Given the app is running
//#    Then I see {'0'} text

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:brocosproject/main.dart';

void main() {
  testWidgets('Increment the counter by 1', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(BrocolisApp());

    // Verify that the counter starts at 0.
    expect(find.text('0'), findsNWidgets(2));

    // Tap the '+' button and trigger a frame.
    await tester.tap(find.text('+1'));
    await tester.pump();

    // Verify that the counter has incremented to 1.
    expect(find.text('1'), findsOneWidget);
  });
}
