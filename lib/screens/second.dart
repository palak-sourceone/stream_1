import 'package:flutter/material.dart';
import 'package:stream_1/streams/counter_stream.dart';

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  void initState() {
    // _counterController = CounterController();
    super.initState();
  }

  @override
  void dispose() {
    contro.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(),
          Center(
              child: StreamBuilder<int>(
                  stream: contro.counterStream,
                  initialData: contro.counter,
                  builder: (
                    BuildContext context,
                    AsyncSnapshot<int> snapshot,
                  ) {
                    if (snapshot.hasData) {
                      return Text(
                        '${contro.counter}',
                        style: Theme.of(context).textTheme.headline4,
                      );
                    } else {
                      return Text(
                        'Empty data',
                        style: Theme.of(context).textTheme.headline4,
                      );
                    }
                  })),
        ],
      ),
    );
  }
}
