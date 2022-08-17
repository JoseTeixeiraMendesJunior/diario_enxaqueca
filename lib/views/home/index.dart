import 'package:diario_enxaqueca/layouts/globalinfo.dart';
import 'package:diario_enxaqueca/layouts/globalwidget.dart';
import 'package:diario_enxaqueca/views/home/activities.dart';
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
    return Scaffold(
      backgroundColor: GlobalInfo.grey,
      body: ListView(
        children: [
          const LogoWidget(
            topPadding: 24,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, top: 32),
            child: Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(blurRadius: 3),
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
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16),
                        child: Container(
                          height: 75,
                          width: 60,
                          decoration: const BoxDecoration(
                              // image: DecorationImage()
                              color: Colors.red),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Nome do Usuário',
                              style: TextStyle(
                                  color: GlobalInfo.contrastColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'mais informações',
                              style: TextStyle(color: GlobalInfo.contrastColor),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'mais informações',
                              style: TextStyle(color: GlobalInfo.contrastColor),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('28 / OUT'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Ativiades do dia: '),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ListView(
                // controller: _scrollController,
                scrollDirection: Axis.horizontal,
                // physics: const ClampingScrollPhysics(),
                children: const [
                  ActionsWidget(
                    name: 'Registrar Crise',
                    activities: ['horario', 'instensidade'],
                  ),
                  ActionsWidget(
                    name: 'Registrar Alimentação',
                    activities: ['horario', 'alimentos'],
                  ),
                  ActionsWidget(
                    name: 'Registrar Atividades',
                    activities: ['horario', 'atividade'],
                  ),
                  ActionsWidget(
                    name: 'Registrar Eventualidade',
                    activities: ['horario', 'eventualidade'],
                  ),
                  ActionsWidget(
                    name: 'Registrar Atividade Física',
                    activities: ['horario', 'exercício'],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ActionsWidget extends StatelessWidget {
  const ActionsWidget({
    required this.name,
    required this.activities,
    Key? key,
  }) : super(key: key);

  final String name;
  final List activities;

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
        child: Card(
          color: GlobalInfo.secondaryColor,
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: Container(
              color: Colors.white,
              width: 100,
              height: 100,
              child: Center(
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: GlobalInfo.contrastColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
