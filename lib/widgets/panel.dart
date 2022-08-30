import 'package:calculadora/bloc/Operaciones/operaciones_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'linea.dart';
import 'main_result.dart';
import 'sub_result.dart';

class Panel extends StatelessWidget {
  const Panel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OperacionesBloc, OperacionesState>(
      builder: (context, state) {
        if (state.primerentrada == '0' && state.segundaentrada == '0') {
          return MainResultText(
              text: state.resultado.endsWith('.0')
                  ? state.resultado.substring(0, state.resultado.length - 2)
                  : state.resultado);
        }
        return Column(
          children: [
            SubResult(text: state.primerentrada),
            SubResult(text: state.op),
            SubResult(
                text: state.segundaentrada.endsWith('.0')
                    ? state.segundaentrada.substring(0, state.segundaentrada.length - 2)
                    : state.segundaentrada),
            const Linea(),
            MainResultText(
                text: state.resultado.endsWith('.0')
                    ? state.resultado.substring(0, state.resultado.length - 2)
                    : state.resultado),
          ],
        );
      },
    );
  }
}
