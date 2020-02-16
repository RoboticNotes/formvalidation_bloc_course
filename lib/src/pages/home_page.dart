import 'package:flutter/material.dart';
import 'package:formvalidation/src/models/producto_model.dart';
import '../providers/productos_provider.dart';
import '../blocs/provider.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final productosBloc = Provider.productosBloc(context);
    productosBloc.cargarProductos();

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      body: _crearListado(productosBloc),
      floatingActionButton: _crearBoton(context),
    );
  }

  Widget _crearListado(ProductosBloc productosBloc) {
    return StreamBuilder(
      stream: productosBloc.productosStream,
      builder: (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot) {
        if(snapshot.hasData){
          final productos = snapshot.data;
          return ListView.builder(
            itemCount: productos.length,
            itemBuilder: (BuildContext context, int index) =>_crearItem(productos[index], context, productosBloc)
          );
        }else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _crearItem(ProductoModel producto, BuildContext context, ProductosBloc productosBloc){
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direccion)=>productosBloc.borrarProducto(producto.id),
      child: Card(
        child: Column(
          children: <Widget>[
            producto.photoUrl==null?
              Image(image: AssetImage('assets/img/no-image.png'),):
              FadeInImage(
                image: NetworkImage(producto.photoUrl),
                placeholder: AssetImage('assets/img/jar-loading.gif'),
                height: 300.0,
                fit: BoxFit.cover,
              ),
            ListTile(
              title: Text('${ producto.titulo } - ${ producto.valor }'),
              subtitle: Text( producto.id ),
              onTap: () => Navigator.pushNamed(context, 'producto', arguments: producto ),
            ),
          ],
        ),
      )
    );
  }

  Widget _crearBoton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Colors.deepPurple,
      onPressed: ()=>Navigator.pushNamed(context, 'producto'),
    );
  }

  
}