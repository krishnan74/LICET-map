import 'package:flutter/material.dart';
import 'models/AvatarProperties.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late AvatarProperties avatar;

  @override
  void initState() {
    super.initState();
    avatar = AvatarProperties();
  }

  void _incrementChest() {
    setState(() {
      avatar.upperBody.chestPoint += 1;
    });
  }

  void _incrementShoulder() {
    setState(() {
      avatar.upperBody.shoulderPoint += 1;
    });
  }

  void _incrementLat() {
    setState(() {
      avatar.upperBody.latPoint += 1;
    });
  }

  void _incrementCore() {
    setState(() {
      avatar.upperBody.corePoint += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${avatar.upperBody.chestPoint}',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              '${avatar.upperBody.latPoint}',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              '${avatar.upperBody.shoulderPoint}',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              '${avatar.upperBody.corePoint}',
              style: Theme.of(context).textTheme.headline6,
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              FloatingActionButton(

                onPressed: _incrementChest,
                tooltip: 'Increment',
                child: const Text("Chest+"),
              ),
              SizedBox(width: 30),
              FloatingActionButton(
                onPressed: _incrementShoulder,
                tooltip: 'Increment',
                child: const Text("Shoulder+"),
              ),
              SizedBox(width: 30),
              FloatingActionButton(
                onPressed: _incrementLat,
                tooltip: 'Increment',
                child: const Text("Lat+"),
              ),
              FloatingActionButton(
                onPressed: _incrementCore,
                tooltip: 'Increment',
                child: const Text("Core+"),
              ),
            ],
          )
          ],
        ),
      ),

    );
  }
}
