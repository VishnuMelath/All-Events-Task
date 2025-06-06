import 'package:all_events_task/config/themes/colors.dart';
import 'package:all_events_task/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PurchaseTicketScreen extends ConsumerStatefulWidget {
  final String url;
  const PurchaseTicketScreen({super.key, required this.url});

  @override
  ConsumerState<PurchaseTicketScreen> createState() =>
      _PurchaseTicketScreenState();
}

class _PurchaseTicketScreenState extends ConsumerState<PurchaseTicketScreen> {
  late WebViewController controller;
  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            ref.read(progressNotifier.notifier).state = progress;
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            ref.read(isWebViewLoading.notifier).state = false;
          },
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.white),
      body: ref.watch(isWebViewLoading)
          ? Material(
              child: Center(
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    value: ref.watch(progressNotifier).toDouble(),
                  ),
                ),
              ),
            )
          : WebViewWidget(controller: controller),
    );
  }
}
