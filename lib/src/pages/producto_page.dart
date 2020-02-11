import 'package:flutter/material.dart';
class ProductoPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Producto'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_size_select_actual),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: (){},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding:  EdgeInsets.all(15.0),
          child: Form(
            child: Column(
              children: <Widget>[
                _crearNombre(),
                _creaarPrecio(),
                _crearBoton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _crearNombre() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Producto'
      ),
    );
  }

  Widget _creaarPrecio() {
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(decimal:true),
      decoration: InputDecoration(
        labelText: 'Precio'
      ),
    );
  }

  Widget _crearBoton() {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: Colors.deepPurple,
      textColor: Colors.white,
      label: Text('Guardar'),
      icon: Icon(Icons.save),
      onPressed: (){},
    );
  }
}