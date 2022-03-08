import 'package:estado/bloc/usuario/usuario_cubit.dart';
import 'package:estado/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        actions: [
          IconButton(
            onPressed: () => context.read<UsuarioCubit>().borrarUsuario(),
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: const BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
        child: const Icon(Icons.ac_unit),
      ),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  const BodyScaffold({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: (_, state) {
        switch (state.runtimeType) {
          case UsuarioInitial:
            return const Center(
              child: Text('No hay informacion del usuario'),
            );

          case UsuarioActivo:
            return InformacionUsuario(
                usuario: (state as UsuarioActivo).usuario);

          default:
            return const Center(
              child: Text('Estado no reconocido'),
            );
        }
      },
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;

  const InformacionUsuario({
    Key? key,
    required this.usuario,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'General',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          ListTile(
            title: Text('Nombre: ${usuario.nombre}'),
          ),
          ListTile(
            title: Text('Edad: ${usuario.edad}'),
          ),
          const Text(
            'Promosiones',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          ...?usuario.profesiones?.map((e) => ListTile(title: Text(e))).toList()
        ],
      ),
    );
  }
}
