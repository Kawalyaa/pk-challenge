import 'package:flutter/material.dart';

class SleepOnboarding extends StatefulWidget {
  const SleepOnboarding({Key? key}) : super(key: key);

  @override
  _SleepOnboardingState createState() => _SleepOnboardingState();
}

class _SleepOnboardingState extends State<SleepOnboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
                child: ListView(
              children: const [Text('Onboarding')],
            )),
            MaterialButton(
              onPressed: () {},
              minWidth: 200,
              color: Colors.red,
              child: const Text('Next'),
            ),
            MaterialButton(
              onPressed: () {},
              minWidth: 200,
              color: Colors.red,
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
