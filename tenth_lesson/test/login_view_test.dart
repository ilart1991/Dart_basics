import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tenth_lesson/main.dart';

void main() {
  testWidgets("Login view test", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      key: const Key("matapp"),
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginView(title: "Login/register"),
    ));

    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key("logBtn")));

    // логин
    expect(find.byKey(const Key("fieldEmail")), findsOneWidget);
    expect(find.byKey(const Key("fieldPhone")), findsOneWidget);
    expect(find.byKey(const Key("sendLoginBtn")), findsOneWidget);

    final TextFormField fieldEmail =
        tester.widget<TextFormField>(find.byKey(Key('fieldEmail')));

    await tester.enterText(find.byWidget(fieldEmail), 'mail@mail.ru');
    expect(find.text('mail@mail.ru'), findsOneWidget);

    await tester.enterText(find.byKey(const Key('fieldPhone')), '123');
    expect(find.text('123'), findsOneWidget);

    await tester.tap(find.byKey(const Key("sendLoginBtn")));
    await tester.pump();
    expect(find.text('Добро пожаловать'), findsOneWidget);
    await tester.tap(find.byKey(const Key("regBtn")));
    await tester.pump();

    // регистрация
    expect(find.byKey(const Key("firstNameField")), findsOneWidget);
    expect(find.byKey(const Key("lastNameField")), findsOneWidget);
    expect(find.byKey(const Key("numbersFieldReg")), findsOneWidget);
    expect(find.byKey(const Key("sendRegBtn")), findsOneWidget);

    await tester.enterText(find.byKey(const Key('firstNameField')), 'Артем');
    await tester.enterText(find.byKey(const Key('lastNameField')), 'Ильинский');
    await tester.enterText(find.byKey(const Key('numbersFieldReg')), '12345');

    await tester.tap(find.byKey(const Key("sendRegBtn")));
    await tester.pump();
    expect(find.text('Вы успешно зарегистрировались'), findsOneWidget);
  });
}
