import 'dart:async';

import 'package:all_events_task/config/route/route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AnimatingSearchBar extends StatefulWidget {
  final void Function(String? value) onChanged;
  final TextEditingController textEditingController;
  final bool isHome;
  const AnimatingSearchBar({
    super.key,
    required this.onChanged,
    this.isHome = true,
    required this.textEditingController,
  });

  @override
  State<AnimatingSearchBar> createState() => _AnimatingSearchBarState();
}

class _AnimatingSearchBarState extends State<AnimatingSearchBar> {
  ValueNotifier<bool> animationVisibility = ValueNotifier(true);

  late FocusNode focusNode = FocusNode(canRequestFocus: !widget.isHome);

  @override
  void initState() {
    focusNode.addListener(() {
      if (!widget.isHome) {
        animationVisibility.value =
            !focusNode.hasFocus && widget.textEditingController.text.isEmpty;
      }
    });
    widget.textEditingController.addListener(() {
      if (widget.textEditingController.text.isNotEmpty) {
        animationVisibility.value = false;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    widget.textEditingController.dispose();
    animationVisibility.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'Search',
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Stack(
            children: [
              TextField(
                readOnly: widget.isHome,
                controller: widget.textEditingController,
                focusNode: focusNode,
                onChanged: widget.onChanged,
                decoration: InputDecoration(
                  prefixIconConstraints: const BoxConstraints(
                    maxWidth: 50,
                    maxHeight: 40,
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 10),
                    child: Image.asset(
                      'assets/images/search_black.png',
                      width: 20,
                    ),
                  ),

                  suffixIconConstraints: const BoxConstraints(
                    maxWidth: 40,
                    maxHeight: 40,
                  ),
                  isDense: true,
                  isCollapsed: true,
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 13,
                    horizontal: 10,
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[200]!),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[200]!),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  if (widget.isHome) {
                    context.pushNamed(AppRouteNames.searchScreen);
                  } else {
                    focusNode.requestFocus();
                  }
                },
                child: ValueListenableBuilder(
                  valueListenable: animationVisibility,
                  builder: (context, visible, _) {
                    return Visibility(
                      visible: visible,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 46.0, top: 15),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Search Events ',
                              style: TextStyle(color: Colors.grey),
                            ),
                            CustomAnimatingText(),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomAnimatingText extends StatefulWidget {
  const CustomAnimatingText({super.key});

  @override
  State<CustomAnimatingText> createState() => _CustomAnimatingTextState();
}

class _CustomAnimatingTextState extends State<CustomAnimatingText>
    with SingleTickerProviderStateMixin {
  PageController pageController = PageController();
  List<String> content = ['Music', 'Businness', 'Sports', 'Workshops'];
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Timer.periodic(const Duration(seconds: 1), (timer) {
        pageController.nextPage(
          duration: const Duration(seconds: 1),
          curve: Easing.legacy,
        );
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 3.0),
        child: SizedBox(
          height: 16,
          child: PageView.builder(
            controller: pageController,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => Text(
              content[index % content.length],
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}
