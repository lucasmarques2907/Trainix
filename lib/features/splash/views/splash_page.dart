import 'package:trainix/config/imports.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Splash - Trainix'),
            ElevatedButton(
              onPressed: () {
                context.go('/');
              },
              child: Text('Home!'),
            ),
          ],
        ),
      ),
    );
  }
}
