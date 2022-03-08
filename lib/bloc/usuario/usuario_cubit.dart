import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:estado/models/usuario.dart';

part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {
  UsuarioCubit() : super(UsuarioInitial());

  void seleccionarUsuario(Usuario user) {
    emit(UsuarioActivo(user));
  }

  void cambiarEdad(int edad) {
    final currentState = state;

    if (currentState is UsuarioActivo) {
      currentState.usuario.edad = edad;

      final newUser = currentState.usuario.copyWith(edad: 25);
      emit(UsuarioActivo(newUser));
    }
  }

  void agregarProfesion() {
    final currentState = state;

    if (currentState is UsuarioActivo) {
      final List<String> newProfesiones = [
        ...currentState.usuario.profesiones ?? [],
        'Profesión ${(currentState.usuario.profesiones?.length ?? 0) + 1}'
      ];

      final newUser =
          currentState.usuario.copyWith(profesiones: newProfesiones);
      emit(UsuarioActivo(newUser));
    }
  }

  void borrarUsuario() {
    emit(UsuarioInitial());
  }
}
