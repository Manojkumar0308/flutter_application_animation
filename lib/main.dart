import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SpringAnimation(),
    );
  }
}


// Define a SpringAnimation widget
class SpringAnimation extends StatefulWidget {
  const SpringAnimation({Key? key});

  @override
  _SpringAnimationState createState() => _SpringAnimationState();
}

class _SpringAnimationState extends State<SpringAnimation> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  )..forward();

  late final Animation<double> _animation = Tween<double>(
    begin: 0,
    end: 400,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
  ));

  void _startAnimation() {
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            // AnimatedBuilder(
            //   animation: _animation,
            //   builder: (context, child) {
            //     return Stack(
            //       children: [
            //         Positioned(
            //           left: 70,
            //           top: _animation.value,
            //           child: child!,
            //         )
            //       ],
            //     );
            //   },
            //   child: GestureDetector(
            //     onTap: () {
            //       _startAnimation();
            //     },
            //     child: Container(
            //       height: 100,
            //       width: 250,
            //       decoration: BoxDecoration(
            //         color: const Color(0xFF00EF3C),
            //         borderRadius: BorderRadius.circular(10),
            //       ),
            //       child: const Center(
            //           child: Text(
            //         'SEMAPHORE',
            //         style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            //       )),
            //     ),
            //   ),
            // ),

             const SizedBox(height: 50),
            SizedBox(
              height: 200,
              width: 200,
              child:  Lottie.network(
        'https://telegram.org/file/464001484/1/bzi7gr7XRGU.10147/815df2ef527132dd23',
        decoder: LottieComposition.decodeGZip,
      ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}