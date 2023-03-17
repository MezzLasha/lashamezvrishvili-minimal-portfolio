import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';

class VacanciesPage extends StatelessWidget {
  const VacanciesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   toolbarHeight: 300,
        //   centerTitle: true,
        //   title:
        //   // expandedHeight: 300,
        //   automaticallyImplyLeading: false,
        // ),
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 800),
            height: 250,
            padding: const EdgeInsets.all(16),
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
                    return ClipRRect(
                      borderRadius:
                          BorderRadius.circular(6 + 90 * animation.value),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          fromHeroContext.widget,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 48.0),
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
                                  padding: const EdgeInsets.only(right: 48.0),
                                  child: IconButton(
                                      onPressed: () {
                                        //copy link to clipboard
                                        Clipboard.setData(const ClipboardData(
                                            text: 'https://www.google.com'));
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
                      ),
                    );
                  },
                  child: fromHeroContext.widget,
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(96),
                child: Material(
                  child: Ink.image(
                    image: const NetworkImage(
                        'https://lh3.googleusercontent.com/gK__LLaM4jqISqweP0_fxKpBhJuJgSJPqb7wuwRyqMwSBRnj1RJtgXrw69gdLsy2lyH33idBUO5whDJl1TYaHT50hMZc-tj1L49Iq0ctbynuU-0FbFk=w960'),
                    fit: BoxFit.cover,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 48.0),
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back)),
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
                        Padding(
                          padding: const EdgeInsets.only(right: 48.0),
                          child: IconButton(
                              onPressed: () {
                                //copy link to clipboard
                                Clipboard.setData(const ClipboardData(
                                    text: 'https://www.google.com'));
                              },
                              icon: const Icon(Icons.copy)),
                        )
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
              constraints: const BoxConstraints(maxWidth: 750),
              child: Animate(
                effects: [
                  SlideEffect(
                      begin: const Offset(0, 0.5),
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.easeInOutCubicEmphasized),
                ],
                child: Card(
                  color: Color(0xff1c1c1c),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(96)),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 48,
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('SCREENSHOTS.',
                              style: TextStyle(
                                  fontFamily: 'Neue',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 80)),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Divider(),
                        ),
                        Container(
                          height: 150,
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics()),
                                children: List.generate(
                                    10,
                                    (index) => Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8),
                                          child: Material(
                                            child: InkWell(
                                              onTap: () {},
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Ink(
                                                height: 150,
                                                width: 150,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    image: const DecorationImage(
                                                        image: NetworkImage(
                                                            'https://i.ebayimg.com/images/g/6wQAAOSw1~ZjRl2N/s-l500.jpg'),
                                                        fit: BoxFit.cover)),
                                              ),
                                            ),
                                          ),
                                        ))),
                          ),
                        ),
                        SizedBox(
                          height: 1000,
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
}
