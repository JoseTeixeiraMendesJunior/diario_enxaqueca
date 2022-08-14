import 'dart:ui';

import 'package:diario_enxaqueca/layouts/globalinfo.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [BackgraoundImage(), BodyLoginWidget()],
      ),
    );
  }
}

class BodyLoginWidget extends StatelessWidget {
  const BodyLoginWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        child: ClipRRect(
          child: Container(
            height: double.infinity,
            color: Colors.transparent,
            child: Stack(
              children: [
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                  child: Container(),
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                          Colors.white.withOpacity(0.50),
                          Colors.white.withOpacity(0.10)
                        ])),
                    child: Center(
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 32),
                            child: LogoWidget(),
                          ),
                          Container(
                            width: double.infinity,
                            height: 400,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 64, bottom: 32, right: 32, left: 32),
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                        hintText: 'Email'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 32, right: 32, left: 32),
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                        hintText: 'Senha'),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: const Text('Entrar'),
                                    )),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 32, right: 32, top: 32),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextButton(
                                            onPressed: () {},
                                            child: const Text(
                                              'Cadastrar-se',
                                              style: TextStyle(
                                                  color: GlobalInfo.infoColor),
                                            )),
                                        TextButton(
                                            onPressed: () {},
                                            child: const Text(
                                              'Recuperar Senha',
                                              style: TextStyle(
                                                  color: GlobalInfo.infoColor),
                                            )),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BackgraoundImage extends StatelessWidget {
  const BackgraoundImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover)),
    );
  }
}

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.25),
      child: SizedBox(
          // width: 150,
          // height: 150,
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.people_alt_rounded,
            color: GlobalInfo.tertiaryColor,
            size: 64,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: const [
                Text(
                  'Diário',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Enxaqueca',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
