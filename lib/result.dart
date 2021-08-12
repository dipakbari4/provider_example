import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/counter.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "${Provider.of<Counter>(context).count}",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.exposure_minus_1),
        onPressed: context.read<Counter>().decrement,
      ),
    );
  }
}
