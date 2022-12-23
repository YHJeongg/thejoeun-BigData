import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'site_controller.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key, required this.site});

  final int site;

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  late bool isLoading; // for indicator
  late String siteName; // sitename

  late TextEditingController controller;
  @override
  void initState() {
    super.initState();
    isLoading = true;
    controller = TextEditingController();

    if (widget.site == 1) {
      siteName = SiteName.naver;
    } else if (widget.site == 2) {
      siteName = SiteName.google;
    } else {
      siteName = SiteName.daum;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebView - Tabbar'),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: 'https://$siteName',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            onPageFinished: (url) {
              setState(() {
                isLoading = false;
              });
            },
            onPageStarted: (url) {
              setState(() {
                isLoading = true;
              });
            },
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(),
        ],
      ),
      floatingActionButton: FutureBuilder<WebViewController>(
        future: _controller.future,
        builder: (BuildContext context,
            AsyncSnapshot<WebViewController> controller) {
          if (controller.hasData) {
            return FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () {
                controller.data!.goBack();
              },
              child: const Icon(Icons.arrow_back),
            );
          }
          return Stack();
        },
      ),
    );
  }
}
