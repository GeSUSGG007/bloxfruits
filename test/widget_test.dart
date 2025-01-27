import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// Replace with your project's main file path.
// import 'package:flutter_application_3/main.dart';
void main() {
  testWidgets('Counter increments test', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the counter starts at 0.
    expect(find.text('0'), findsOneWidget); // Checks if '0' is displayed.
    expect(find.text('1'), findsNothing);   // Ensures '1' is not yet displayed.

    // Simulate a tap on the '+' button.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump(); // Rebuild the widget after the state change.

    // Verify that the counter has incremented to 1.
    expect(find.text('0'), findsNothing);   // Ensures '0' is no longer displayed.
    expect(find.text('1'), findsOneWidget); // Checks if '1' is displayed.
  });
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Counter App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CounterPage(),
    );
  }
}
class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}