import 'package:flutter/material.dart';

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
                              BorderRadius.circular(6 + 96 * animation.value),
                          child: child,
                        );
                      },
                      child: fromHeroContext.widget,
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(96),
                    child: Material(
                      child: Ink.image(
                        image: NetworkImage(
                            'https://lh3.googleusercontent.com/gK__LLaM4jqISqweP0_fxKpBhJuJgSJPqb7wuwRyqMwSBRnj1RJtgXrw69gdLsy2lyH33idBUO5whDJl1TYaHT50hMZc-tj1L49Iq0ctbynuU-0FbFk=w960'),
                        fit: BoxFit.cover,
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back)),
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
