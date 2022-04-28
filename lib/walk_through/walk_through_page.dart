import 'package:flutter/material.dart';
import 'package:playground/walk_through/model/walk_through_model.dart';

class WalkThroughPage extends StatefulWidget {
  const WalkThroughPage({
    Key? key,
    required this.walkThroughList,
  }) : super(key: key);
  final List<WalkThroughModel> walkThroughList;
  @override
  _WalkThroughPageState createState() => _WalkThroughPageState();
}

class _WalkThroughPageState extends State<WalkThroughPage> {
  //TODO: Controller to control all page view
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: widget.walkThroughList.length,
        itemBuilder: (context, index) {
          WalkThroughModel walkThroughModel = widget.walkThroughList[index];
          return _Pages(walkThroughModel: walkThroughModel);
        },
      ),
    );
  }
}

class _Pages extends StatelessWidget {
  const _Pages({
    Key? key,
    required this.walkThroughModel,
  }) : super(key: key);

  final WalkThroughModel walkThroughModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 7,
          child: Image.network(
            walkThroughModel.image ?? '',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          flex: 3,
          child: Stack(
            children: [
              Container(
                alignment: Alignment.centerRight,
                color: walkThroughEnumToColor(
                    walkThroughModel.titleColor ?? 'blue'),
                padding: const EdgeInsets.all(8.0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.06,
                child: Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Center(
                        child: Text(
                          walkThroughModel.country?.toUpperCase() ?? '',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
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
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                walkThroughModel.description ?? '',
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Image.network(
                          walkThroughModel.mapImage ?? '',
                          width: MediaQuery.of(context).size.width * 0.4,
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                            left: 10,
                          ),
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: const Text('Skip'),
                              ),
                              ElevatedButton(
                                onPressed: () {},
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
        )
      ],
    );
  }
}
