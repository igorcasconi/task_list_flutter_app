import 'package:flutter/material.dart';

class AddInformationModal {
  final BuildContext _context;
  final TextEditingController _titleController;
  final TextEditingController _descriptionController;
  final VoidCallback submit;

  AddInformationModal(
    this._context,
    this._titleController,
    this._descriptionController,
    this.submit,
  );

  Future<void> showInformationModal() async {
    return showDialog(
      context: _context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Adicionar Tarefa'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Tarefa',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Descrição',
                ),
              ),
            ],
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
              onPressed: () {
                submit();
                Navigator.pop(_context);
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.blueAccent),
              ),
              child: Text('Adicionar'),
            ),
          ],
        );
      },
    );
  }
}
