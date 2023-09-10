// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project004_imc/main.dart';

void main() {
  testWidgets('Verifica a renderização dos campos de entrada',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Peso (kg)'), findsOneWidget);
    expect(find.text('Altura (m)'), findsOneWidget);
  });

  testWidgets('Verifica o cálculo do IMC', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    await tester.enterText(find.byType(TextField).first, '70'); // Insere o peso
    await tester.enterText(
        find.byType(TextField).last, '1.75'); // Insere a altura

    await tester.tap(find.text('Calcular IMC'));
    await tester.pump();

    expect(find.text('Resultado: Seu IMC é 22.86'), findsOneWidget);
    expect(find.text('Classificação: SAUDÁVEL'), findsOneWidget);
  });

  testWidgets('Verifica o tratamento de erro para valores inválidos',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    await tester.enterText(
        find.byType(TextField).first, '-70'); // Insere um peso inválido
    await tester.enterText(
        find.byType(TextField).last, '0'); // Insere uma altura inválida

    await tester.tap(find.text('Calcular IMC'));
    await tester.pump();

    expect(
        find.text(
            'Resultado: Por favor, insira valores válidos para peso e altura.'),
        findsOneWidget);
    expect(find.text('Classificação: '), findsOneWidget);
  });
}
