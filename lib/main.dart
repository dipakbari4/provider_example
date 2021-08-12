import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/counter.dart';
import 'package:provider_example/result.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Counter()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Count(),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const ResultPage()));
                },
                child: Text('Save'))
          ],
        ),
      ),
      floatingActionButton: FabWidget(),
    );
  }
}

class FabWidget extends StatelessWidget {
  const FabWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.only(left: 30),
          child: FloatingActionButton(
            onPressed: context.read<Counter>().decrement,
            tooltip: 'Decrement',
            child: Icon(Icons.exposure_minus_1),
          ),
        ),
        FloatingActionButton(
          onPressed: context.read<Counter>().increment,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ],
    );
  }
}

class Count extends StatelessWidget {
  const Count({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('${context.watch<Counter>().count}',
        style: Theme.of(context).textTheme.headline4);
  }
}
