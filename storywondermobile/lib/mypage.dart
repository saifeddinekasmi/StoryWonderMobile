import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
  static const String routeName = '/webview';

  const WebViewPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: WebView(
          initialUrl: 'https://storywonder.io',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
