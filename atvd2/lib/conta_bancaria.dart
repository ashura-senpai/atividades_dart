class ContaBancaria<T extends num> {
  T saldo;

  ContaBancaria(this.saldo);

  void depositar(T valor) {
    saldo = (saldo + valor) as T;
  }

  bool sacar(T valor) {
    if (valor <= saldo) {
      saldo = (saldo - valor) as T;
      return true;
    } else {
      return false;
    }
  }

  T consultarSaldo() {
    return saldo;
  }
}

void main() {
  var contaCorrente = ContaBancaria<int>(1000);
  contaCorrente.depositar(500);
  print('Saldo após depósito: ${contaCorrente.consultarSaldo()}');

  bool saque = contaCorrente.sacar(200);
  print('Saque realizado? $saque');
  print('Saldo após saque: ${contaCorrente.consultarSaldo()}');

  saque = contaCorrente.sacar(1500);
  print('Saque realizado? $saque');
  print('Saldo final: ${contaCorrente.consultarSaldo()}');


  var contaPoupanca = ContaBancaria<double>(2000.50);
  contaPoupanca.depositar(499.50);
  print('Saldo após depósito: ${contaPoupanca.consultarSaldo()}');
}