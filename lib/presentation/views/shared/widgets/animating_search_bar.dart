import 'dart:async';

import 'package:flutter/material.dart';

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
                    padding: const EdgeInsets.only(left: 15.0, right: 13),
                    child: Image.asset(
                      'assets/images/other/search_grey.png',
                      width: 20,
                    ),
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child:
                        //  LottieBuilder.asset('assets/lotties/recording.json'),
                        Image.asset(
                          'assets/images/home_icons/voice_black.png',
                          width: 25,
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
                    vertical: 15,
                    horizontal: 10,
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[200]!),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[200]!),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  if (widget.isHome) {
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
                        padding: EdgeInsets.only(left: 46.0, top: 17),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Search your ',
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
  List<String> content = [
    'Music',
    'Businness',
    'Vegetables',
    'Drinks & Juices',
  ];
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      pageController.nextPage(
        duration: const Duration(seconds: 1),
        curve: Easing.legacy,
      );
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
