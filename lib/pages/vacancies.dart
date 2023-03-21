import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:smooth_corner/smooth_corner.dart';

const vacanciesScreenshots = {
  'assets/images/vacancies_images/1.png',
  'assets/images/vacancies_images/2.png',
  'assets/images/vacancies_images/3.png',
  'assets/images/vacancies_images/4.png',
  'assets/images/vacancies_images/5.png',
  'assets/images/vacancies_images/6.png',
  'assets/images/vacancies_images/7.png',
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
                            : BorderRadius.only(
                                topLeft:
                                    Radius.circular(6 + 42 * animation.value),
                                topRight:
                                    Radius.circular(6 + 42 * animation.value),
                                bottomLeft:
                                    Radius.circular((6 - 6 * animation.value)),
                                bottomRight:
                                    Radius.circular((6 - 6 * animation.value)),
                              ),
                        child: mdof.size.aspectRatio > 0.5625
                            ? Material(
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    // toHeroContext.widget,

                                    Ink.image(
                                      image: const AssetImage(
                                          'assets/images/vacancies.png'),
                                      fit: BoxFit.cover,
                                    ),
                                    Opacity(
                                      opacity: animation.value,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 48.0),
                                            child: IconButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                icon: const Icon(
                                                    Icons.arrow_back)),
                                          ),
                                          const Spacer(),
                                          Flexible(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 48.0),
                                              child: IconButton(
                                                  onPressed: () {
                                                    //copy link to clipboard
                                                    Clipboard.setData(
                                                        const ClipboardData(
                                                            text:
                                                                'https://www.google.com'));
                                                  },
                                                  icon: const Icon(Icons.copy)),
                                            ),
                                          )
                                        ],
                                      ),
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
                                ),
                              )
                            : Material(
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    child ?? toHeroContext.widget,
                                    Opacity(
                                      opacity: animation.value,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 16.0),
                                              child: IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                      Icons.arrow_back)),
                                            ),
                                          ),
                                          const Spacer(),
                                        ],
                                      ),
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
                                ),
                              ));
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
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: mdof.size.aspectRatio > 0.5625
                                      ? 48.0
                                      : 16.0),
                              child: IconButton(
                                  onPressed: () async {
                                    _controller.reverse();
                                    await Future.delayed(
                                        const Duration(milliseconds: 200));
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.arrow_back)),
                            ),
                            mdof.size.aspectRatio > 0.5625
                                ? Padding(
                                    padding: EdgeInsets.only(
                                        right: mdof.size.aspectRatio > 0.5625
                                            ? 48.0
                                            : 16.0),
                                    child: IconButton(
                                        onPressed: () {
                                          //TODO OPEN SHARE MENU
                                          Clipboard.setData(const ClipboardData(
                                              text:
                                                  'https://play.google.com/store/apps/details?id=com.mezzlasha.vacancy'));
                                        },
                                        icon: const Icon(Icons.copy)),
                                  )
                                : const SizedBox.shrink(),
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
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.fade,
                              )),
                        ),
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
                        SizedBox(
                          height: mdof.size.aspectRatio > 0.5625 ? 48 : 0,
                        ),
                        _buildScreenshotsList(),
                        const SizedBox(
                          height: 48,
                        ),
                        _buildDescription(),
                        const SizedBox(
                          height: 48,
                        ),
                        const HeaderWidget(
                          title: 'Check it out on\nGoogle Play Store.',
                          style: TextStyle(
                              fontFamily: 'Neue',
                              color: Color(0xffd5fcc1),
                              fontSize: 30,
                              fontWeight: FontWeight.w900),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        AspectRatio(
                            aspectRatio: 1.734,
                            child: InkWell(
                              onTap: () async {
                                await launch(
                                    'https://play.google.com/store/apps/details?id=com.mezzlasha.vacancy');
                              },
                              customBorder: SmoothRectangleBorder(
                                smoothness: 0.6,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: Ink(
                                      decoration: BoxDecoration(
                                        borderRadius: SmoothRectangleBorder(
                                          smoothness: 0.6,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ).borderRadius,
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                'assets/images/vacancies_images/link_google_play_preview.png'),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: SmoothRectangleBorder(
                                        smoothness: 0.6,
                                        borderRadius: BorderRadius.circular(12),
                                      ).borderRadius,
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.transparent,
                                          Colors.black.withOpacity(0.2),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: const [
                                          Icon(
                                            Icons.link,
                                            color: Colors.black,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            'play.google.com',
                                            style: TextStyle(
                                                fontFamily: 'Neue',
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )),
                        const SizedBox(
                          height: 24,
                        ),
                        SizedBox(
                          height: 55,
                          child: OutlinedButton(
                              onPressed: () {
                                _controller.reverse();
                                Future.delayed(
                                        const Duration(milliseconds: 200))
                                    .then((value) => Navigator.pop(context));
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Icon(Icons.arrow_back_ios,
                                      color: Colors.white, size: 16),
                                  // const SizedBox(
                                  //   width: 8,
                                  // ),
                                  Text(
                                    'Back',
                                    style: TextStyle(
                                      fontFamily: 'Neue',
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              )),
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

  Column _buildDescription() {
    return Column(
      children: [
        const HeaderWidget(
          title: 'DESCRIPTION.',
        ),
        const SizedBox(
          height: 16,
        ),
        RichText(
          text: TextSpan(
            style: const TextStyle(
                fontFamily: 'Neue', color: Colors.white, fontSize: 16),
            children: [
              const TextSpan(
                  text:
                      'The Vacancies app is a mobile application that can be downloaded from the Google Play Store for Android users. It\'s designed to help you find and apply to your dream job with ease. \n\n'),
              const TextSpan(
                  text:
                      'The app supports automatic resume attachments, allowing you to apply to multiple job openings without having to search through multiple websites. The app uses web scraping technology to gather all the latest job advertisements from other websites and present them to you in one convenient location. \n\n'),
              const TextSpan(
                  text:
                      'It\'s built with Flutter and uses BLoC (Business Logic Component) and Stateful state management to provide a smooth and seamless experience. The app is integrated with Firebase Crash Analytics and Performance Monitoring. It\'s designed with the "'),
              TextSpan(
                  text: 'Material You',
                  style: TextStyle(
                      fontWeight: FontWeight.w200,
                      color: Theme.of(context).colorScheme.onPrimary)),
              const TextSpan(
                  text:
                      '" design language, ensuring a modern and intuitive interface for our users. \n\n'),
              const TextSpan(
                  text:
                      'Whether you\'re a seasoned professional or just starting out, the Vacancies app is the perfect tool to help you land your dream job. Give it a try today!'),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildScreenshotsList() {
    return Column(
      children: [
        const HeaderWidget(
          title: 'SCREENSHOTS.',
        ),
        SizedBox(
          height: 250,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: ListView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                children: List.generate(vacanciesScreenshots.length, (index) {
                  // print(index);
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Hero(
                      tag: 'screenshot$index',
                      createRectTween: (begin, end) {
                        return MaterialRectCenterArcTween(
                            begin: begin, end: end);
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
                                  vacanciesScreenshots.length,
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
                                        vacanciesScreenshots.elementAt(index)),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                      ),
                    ),
                  );
                })),
          ),
        ),
      ],
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
                      image: AssetImage(vacanciesScreenshots.elementAt(index)),
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
    this.style,
  });

  final String title;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(title,
              style: style ??
                  const TextStyle(
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
