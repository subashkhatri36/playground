import 'package:flutter/material.dart';
import 'package:playground/walk_through/model/walk_through_model.dart';

class WalkThroughPage extends StatefulWidget {
  const WalkThroughPage({
    Key? key,
    required this.walkThroughList,
    required this.onPressed,
  }) : super(key: key);
  final List<WalkThroughModel> walkThroughList;
  final VoidCallback onPressed;

  @override
  _WalkThroughPageState createState() => _WalkThroughPageState();
}

class _WalkThroughPageState extends State<WalkThroughPage> {
  PageController pageViewController = PageController(initialPage: 0);

  //TODO: Controller to control all page view
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageViewController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.walkThroughList.length,
        itemBuilder: (context, index) {
          WalkThroughModel walkThroughModel = widget.walkThroughList[index];
          return _Pages(
            walkThroughModel: walkThroughModel,
            index: index,
            pageViewController: pageViewController,
            totalPage: widget.walkThroughList.length,
            onPressed: widget.onPressed,
          );
        },
      ),
    );
  }
}

class _Pages extends StatefulWidget {
  const _Pages({
    Key? key,
    required this.walkThroughModel,
    required this.index,
    required this.pageViewController,
    required this.totalPage,
    required this.onPressed,
  }) : super(key: key);

  final WalkThroughModel walkThroughModel;
  final int index;
  final PageController pageViewController;
  final int totalPage;
  final VoidCallback onPressed;

  @override
  State<_Pages> createState() => _PagesState();
}

class _PagesState extends State<_Pages> {
  changePage(int pageIndex) {
    widget.pageViewController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _StudentImageWidget(
          image: widget.walkThroughModel.image ?? '',
        ),
        _CountryDescriptionWidget(
          titleColor: walkThroughEnumToColor(
              widget.walkThroughModel.countryColor ?? 'blue'),
          totalPage: widget.totalPage,
          index: widget.index,
          description: widget.walkThroughModel.description ?? '',
          mapImage: widget.walkThroughModel.mapImage ?? '',
          onPageIndexChange: () => changePage(widget.index),
          title: widget.walkThroughModel.country ?? '',
          onPressed: widget.onPressed,
        )
      ],
    );
  }
}

class _StudentImageWidget extends StatelessWidget {
  const _StudentImageWidget({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: FadeInImage.assetNetwork(
        placeholder: 'assets/images/test.png',
        image: image,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
    );
  }
}

class _CountryDescriptionWidget extends StatelessWidget {
  const _CountryDescriptionWidget({
    Key? key,
    required this.titleColor,
    required this.title,
    required this.description,
    required this.mapImage,
    this.onPressed,
    required this.totalPage,
    required this.index,
    required this.onPageIndexChange,
  }) : super(key: key);
  final Color titleColor;
  final String title;
  final String description;
  final String mapImage;
  final int index;
  final int totalPage;
  final VoidCallback? onPressed;
  final VoidCallback? onPageIndexChange;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.centerRight,
            color: titleColor,
            padding: const EdgeInsets.all(8.0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.06,
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Center(
                    child: Text(
                      title,

                      // widget.walkThroughModel.country?.toUpperCase() ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.topRight,
            padding: const EdgeInsets.only(
              right: 5,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5, top: 10),
                          child: Text(
                            description,
                            // widget.walkThroughModel.description ?? '',
                            textAlign: TextAlign.justify,
                            maxLines: 10,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FadeInImage.assetNetwork(
                      placeholder: 'assets/images/test.png',
                      image: mapImage,
                      // widget.walkThroughModel.mapImage ?? '',
                      width: MediaQuery.of(context).size.width * 0.4,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          //TODO: change button Color
                          ElevatedButton(
                            onPressed: onPressed,
                            child: const Text('Skip'),
                          ),
                          if (index < totalPage - 1)
                            ElevatedButton(
                              onPressed: () => onPageIndexChange,
                              child: const Text('Next'),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
