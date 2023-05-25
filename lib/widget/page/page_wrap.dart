import 'package:flutter/material.dart';
import 'package:fuleap/helpers/constants.dart';
import 'package:fuleap/helpers/theme.dart';
import 'package:fuleap/widget/general/button.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

import '../general/bottom_nav.dart';

class wrapPage extends StatelessWidget {
  Widget children;
  Widget? appBar;

  // ---
  int selected;
  bool showBottom;
  bool inScroll;
  Function? onChange;
  bool hasBackground;
  bool isLoading;

  BuildContext? context;

  wrapPage(
      {super.key,
      required this.children,
      this.appBar,
      this.inScroll = true,
      this.showBottom = false,
      this.onChange,
      this.context,
      this.isLoading = false,
      this.hasBackground = false,
      this.selected = 0});

  @override
  Widget build(BuildContext context) {
    bool inError = false;

    return LoaderOverlay(
      closeOnBackButton: true,
      child: Scaffold(
        extendBody: true,
        backgroundColor: white_,
        bottomNavigationBar: showBottom
            ? BottomNavigation(context).BottomNav(selected, onClick: onChange)
            : null,
        appBar: appBar == null
            ? AppBar(
                backgroundColor: white_,
              )
            : !hasBackground
                ? AppBar(
                    backgroundColor: white_,
                    toolbarHeight: 0,
                    elevation: 0,
                  )
                : null,
        body: Container(
          decoration: hasBackground ? patternDecoration : null,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              appBar ?? const SizedBox(),
              Expanded(
                child: isLoading
                    ? Center(
                        child: inError
                            ? Container(
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Something broke!",
                                      style: TextStyle(
                                          color: darkBlue_,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "We are having some issues Connecting\nto our servers",
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "RETRY",
                                      style: TextStyle(
                                          color: green_,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              )
                            : CircularProgressIndicator.adaptive(),
                      )
                    : inScroll
                        ? SingleChildScrollView(
                            child: children,
                          )
                        : children,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
