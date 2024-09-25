import 'package:test/test.dart';
import 'package:atvd2/conta_bancaria.dart';

void main() {
  group('ContaBancaria - Inteiro', () {
    test('Depósito deve aumentar o saldo', () {
      var conta = ContaBancaria<int>(1000);
      conta.depositar(500);
      expect(conta.consultarSaldo(), equals(1500));
    });

    test('Saque com saldo suficiente deve ser realizado', () {
      var conta = ContaBancaria<int>(1000);
      var result = conta.sacar(300);
      expect(result, isTrue);
      expect(conta.consultarSaldo(), equals(700));
    });

    test('Saque com saldo insuficiente não deve ser realizado', () {
      var conta = ContaBancaria<int>(500);
      var result = conta.sacar(1000);
      expect(result, isFalse);
      expect(conta.consultarSaldo(), equals(500));
    });
  });

  group('ContaBancaria - Double', () {
    test('Depósito deve aumentar o saldo', () {
      var conta = ContaBancaria<double>(2000.50);
      conta.depositar(499.50);
      expect(conta.consultarSaldo(), equals(2500.0));
    });

    test('Saque com saldo suficiente deve ser realizado', () {
      var conta = ContaBancaria<double>(2000.50);
      var result = conta.sacar(500.50);
      expect(result, isTrue);
      expect(conta.consultarSaldo(), equals(1500.0));
    });

    test('Saque com saldo insuficiente não deve ser realizado', () {
      var conta = ContaBancaria<double>(2000.50);
      var result = conta.sacar(2500.0);
      expect(result, isFalse);
      expect(conta.consultarSaldo(), equals(2000.50));
    });
  });
}
