import 'package:diario_enxaqueca/layouts/globalinfo.dart';
import 'package:diario_enxaqueca/layouts/widgets/custom_page_route.dart';
import 'package:diario_enxaqueca/layouts/widgets/globalwidget.dart';
import 'package:diario_enxaqueca/views/forms/activities.dart';
import 'package:diario_enxaqueca/views/forms/exaqueca.dart';
import 'package:diario_enxaqueca/views/forms/humor.dart';
import 'package:diario_enxaqueca/views/home/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: GlobalInfo.secondaryColor,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView(
            children: const [
              BoxOne(),
              BoxTwo(),
              SizedBox(height: 20),
              BoxThree(),
              SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
  }
}

class BoxOne extends StatelessWidget {
  const BoxOne({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      color: GlobalInfo.primaryColor,
      child: IntrinsicHeight(
        child: Column(
          children: [
            const LogoWidget(
              topPadding: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 32),
              child: GestureDetector(
                onHorizontalDragEnd: (details) {
                  if (details.primaryVelocity != null) {
                    if (details.primaryVelocity! <= 0) {
                      Navigator.of(context).push(CustomPageRoute(
                        child: const ProfileView(),
                        direction: AxisDirection.left,
                      ));
                    }
                  }
                },
                child: Container(
                  height: 120,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        offset: Offset(0, 5),
                        color: Colors.white10,
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                    color: GlobalInfo.tertiaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5, left: 5),
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Icon(
                              Icons.drag_indicator_rounded,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 8),
                            child: Container(
                              height: 75,
                              width: 56,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          'assets/images/avatar.png'))),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Nome do Usuário',
                                  style: TextStyle(
                                      color: GlobalInfo.contrastColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'arreste para mais informações',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: GlobalInfo.contrastColor),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BoxTwo extends StatefulWidget {
  const BoxTwo({Key? key}) : super(key: key);

  @override
  State<BoxTwo> createState() => _BoxTwoState();
}

class _BoxTwoState extends State<BoxTwo> {
  bool _visibleList = false;
  String _textButton = 'Ver mais';
  IconData _iconButton = Icons.expand_more_rounded;

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      // height: ,
      padding: const EdgeInsets.all(8),
      color: Colors.white,
      child: IntrinsicHeight(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: GestureDetector(
                onTap: () => print('abre calendário'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '28 / OUT',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: GlobalInfo.contrastColor,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.edit_calendar_rounded,
                      size: 20,
                      color: GlobalInfo.grey,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ExaquecaFormView(),
                            ),
                          ),
                          child: Card(
                            color: Colors.red,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 15),
                                  child: Text(
                                    'Regsitrar Crise de Enxaqueca',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.add_circle_outline_rounded,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HumorFormWidget(),
                            ),
                          ),
                          child: Card(
                            color: Colors.yellow[900],
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 15,
                                  ),
                                  child: Text(
                                    'Regsitrar Humor do Dia',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.add_circle_outline_rounded,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Registrar Atividades do Dia',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: GlobalInfo.contrastColor,
                ),
              ),
            ),
            Visibility(
              visible: _visibleList,
              child: SizedBox(
                height: 4 * 90,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    // controller: _scrollController,
                    // shrinkWrap: true,
                    // physics: const ClampingScrollPhysics(),
                    children: const [
                      ActionsWidget(
                        name: 'Registrar Alimentação',
                        activities: 'alimentos',
                        icon: Icons.restaurant_rounded,
                      ),
                      ActionsWidget(
                        name: 'Registrar Atividades',
                        activities: 'atividades',
                        icon: Icons.work_rounded,
                      ),
                      ActionsWidget(
                        name: 'Registrar Eventualidade',
                        activities: 'eventualidades',
                        icon: Icons.today_rounded,
                      ),
                      ActionsWidget(
                        name: 'Registrar Atividade Física',
                        activities: 'exercicios',
                        icon: Icons.fitness_center_rounded,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Divider(),
            ),
            InkWell(
              onTap: (() => _changeVisibilityList()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _textButton,
                    style: const TextStyle(
                        color: GlobalInfo.infoColor, fontSize: 14),
                  ),
                  Icon(
                    _iconButton,
                    color: GlobalInfo.infoColor,
                    size: 24,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _changeVisibilityList() {
    setState(() {
      _visibleList = !_visibleList;

      if (!_visibleList) {
        _textButton = 'Ver mais  ';
        _iconButton = Icons.expand_more_rounded;
      } else {
        _textButton = 'Ver menos  ';
        _iconButton = Icons.expand_less_rounded;
      }
    });
  }
}

class ActionsWidget extends StatelessWidget {
  const ActionsWidget({
    required this.name,
    required this.activities,
    required this.icon,
    Key? key,
  }) : super(key: key);

  final String name;
  final String activities;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ActivitiesView(
                name: name,
                activities: activities,
              ),
            )),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: GlobalInfo.tertiaryColor, width: 3)),
            // width: 100,
            height: 75,
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                color: GlobalInfo.secondaryColor,
                                borderRadius: BorderRadius.circular(50)),
                            child: Icon(
                              icon,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            color: GlobalInfo.contrastColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: GlobalInfo.grey,
                    size: 18,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BoxThree extends StatelessWidget {
  const BoxThree({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: const [MoreElements(), MoreElements(), MoreElements()],
        ),
      ),
    );
  }
}

class MoreElements extends StatelessWidget {
  const MoreElements({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        width: MediaQuery.of(context).size.width - 100,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
