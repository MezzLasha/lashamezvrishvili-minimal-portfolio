import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lashamezvrishvili/pages_config.dart';

import '/pages/about_page.dart';
import '/widgets/misc.dart';

class AddProjectTile extends StatefulWidget {
  const AddProjectTile({super.key, required this.isDesktop, required this.controller});

  final bool isDesktop;
  final AnimationController controller;

  @override
  State<AddProjectTile> createState() => _AddProjectTileState();
}

class _AddProjectTileState extends State<AddProjectTile> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) => Animate(
        effects: [
          ScaleEffect(
            curve: Easing.standard,
            delay: Duration(milliseconds: 100 * (pagesConfig.length + 1)),
          ),
          FlipEffect(
            curve: Easing.standard,
            delay: Duration(milliseconds: 100 * (pagesConfig.length + 1)),
          )
        ],
        controller: widget.controller,
        child: Padding(
          padding: widget.isDesktop
              ? const EdgeInsets.all(10)
              : const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: InkWell(
            onTap: () => AboutMePage.openAboutMePage(context, widget.controller),
            onHover: widget.isDesktop ? (x) => setState(() => _hovering = x) : null,
            borderRadius: BorderRadius.circular(widget.isDesktop ? 6 : 24),
            child: AnimatedContainer(
              width: widget.isDesktop ? (_hovering ? 165 : 160) : double.infinity,
              duration: const Duration(milliseconds: 700),
              curve: Easing.standard,
              height: 160,
              child: Stack(
                children: [
                  Hero(
                    tag: 'AddProjectHero',
                    createRectTween: (begin, end) => MaterialRectCenterArcTween(
                      begin: begin,
                      end: end,
                    ),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 1000),
                      curve: Easing.standard,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(widget.isDesktop ? 6 : 24),
                        color: const Color.fromARGB(255, 241, 241, 241),
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      '+',
                      softWrap: false,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                        height: 1.1,
                        shadows: [...darkSmoothBoxShadow],
                        fontSize: 50,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
