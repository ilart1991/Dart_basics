import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

TextEditingController emailController = TextEditingController();
TextEditingController fNameController = TextEditingController();
TextEditingController lNameController = TextEditingController();
bool success = false;
GlobalKey<FormState> _formKey = GlobalKey<FormState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: const Key("matapp"),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginView(title: "Login/register"),
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView({super.key, required this.title});
  final String title;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String message = "";

  bool login = false;
  @override
  Widget build(BuildContext context) {
    if (success) {
      if (login) {
        message = "Вы успешно зарегистрировались";
      } else {
        message = "Добро пожаловать";
      }
    }

    bool validateEmail(String value) {
      String pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regex = RegExp(pattern);
      return (!regex.hasMatch(value)) ? false : true;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(message),
          Row(
            children: [
              MaterialButton(
                key: const Key("logBtn"),
                color: login ? Colors.white : Colors.blue.shade100,
                child: const Text("LOGIN"),
                onPressed: () {
                  success = false;
                  login = false;
                  setState(() {});
                },
              ),
              MaterialButton(
                key: const Key("regBtn"),
                color: !login ? Colors.white : Colors.blue.shade100,
                child: const Text("REGISTRATION"),
                onPressed: () {
                  success = false;
                  login = true;
                  setState(() {});
                },
              )
            ],
          ),
          Visibility(
            key: _formKey,
            visible: !login,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    key: const Key("fieldEmail"),
                    decoration: const InputDecoration(label: Text("e-mail")),
                  ),
                  TextFormField(
                    key: const Key("fieldPhone"),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: const InputDecoration(label: Text("phone")),
                  ),
                  MaterialButton(
                    key: const Key("sendLoginBtn"),
                    child: const Text("SEND"),
                    onPressed: () {
                      if (validateEmail(emailController.text)) {
                        success = true;
                        setState(() {});
                      }
                      ;
                    },
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: login,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    key: const Key("firstNameField"),
                    controller: fNameController,
                    decoration:
                        const InputDecoration(label: Text("first name")),
                  ),
                  TextField(
                    key: const Key("lastNameField"),
                    controller: lNameController,
                    decoration: const InputDecoration(label: Text("last name")),
                  ),
                  TextField(
                    key: const Key("numbersFieldReg"),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: const InputDecoration(label: Text("phone")),
                  ),
                  MaterialButton(
                    key: const Key("sendRegBtn"),
                    child: const Text("SEND"),
                    onPressed: () {
                      if (!fNameController.text.isEmpty &&
                          !lNameController.text.isEmpty) {
                        success = true;
                        setState(() {});
                      }
                    },
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
