import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_deeplink_example/main.dart';
import 'package:uni_links/uni_links.dart';

mixin DeepLinkMixin<T extends StatefulWidget> on State<T> {
  StreamSubscription? _sub;

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  Future<void> init() async {
    /// DeepLinkを監視する
    _sub = uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        final host = uri.host; // myapp
        switch (host) {
          case "page1": // myapp://page1
            pushPage(const Page1());
            break;
          case "page2": // myapp://page2
            pushPage(const Page2());
            break;
        }
      }
    });
  }

  /// [page]に画面遷移する
  Future<void> pushPage(Widget page) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return page;
        },
      ),
    );
  }
}
