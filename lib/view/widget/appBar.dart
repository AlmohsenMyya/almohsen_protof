import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/controller/generalController.dart';
import 'package:portfolio/resource/appClass.dart';
import 'package:portfolio/resource/colors.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ActionBar extends ConsumerStatefulWidget with PreferredSizeWidget {
  final AutoScrollController controller;

  ActionBar(this.controller, {Key? key}) : super(key: key);

  @override
  ConsumerState<ActionBar> createState() => _ActionBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _ActionBarState extends ConsumerState<ActionBar> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Expanded(
        child: Container(
            height: 70,
            padding: EdgeInsets.only(right: 15.0, top: 20.0),
            child: () {
              ScreenType scrType = AppClass().getScreenType(context);
              if (scrType == ScreenType.mobile || scrType == ScreenType.tab) {
                return Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Image.asset(
                        'assets/svg/logo.png',
                        width: AppClass().getMqWidth(context) * 0.9,
                        height: AppClass().getMqHeight(context) * 0.9,
                      ),
                    )),
                    Expanded(
                      flex: 9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          PopupMenuButton(
                            color: AppColors().cardColor,
                            itemBuilder: (c) => <PopupMenuEntry>[
                              PopupMenuItem(

                                child: Expanded(
                                  child: Container(
                                      child: InkWell(
                                        onTap: () => widget.controller
                                            .scrollToIndex(1,
                                                preferPosition:
                                                    AutoScrollPosition.begin),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [

                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10.0),
                                              child: Text(
                                                'حول',
                                                style: GoogleFonts.roboto(),
                                              ),
                                            ),
                                            Icon(Icons.account_circle_rounded,
                                                size: 18),
                                          ],
                                        ),
                                      )),
                                ),
                              ),
                              PopupMenuItem(
                                child: InkWell(
                                  onTap: () => widget.controller.scrollToIndex(2,
                                      preferPosition: AutoScrollPosition.begin),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [

                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10.0),
                                        child: Text(
                                          'التجارب والخبرات',
                                          style: GoogleFonts.roboto(),
                                        ),
                                      ),
                                      Icon(Icons.travel_explore_rounded,
                                          size: 18),
                                    ],
                                  ),
                                ),
                              ),
                              PopupMenuItem(
                                child: InkWell(
                                  onTap: () => widget.controller.scrollToIndex(3,
                                      preferPosition: AutoScrollPosition.begin),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [

                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10.0),
                                        child: Text(
                                          'العمل',
                                          style: GoogleFonts.roboto(),
                                        ),
                                      ),
                                      Icon(Icons.computer_rounded, size: 18),
                                    ],
                                  ),
                                ),
                              ),
                              PopupMenuItem(
                                child: InkWell(
                                  onTap: () => widget.controller.scrollToIndex(4,
                                      preferPosition: AutoScrollPosition.begin),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [

                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10.0),
                                        child: Text(
                                          'تواصل معنا',
                                          style: GoogleFonts.roboto(),
                                        ),
                                      ),
                                      Icon(Icons.phone_rounded, size: 18),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                            child: Icon(Icons.menu_rounded, size: 25),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              }
              return Row(
                children: [
                  Expanded(
                      child: Container(
                          width: AppClass().getMqWidth(context) * 0.07,
                          height: AppClass().getMqHeight(context) * 0.07,
                          child: Image.asset(
                            'assets/svg/logo.png',
                          ))),
                  Expanded(
                    flex: 9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        /*Text(scrType.name),*/


                        InkWell(
                          onTap: () {
                            AppClass().downloadResume(context);
                          },
                          child: Container(
                            height: 40,
                            width: 80,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius:
                                BorderRadius.all(Radius.circular(3.0)),
                                border: Border.all(
                                    color: AppColors().neonColor, width: 1.5)),
                            child: Center(
                              child: Text('التحميل',
                                  style: TextStyle(
                                      color: AppColors().neonColor,
                                      fontSize: 13,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'sfmono')),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            widget.controller.scrollToIndex(4,
                                preferPosition: AutoScrollPosition.begin);
                          },
                          onHover: (bol) {
                            if (bol) {
                              ref.read(hoverProvider.notifier).state =
                                  "contactTitle";
                            } else {
                              ref.read(hoverProvider.notifier).state = "";
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 30.0 , ),
                            child: Row(
                              children: [
                                Consumer(builder: (context, ref, child) {
                                  String state = ref.watch(hoverProvider);
                                  bool isHovered = (state == "contactTitle");
                                  return Text("تواصل معنا",
                                      style: TextStyle(
                                          color: isHovered
                                              ? AppColors().neonColor
                                              : AppColors().textColor,
                                          fontSize: 13));
                                }),
                                Text(".٤",
                                    style: TextStyle(
                                        color: AppColors().neonColor,
                                        fontSize: 13,
                                        fontFamily: 'sfmono')),

                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            widget.controller.scrollToIndex(3,
                                preferPosition: AutoScrollPosition.begin);
                          },
                          onHover: (bol) {
                            if (bol) {
                              ref.read(hoverProvider.notifier).state =
                              "workTitle";
                            } else {
                              ref.read(hoverProvider.notifier).state = "";
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Row(
                              children: [
                                Consumer(builder: (context, ref, child) {
                                  String state = ref.watch(hoverProvider);
                                  bool isHovered = (state == "workTitle");

                                  return Text("العمل",
                                      style: TextStyle(
                                          color: isHovered
                                              ? AppColors().neonColor
                                              : AppColors().textColor,
                                          fontSize: 13,
                                          fontFamily: 'sfmono'));
                                }),
                                Text(".٣",
                                    style: TextStyle(
                                        color: AppColors().neonColor,
                                        fontSize: 13,
                                        fontFamily: 'sfmono')),

                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            widget.controller.scrollToIndex(2,
                                preferPosition: AutoScrollPosition.begin);
                          },
                          onHover: (bol) {
                            if (bol) {
                              ref.read(hoverProvider.notifier).state = "expTitle";
                            } else {
                              ref.read(hoverProvider.notifier).state = "";
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Row(
                              children: [
                                Consumer(builder: (context, ref, child) {
                                  String state = ref.watch(hoverProvider);
                                  bool isHovered = (state == "expTitle");
                                  return Text("التجارب والخبرات",
                                      style: TextStyle(
                                          color: isHovered
                                              ? AppColors().neonColor
                                              : AppColors().textColor,
                                          fontSize: 13,
                                          fontFamily: 'sfmono'));
                                }),

                                Text(".٢",
                                    style: TextStyle(
                                        color: AppColors().neonColor,
                                        fontSize: 13,
                                        fontFamily: 'sfmono')),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            widget.controller.scrollToIndex(1,
                                preferPosition: AutoScrollPosition.begin);
                          },
                          onHover: (bol) {
                            if (bol) {
                              ref.read(hoverProvider.notifier).state =
                              "aboutTitle";
                            } else {
                              ref.read(hoverProvider.notifier).state = "";
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 30.0 , right: 80),
                            child: Row(
                              children: [
                                Consumer(builder: (context, ref, child) {
                                  String state = ref.watch(hoverProvider);
                                  bool isHovered = (state == "aboutTitle");
                                  return Text("حول",
                                      style: TextStyle(
                                          color: isHovered
                                              ? AppColors().neonColor
                                              : AppColors().textColor,
                                          fontSize: 13,
                                          fontFamily: 'sfmono'));
                                }),
                                Text(".١",
                                    style: TextStyle(
                                        color: AppColors().neonColor,
                                        fontSize: 13,
                                        fontFamily: 'sfmono')),

                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              );
            }()),
      ),
    );
  }
}
