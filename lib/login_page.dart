import 'package:aula1/Pages/home_page.dart';
import 'package:aula1/Widgets/app_Button.dart';
import 'package:aula1/Widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'api/login_api.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _Tlogin = TextEditingController();

  final _Tsenha = TextEditingController();

  final _focusSenha = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carros'),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  _body() {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 50,
        ),
        child: ListView(
          children: <Widget>[
            AppText(
              'login',
              'Digite o Login',
              controller: _Tlogin,
              validator: _validateLogin,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              nextFocus: _focusSenha,
            ),
            SizedBox(
              height: 20,
            ),
            AppText(
              'senha',
              'Digite a senha',
              senha: true,
              controller: _Tsenha,
              validator: _validateSenha,
              keyboardType: TextInputType.number,
              focusNode: _focusSenha,
            ),
            SizedBox(height: 10),
            AppButton(
              'Login',
              _onClickLogin,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onClickLogin() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    String login = _Tlogin.text;
    String senha = _Tsenha.text;
    print('Login: $login,Senha:,$senha');

    bool ok = await LoginApi.login(login,senha);
    if(ok){
      Navigator.push(context,
          MaterialPageRoute(builder: (context)=>HomePage()));
    }
  }

  String? _validateLogin(String? text) {
    if (text!.isEmpty) {
      return ('Digite o login');
    }
    if (text.trim().length < 5) {
      return 'Mínimo de 5 Caracteres';
    }
    return null;
  }

  String? _validateSenha(String? text) {
    if (text!.isEmpty) {
      return ('Digite o Senha');
    }
    if (text.trim().length < 3) {
      return 'Mínimo de 5 Caracteres';
    }
    return null;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
