import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '/pages_config.dart';
import 'package:smooth_corner/smooth_corner.dart';

import '/pages/home/widgets/about_me_button.dart';
import '/pages/home/widgets/add_project_tile.dart';
import '/widgets/logo_widget.dart';
import '/widgets/misc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
  );

  List<bool> hovering = List.generate(pagesConfig.length, (index) => false);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).aspectRatio < 0.5625;
    return Scaffold(
      appBar: AppBar(
        title: const LogoWidget(),
        centerTitle: true,
        titleSpacing: 0,
        toolbarHeight: 100,
      ),
      body: Stack(
        children: [
          Center(
            child: ListView(
              shrinkWrap: true,
              clipBehavior: Clip.none,
              physics:
                  const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              children: [isMobile ? buildMobileVersion() : buildDesktopVersion()],
            ),
          ),
          AboutMeButton(controller: _controller),
        ],
      ),
    );
  }

  Widget buildDesktopVersion() => Padding(
        padding: const EdgeInsets.only(bottom: 96.0),
        child: Center(
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              ...List.generate(
                pagesConfig.length,
                (index) => _buildProjectTile(index, isDesktop: true),
              ),
              AddProjectTile(isDesktop: true, controller: _controller),
            ],
          ),
        ),
      );

  Widget buildMobileVersion() => Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 128.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(24.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'My Projects',
                    style: TextStyle(
                      fontSize: 36,
                      letterSpacing: -3,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              ...List.generate(
                pagesConfig.length,
                (index) => _buildProjectTile(index, isDesktop: false),
              ),
              AddProjectTile(isDesktop: false, controller: _controller),
            ],
          ),
        ),
      );

  Widget _buildProjectTile(int index, {required bool isDesktop}) => Animate(
        effects: [
          ScaleEffect(
            curve: Easing.standard,
            delay: Duration(milliseconds: 100 * index),
          ),
          FlipEffect(
            curve: Easing.standard,
            delay: Duration(milliseconds: 100 * index),
          )
        ],
        controller: _controller,
        child: Padding(
          padding: isDesktop
              ? const EdgeInsets.all(10)
              : const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: InkWell(
            onTap: () => Navigator.pushNamed(context, pagesConfig.elementAt(index).path),
            splashFactory: NoSplash.splashFactory,
            onHover: isDesktop ? (hov) => setState(() => hovering[index] = hov) : null,
            borderRadius: BorderRadius.circular(isDesktop ? 6 : 24),
            child: AnimatedContainer(
              width: isDesktop ? (hovering[index] ? 200 : 160) : double.infinity,
              duration: const Duration(milliseconds: 700),
              curve: Easing.standard,
              height: 160,
              child: _buildHeroWidget(index, isDesktop),
            ),
          ),
        ),
      );

  Widget _buildHeroWidget(int index, bool isDesktop) {
    final config = pagesConfig.elementAt(index);
    final name = config.title;
    return Hero(
      tag: config.path,
      createRectTween: (begin, end) => MaterialRectCenterArcTween(begin: begin, end: end),
      flightShuttleBuilder: (fctx, animation, fdir, fromCtx, toCtx) => AnimatedBuilder(
        animation: CurvedAnimation(parent: animation, curve: Easing.standard),
        builder: (context, child) => SmoothClipRRect(
          smoothness: 0.6,
          borderRadius: isDesktop
              ? BorderRadius.circular(6 + 90 * animation.value)
              : BorderRadius.only(
                  topLeft: Radius.circular(24 + 24 * animation.value),
                  topRight: Radius.circular(24 + 24 * animation.value),
                  bottomLeft: Radius.circular((24 - 24 * animation.value)),
                  bottomRight: Radius.circular((24 - 24 * animation.value)),
                ),
          child: Material(
            child: Stack(
              fit: StackFit.expand,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.0197),
                        spreadRadius: 0,
                        offset: Offset(0, 2.77),
                        blurRadius: 2.21,
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage(config.backgroundImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Opacity(
                  opacity: animation.value,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: isDesktop ? 48.0 : 16.0),
                        child: IconButton(
                          onPressed: () {},
                          color: Colors.black,
                          icon: const Icon(Icons.arrow_back),
                        ),
                      ),
                      if (isDesktop) const Spacer(),
                      if (isDesktop)
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 48.0),
                            child: IconButton(
                              onPressed: () {},
                              color: Colors.black,
                              icon: const Icon(Icons.open_in_new),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                child!,
              ],
            ),
          ),
        ),
        child: Center(
          child: DefaultTextStyle.merge(
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 50,
            ),
            child: Text(
              " $name",
              softWrap: false,
              overflow: TextOverflow.fade,
            ),
          ),
        ),
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 1000),
        curve: Easing.standard,
        decoration: BoxDecoration(
          boxShadow: isDesktop && hovering[index]
              ? darkSmoothBoxShadow
              : const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.0197),
                    spreadRadius: 0,
                    offset: Offset(0, 2.77),
                    blurRadius: 2.21,
                  ),
                ],
          borderRadius: BorderRadius.circular(isDesktop ? 6 : 24),
          image: DecorationImage(
            image: AssetImage(config.backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: DefaultTextStyle.merge(
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 50,
            ),
            child: Text(
              ' $name',
              softWrap: false,
              overflow: TextOverflow.fade,
            ),
          ),
        ),
      ),
    );
  }
}
