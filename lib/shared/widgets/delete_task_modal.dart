import 'package:flutter/material.dart';

class DeleteTaskModal {
  final BuildContext _context;
  final Function delete;

  DeleteTaskModal(this._context, this.delete);

  Future<void> showDeleteTaskModal() async {
    return showDialog(
      context: _context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Deletar Tarefa'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [Text("Deseja remover essa tarefa?")],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(_context);
              },
              child: Text(
                'Cancelar',
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),
            FilledButton(
              onPressed: () async {
                delete();
                Navigator.pop(_context);
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.redAccent),
              ),
              child: Text('Excluir'),
            ),
          ],
        );
      },
    );
  }
}
