part of 'operaciones_bloc.dart';

class OperacionesState {
  final String resultado;
  final String primerentrada;
  final String segundaentrada;
  final String op;

  OperacionesState(
      {this.resultado = '0',
      this.primerentrada = '0',
      this.segundaentrada = '0',
      this.op = '+'});

  OperacionesState copyWith({
    String? resultado,
    String? primerentrada,
    String? segundaentrada,
    String? op,
  }) =>
      OperacionesState(
        resultado: resultado ?? this.resultado,
        primerentrada: primerentrada ?? this.primerentrada,
        segundaentrada: segundaentrada ?? this.segundaentrada,
        op: op ?? this.op,
      );
}
