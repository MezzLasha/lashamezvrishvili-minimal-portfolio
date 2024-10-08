import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:smooth_corner/smooth_corner.dart';

import '../project_widgets.dart';
import 'page_model.dart';

class PageSkeleton extends StatefulWidget {
  const PageSkeleton(this.pageModel, {super.key});

  final PageModel pageModel;

  @override
  State<PageSkeleton> createState() => _PageSkeletonState();
}

class _PageSkeletonState extends State<PageSkeleton> with SingleTickerProviderStateMixin {
  static const _pageConstraints = BoxConstraints(maxWidth: 900);

  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Easing.standard,
      reverseCurve: Easing.standard,
    );
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.sizeOf(context).aspectRatio > 0.5625;
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            stretch: true,
            backgroundColor: Colors.transparent,
            collapsedHeight: 250,
            expandedHeight: 250,
            flexibleSpace: _buildAppBar(isDesktop),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: ConstrainedBox(
                constraints: _pageConstraints,
                child: AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) => Transform.translate(
                    offset: Offset(0, 1000 * (1 - _animation.value)),
                    child: child,
                  ),
                  child: Card(
                    color: const Color(0xff0a0a0a),
                    margin: isDesktop ? const EdgeInsets.all(16) : EdgeInsets.zero,
                    shape: SmoothRectangleBorder(
                      smoothness: 0.6,
                      borderRadius: isDesktop
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
                          if (isDesktop) const SizedBox(height: 48),
                          _buildPageSections(),
                          BackButtonProjectAnimating(controller: _controller),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageSections() => Column(
        children: widget.pageModel.sections
            .map((e) => Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: e.build(context),
                ))
            .toList(),
      );

  Widget _buildAppBar(bool isDesktop) => FlexibleSpaceBar(
        background: Container(
          height: 250,
          alignment: Alignment.center,
          padding: isDesktop ? const EdgeInsets.fromLTRB(16, 16, 16, 0) : EdgeInsets.zero,
          child: ConstrainedBox(
            constraints: _pageConstraints,
            child: Hero(
              tag: widget.pageModel.path,
              createRectTween: (b, e) => MaterialRectCenterArcTween(begin: b, end: e),
              flightShuttleBuilder: (flightCtx, anim, flightDir, fromHeroCtx, toHeroCtx) {
                return AnimatedBuilder(
                  animation: CurvedAnimation(parent: anim, curve: Easing.standard),
                  builder: (context, child) => SmoothClipRRect(
                    smoothness: 0.6,
                    borderRadius: isDesktop
                        ? BorderRadius.circular(6 + 90 * anim.value)
                        : BorderRadius.only(
                            topLeft: Radius.circular(24 + 24 * anim.value),
                            topRight: Radius.circular(24 + 24 * anim.value),
                            bottomLeft: Radius.circular((24 - 24 * anim.value)),
                            bottomRight: Radius.circular((24 - 24 * anim.value)),
                          ),
                    child: isDesktop
                        ? Material(
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Ink.image(
                                  image: AssetImage(widget.pageModel.backgroundImage),
                                  fit: BoxFit.cover,
                                ),
                                Opacity(
                                  opacity: anim.value,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 48.0),
                                        child: IconButton(
                                          onPressed: () => Navigator.pop(context),
                                          color: Colors.black,
                                          icon: const Icon(Icons.arrow_back),
                                        ),
                                      ),
                                      const Spacer(),
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.only(right: 48.0),
                                          child: IconButton(
                                            tooltip: widget.pageModel.actionLinkHint,
                                            onPressed: () =>
                                                launch(widget.pageModel.actionLink),
                                            color: Colors.black,
                                            icon: const Icon(Icons.open_in_new),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Center(
                                  child: DefaultTextStyle.merge(
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 50,
                                    ),
                                    child: Text(
                                      " ${widget.pageModel.title}",
                                      softWrap: false,
                                      overflow: TextOverflow.fade,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Material(
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                child ?? toHeroCtx.widget,
                                Opacity(
                                  opacity: anim.value,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 16.0),
                                          child: IconButton(
                                            onPressed: () {},
                                            color: Colors.black,
                                            icon: const Icon(Icons.arrow_back),
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                ),
                                Center(
                                  child: DefaultTextStyle.merge(
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 50,
                                    ),
                                    child: Text(
                                      " ${widget.pageModel.title}",
                                      softWrap: false,
                                      overflow: TextOverflow.fade,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ),
                  child: Container(
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
                        image: AssetImage(widget.pageModel.backgroundImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
              child: SmoothClipRRect(
                smoothness: 0.6,
                borderRadius: isDesktop
                    ? BorderRadius.circular(96)
                    : const BorderRadius.only(
                        topLeft: Radius.circular(48),
                        topRight: Radius.circular(48),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      ),
                child: Material(
                  child: Ink.image(
                    image: AssetImage(widget.pageModel.backgroundImage),
                    fit: BoxFit.cover,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Center(
                          child: DefaultTextStyle.merge(
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 50,
                              ),
                              child: Text(
                                " ${widget.pageModel.title}",
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.fade,
                              )),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: isDesktop ? 48.0 : 16.0),
                              child: IconButton(
                                  onPressed: () async {
                                    _controller.reverse();
                                    await Future.delayed(
                                        const Duration(milliseconds: 100));
                                    if (mounted) Navigator.pop(context);
                                  },
                                  color: Colors.black,
                                  icon: const Icon(Icons.arrow_back)),
                            ),
                            isDesktop
                                ? Padding(
                                    padding:
                                        EdgeInsets.only(right: isDesktop ? 48.0 : 16.0),
                                    child: IconButton(
                                      onPressed: () =>
                                          launch(widget.pageModel.actionLink),
                                      color: Colors.black,
                                      icon: const Icon(Icons.open_in_new),
                                    ),
                                  )
                                : const SizedBox.shrink(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
