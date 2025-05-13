import 'package:flutter/material.dart';

void
main() => runApp(
  MyApp(),
);

class MyApp
    extends
        StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return MaterialApp(
      title:
          'Simple Form',
      home:
          SimpleForm(),
    );
  }
}

class SimpleForm
    extends
        StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _SimpleFormState createState() =>
      _SimpleFormState();
}

class _SimpleFormState
    extends
        State<
          SimpleForm
        > {
  // Controllers to read input
  final TextEditingController _firstController =
      TextEditingController();
  final TextEditingController _secondController =
      TextEditingController();

  void _handleButtonPress() {
    String first =
        _firstController.text;
    String second =
        _secondController.text;

    // Show input in dialog or console
    showDialog(
      context:
          context,
      builder:
          (
            _,
          ) => AlertDialog(
            title: Text(
              'Input',
            ),
            content: Text(
              'First: $first\nSecond: $second',
            ),
            actions: [
              TextButton(
                onPressed:
                    () => Navigator.pop(
                      context,
                    ),
                child: Text(
                  'OK',
                ),
              ),
            ],
          ),
    );
  }

  @override
  void dispose() {
    _firstController.dispose();
    _secondController.dispose();
    super.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Test',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          20.0,
        ),
        child: Column(
          children: [
            TextField(
              controller:
                  _firstController,
              decoration: InputDecoration(
                labelText:
                    'email',
              ),
            ),
            SizedBox(
              height:
                  10,
            ),
            TextField(
              controller:
                  _secondController,
              decoration: InputDecoration(
                labelText:
                    'password',
              ),
            ),
            SizedBox(
              height:
                  20,
            ),
            ElevatedButton(
              onPressed:
                  _handleButtonPress,
              child: Text(
                'sign in',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
