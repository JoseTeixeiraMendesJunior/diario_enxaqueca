import 'package:diario_enxaqueca/layouts/globalinfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: GlobalInfo.primaryColor,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const LogoWidget(),
          const Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: TextField(),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: TextField(),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Cadastre-se',
                  style: TextStyle(color: GlobalInfo.infoColor),
                )),
          )
        ],
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 150,
      height: 150,
      child: const Text('Logo do app'),
    );
  }
}
