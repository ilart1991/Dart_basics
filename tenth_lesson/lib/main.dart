import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:email_validator/email_validator.dart';

TextEditingController emailController = TextEditingController();
TextEditingController fNameController = TextEditingController();
TextEditingController lNameController = TextEditingController();
bool success = false;
GlobalKey<FormState> _formKey = GlobalKey<FormState>();

String? validateEmail(String email) {
  const String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  final RegExp regex = RegExp(pattern);
  if (email.isEmpty || !regex.hasMatch(email)) {
    return 'Invalid email';
  } else {
    return null;
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {"/": (context) => LoginView(title: "Login/register")},
      // home: const LoginView(title: 'Login/register'),
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
                color: login ? Colors.white : Colors.blue.shade100,
                child: Text("LOGIN"),
                onPressed: () {
                  success = false;
                  login = false;
                  setState(() {});
                },
              ),
              MaterialButton(
                key: Key("regBtn"),
                color: !login ? Colors.white : Colors.blue.shade100,
                child: Text("REGISTRATION"),
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
                    key: Key("fieldEmail"),
                    decoration: InputDecoration(label: Text("e-mail")),
                  ),
                  TextFormField(
                    key: Key("fieldPhone"),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(label: Text("phone")),
                  ),
                  MaterialButton(
                    key: Key("sendLoginBtn"),
                    child: Text("SEND"),
                    onPressed: () {
                      const String pattern =
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                      final RegExp regex = RegExp(pattern);
                      if (emailController.text.isEmpty ||
                          !regex.hasMatch(emailController.text)) {
                        print("error");
                      } else {
                        success = true;
                        setState(() {});
                      }
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
                    key: Key("firstNameField"),
                    controller: fNameController,
                    decoration: InputDecoration(label: Text("first name")),
                  ),
                  TextField(
                    key: Key("lastNameField"),
                    controller: lNameController,
                    decoration: InputDecoration(label: Text("last name")),
                  ),
                  TextField(
                    key: Key("numbersFieldReg"),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(label: Text("phone")),
                  ),
                  MaterialButton(
                    key: Key("sendRegBtn"),
                    child: Text("SEND"),
                    onPressed: () {
                      if (!fNameController.text.isEmpty &&
                          !lNameController.text.isEmpty) {
                        success = true;
                        setState(() {});
                      } else {
                        print("error");
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
