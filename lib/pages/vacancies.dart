import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:overscroll_pop/overscroll_pop.dart';
import 'package:smooth_corner/smooth_corner.dart';

const vacancies_screenshots = {
  'assets/images/vacancies/1.png',
  'assets/images/vacancies/2.png',
  'assets/images/vacancies/3.png',
  'assets/images/vacancies/4.png',
  'assets/images/vacancies/5.png',
  'assets/images/vacancies/6.png',
  'assets/images/vacancies/7.png',
};

class VacanciesPage extends StatefulWidget {
  const VacanciesPage({super.key});

  @override
  State<VacanciesPage> createState() => _VacanciesPageState();
}

class _VacanciesPageState extends State<VacanciesPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _animation = CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutCubicEmphasized,
        reverseCurve: Curves.easeInOutCubicEmphasized);
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mdof = MediaQuery.of(context);
    return Scaffold(
        body: SingleChildScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 800),
            height: 250,
            padding: mdof.size.aspectRatio > 0.5625
                ? const EdgeInsets.fromLTRB(16, 16, 16, 0)
                : EdgeInsets.zero,
            child: Hero(
              tag: '/vacancies',
              createRectTween: (begin, end) {
                return MaterialRectCenterArcTween(begin: begin, end: end);
              },
              flightShuttleBuilder: (flightContext, animation, flightDirection,
                  fromHeroContext, toHeroContext) {
                return AnimatedBuilder(
                  animation: CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeInOutCubicEmphasized),
                  builder: (context, child) {
                    return SmoothClipRRect(
                      smoothness: 0.6,
                      borderRadius: mdof.size.aspectRatio > 0.5625
                          ? BorderRadius.circular(6 + 90 * animation.value)
                          : BorderRadius.circular(6 - 6 * animation.value),
                      child: mdof.size.aspectRatio > 0.5625
                          ? Stack(
                              fit: StackFit.expand,
                              children: [
                                fromHeroContext.widget,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 48.0),
                                        child: IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: const Icon(Icons.arrow_back)),
                                      ),
                                    ),
                                    const Spacer(),
                                    Flexible(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 48.0),
                                        child: IconButton(
                                            onPressed: () {
                                              //copy link to clipboard
                                              Clipboard.setData(const ClipboardData(
                                                  text:
                                                      'https://www.google.com'));
                                            },
                                            icon: const Icon(Icons.copy)),
                                      ),
                                    )
                                  ],
                                ),
                                const Center(
                                  child: DefaultTextStyle(
                                      style: TextStyle(
                                          fontFamily: 'Neue',
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 50),
                                      child: Text(
                                        " Vacancies",
                                        softWrap: false,
                                        overflow: TextOverflow.fade,
                                      )),
                                ),
                              ],
                            )
                          : Stack(
                              fit: StackFit.expand,
                              children: [
                                fromHeroContext.widget,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 16.0),
                                        child: IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: const Icon(Icons.arrow_back)),
                                      ),
                                    ),
                                    const DefaultTextStyle(
                                        style: TextStyle(
                                            fontFamily: 'Neue',
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 50),
                                        child: Text(
                                          " Vacancies",
                                          softWrap: false,
                                          overflow: TextOverflow.fade,
                                        )),
                                    const SizedBox.shrink(),
                                  ],
                                ),
                              ],
                            ),
                    );
                  },
                  child: fromHeroContext.widget,
                );
              },
              child: SmoothClipRRect(
                smoothness: 0.6,
                borderRadius: mdof.size.aspectRatio > 0.5625
                    ? BorderRadius.circular(96)
                    : const BorderRadius.only(
                        topLeft: Radius.circular(48),
                        topRight: Radius.circular(48),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      ),
                child: Material(
                  child: Ink.image(
                    image: const AssetImage('assets/images/vacancies.png'),
                    fit: BoxFit.cover,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left:
                                  mdof.size.aspectRatio > 0.5625 ? 48.0 : 16.0),
                          child: IconButton(
                              onPressed: () async {
                                _controller.reverse();
                                await Future.delayed(
                                    const Duration(milliseconds: 200));
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back)),
                        ),
                        const Flexible(
                          child: DefaultTextStyle(
                              style: TextStyle(
                                  fontFamily: 'Neue',
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 50),
                              child: Text(
                                " Vacancies",
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.fade,
                              )),
                        ),
                        mdof.size.aspectRatio > 0.5625
                            ? Padding(
                                padding: EdgeInsets.only(
                                    right: mdof.size.aspectRatio > 0.5625
                                        ? 48.0
                                        : 16.0),
                                child: IconButton(
                                    onPressed: () {
                                      //copy link to clipboard
                                      Clipboard.setData(const ClipboardData(
                                          text: 'https://www.google.com'));
                                    },
                                    icon: const Icon(Icons.copy)),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              alignment: Alignment.center,
              constraints: const BoxConstraints(maxWidth: 800),
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, 1000 * (1 - _animation.value)),
                    child: child,
                  );
                },
                child: Card(
                  color: const Color(0xff1c1c1c),
                  margin: mdof.size.aspectRatio > 0.5625
                      ? const EdgeInsets.all(16)
                      : EdgeInsets.zero,
                  shape: SmoothRectangleBorder(
                    smoothness: 0.6,
                    borderRadius: mdof.size.aspectRatio > 0.5625
                        ? BorderRadius.circular(96)
                        : const BorderRadius.only(
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(0),
                            bottomLeft: Radius.circular(48),
                            bottomRight: Radius.circular(48),
                          ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 48,
                        ),
                        const HeaderWidget(
                          title: 'SCREENSHOTS.',
                        ),
                        _buildScreenshotsList(),
                        const SizedBox(
                          height: 48,
                        ),
                        const HeaderWidget(
                          title: 'DESCRIPTION.',
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc ut aliquam aliquam, nunc nisl aliquet nisl, eget aliquam nisl nisl sit amet nisl. Sed euismod, nunc ut aliquam aliquam, nunc nisl aliquet nisl, eget aliquam nisl nisl sit amet nisl.',
                          style: TextStyle(
                              fontFamily: 'Neue',
                              color: Colors.white,
                              fontSize: 16),
                        ),
                        const SizedBox(
                          height: 800,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  SizedBox _buildScreenshotsList() {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: ListView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            children: List.generate(vacancies_screenshots.length, (index) {
              // print(index);
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Hero(
                  tag: 'screenshot$index',
                  createRectTween: (begin, end) {
                    return MaterialRectCenterArcTween(begin: begin, end: end);
                  },
                  child: Material(
                    shape: SmoothRectangleBorder(
                        smoothness: 0.6,
                        borderRadius: BorderRadius.circular(8)),
                    child: InkWell(
                      onTap: () {
                        print(index);
                        context.pushTransparentRoute(
                          PageView(
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            // padEnds: true,
                            controller: PageController(
                                initialPage: index, viewportFraction: 1),
                            children: List.generate(
                              vacancies_screenshots.length,
                              (index2) => ExpandedImageWidget(index2),
                            ),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(8),
                      child: Ink(
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: AssetImage(
                                    vacancies_screenshots.elementAt(index)),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ),
                ),
              );
            })),
      ),
    );
  }
}

class ExpandedImageWidget extends StatelessWidget {
  const ExpandedImageWidget(
    this.index, {
    super.key,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return DismissiblePage(
      onDismissed: () {
        Navigator.pop(context);
      },
      startingOpacity: 0.5,
      isFullScreen: false,
      backgroundColor: Colors.black,
      child: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 1.2,
          width: 400,
          child: Hero(
            tag: 'screenshot$index',
            createRectTween: (begin, end) {
              return MaterialRectCenterArcTween(begin: begin, end: end);
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      image: AssetImage(vacancies_screenshots.elementAt(index)),
                      fit: BoxFit.cover)),
            ),
          ),
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(title,
              style: const TextStyle(
                  fontFamily: 'Neue',
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 80)),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Divider(),
        ),
      ],
    );
  }
}
