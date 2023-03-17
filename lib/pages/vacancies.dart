import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VacanciesPage extends StatelessWidget {
  const VacanciesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: const Text('Vacancies'),
            expandedHeight: 300,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Padding(
                padding: const EdgeInsets.all(16),
                child: Hero(
                  tag: '/vacancies',
                  createRectTween: (begin, end) {
                    return MaterialRectCenterArcTween(begin: begin, end: end);
                  },
                  flightShuttleBuilder: (flightContext, animation,
                      flightDirection, fromHeroContext, toHeroContext) {
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
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            const Placeholder(),
            const Placeholder(),
          ])),
        ],
      ),
    );
  }
}
