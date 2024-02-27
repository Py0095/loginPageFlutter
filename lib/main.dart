import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyhommePage(),
    );
  }
}

class MyhommePage extends StatelessWidget {
  const MyhommePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: LoginForm(title: 'loginForm'));
  }
}

class LoginForm extends StatefulWidget {
  final String title;
  const LoginForm({super.key, required this.title});

  @override
  State<LoginForm> createState() => _LoginFom();
}

class _LoginFom extends State<LoginForm> {
  final _formkey = GlobalKey<FormState>();
  late String _username;
  late String _password;
  bool _accept = false;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Login',
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Username'),
              validator: (value) {
                if (value == null || value.isEmpty)
                  return 'Form must not be empty';
                return null;
              },
              onChanged: (value) => _username = value,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty)
                  return 'Form must not be empty';
                return null;
              },
              onChanged: (value) => _password = value,
            ),
            SizedBox(
              height: 10,
            ),

            Row(children: [
              Checkbox(
                value: _accept,
                onChanged: (value) {
                  setState(() {
                    _accept = value ?? false;
                  });
                },
              ),
              Text('Accept all conditions')
            ]),

            ElevatedButton(
              onPressed: () {
                if (_formkey.currentState!.validate() && _accept) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Formulaire soumis avec success')));
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Veuiller remplir tous les chammps et accepter les condition')));
                }

                print('Soumet');
              },
              child: Text('Soumet'),
            )
            // //Text('password'),
          ],
        ));
  }
}
