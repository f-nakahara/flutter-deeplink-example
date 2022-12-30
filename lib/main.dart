import 'package:flutter/material.dart';
import 'package:flutter_deeplink_example/deeplink_mixin.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with DeepLinkMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            hyperlinkButton('myapp://page1'), // myapp://page1 を開くボタン
            hyperlinkButton('myapp://page2'), // myapp://page2 を開くボタン
          ],
        ),
      ),
    );
  }

  Widget hyperlinkButton(String url) {
    final uri = Uri.parse(url);
    return ElevatedButton(
      onPressed: () async {
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri); // URLを開く
        }
      },
      child: Text(url),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Page1'),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Page2'),
      ),
    );
  }
}
