import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final _Tlogin = TextEditingController();
  final _Tsenha = TextEditingController();

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
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            _text(
              'login',
              'Digite o Login',
              controller: _Tlogin,
              validator: _validateLogin,
            ),
            _text('senha', 'Digite a senha',
                senha: true, controller: _Tsenha,
            validator: _validateSenha,
            ),
            SizedBox(height: 10),
            _button('Login', _onClickLogin),
          ],
        ),
      ),
    );
  }

  _text(
    String label,
    String hint, {
    bool senha = false,
    required TextEditingController controller,
    FormFieldValidator<String>? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: senha,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.blue,
        ),
        hintText: hint,
      ),
    );
  }

  _button(String text, Function() onPressed) {
    return Container(
      height: 45,
      child: RaisedButton(
        color: Colors.white,
        child: Text(
          'Login',
          style: TextStyle(
            fontSize: 22,
            color: Colors.black,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }

  void _onClickLogin() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    String login = _Tlogin.text;
    String senha = _Tsenha.text;
    print('Login: $login,Senha:,$senha');
  }

  String? _validateLogin (String? text) {
      if (text!.isEmpty) {
        return ('Digite o login');
      }
      if(text.trim().length < 5){
        return 'Mínimo de 5 Caracteres';
      }
      return null;
  }
  String? _validateSenha (String? text) {
    if (text!.isEmpty) {
      return ('Digite o Senha');
    }
    if(text.trim().length < 5){
      return 'Mínimo de 5 Caracteres';
    }
    return null;
  }
}
