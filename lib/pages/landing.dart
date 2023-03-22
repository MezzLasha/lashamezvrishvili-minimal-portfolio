import 'package:flutter/material.dart';
import 'package:lashamezvrishvili/pages/home.dart';
import 'package:smooth_corner/smooth_corner.dart';

import '../widgets/blend_mask.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _animation = CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutCubicEmphasized,
        reverseCurve: Curves.easeInOutCubicEmphasized.flipped);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Center(
                  child: MouseRegion(
                    onEnter: (event) {
                      _controller.forward();
                    },
                    onExit: (event) {
                      _controller.reverse();
                    },
                    cursor: SystemMouseCursors.click,
                    child: InkWell(
                      onTap: () {
                        _scrollController.animateTo(
                            _scrollController.position.maxScrollExtent,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOutCubicEmphasized);
                      },
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      child: AnimatedBuilder(
                        animation: _animation,
                        builder: (context, child) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Transform.translate(
                                  offset: Offset(-20 * (_animation.value), 0),
                                  child: child!),
                              Transform.translate(
                                offset: Offset(20 * (_animation.value), 0),
                                child: Opacity(
                                  opacity: _animation.value,
                                  child: const Icon(
                                    Icons.play_arrow,
                                    size: 80,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        child: Transform.translate(
                          offset: const Offset(40, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text(
                                'ME',
                                maxLines: 2,
                                overflow: TextOverflow.visible,
                                style: TextStyle(
                                  fontSize: 80,
                                  height: 0.8,
                                  letterSpacing: -20,
                                  fontFamily: 'Neue',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'ZZ',
                                maxLines: 2,
                                overflow: TextOverflow.visible,
                                style: TextStyle(
                                  fontSize: 80,
                                  height: 0.75,
                                  letterSpacing: 0,
                                  fontFamily: 'Neue',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 35),
                    child: Text(
                      'LASHA MEZVRISHVILI',
                      style: TextStyle(
                          fontFamily: 'NeueMontreal',
                          fontSize: 20,
                          letterSpacing: -1.2,
                          color: Color.fromARGB(255, 36, 10, 168),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                // const Align(
                //   alignment: Alignment.bottomCenter,
                //   child: Padding(
                //     padding: EdgeInsets.only(bottom: 35),
                //     child: Text(
                //       'Flutter Developer',
                //       style: TextStyle(
                //           fontFamily: 'NeueMontreal',
                //           fontSize: 20,
                //           letterSpacing: -1.2,
                //           color: Color.fromARGB(255, 36, 10, 168),
                //           fontWeight: FontWeight.w500),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          const VerticalDivider(),
          const HomePage(),
        ],
      ),
    ));
  }
}
