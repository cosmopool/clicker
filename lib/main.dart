import 'package:flutter/material.dart';

class Game {
  Game({
    required this.points,
  });

  int points;
}

void main() {
  runApp(const ClickerGame());
}

class ClickerGame extends StatelessWidget {
  const ClickerGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CookiePage(
        title: 'Cookie',
        game: Game(points: 0),
      ),
    );
  }
}

class CookiePage extends StatefulWidget {
  const CookiePage({
    required this.title,
    required this.game,
    super.key,
  });

  final String title;
  final Game game;

  @override
  State<CookiePage> createState() => _CookiePageState();
}

class _CookiePageState extends State<CookiePage>
    with SingleTickerProviderStateMixin {
  // final Curve curve = const ElasticInOutCurve(0.1);
  late AnimationController controller;

  void _incrementCounter() {
    controller.forward();

    setState(() {
      widget.game.points++;
    });
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 70),
      vsync: this,
    );
    controller.addListener(() {
      setState(() {});
    });

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) controller.reverse();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final smallest =
        screen.width < screen.height ? screen.width : screen.height;
    final size = smallest * 0.6;
    assert(size < screen.width || size < screen.height);

    final animationValue = controller.value / 1 * (0.95 - 1) + 1;

    final cookie = GestureDetector(
      onTap: _incrementCounter,
      child: Container(
        height: animationValue * size,
        width: animationValue * size,
        decoration: BoxDecoration(
          color: Colors.brown,
          borderRadius: BorderRadius.all(Radius.circular(size * 2)),
        ),
      ),
    );

    final points = Text(
      '${widget.game.points}',
      style: Theme.of(context).textTheme.headlineMedium,
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(flex: 3, child: Center(child: points)),
            Expanded(flex: 7, child: Center(child: cookie)),
          ],
        ),
      ),
    );
  }
}
