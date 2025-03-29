import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:interapp/src/models/products.dart';

class ProductsDetailsPage extends StatelessWidget {
  const ProductsDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Products product = GoRouterState.of(context).extra! as Products;
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalle Producto"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => 
        (constraints.maxWidth>600) ? 
         ProductsItem(product: product) : ProductsItemBase(product: product),
      ),
    );
  }
}

class ProductsItemBase extends StatelessWidget {
  const ProductsItemBase({
    super.key,
    required this.product,
  });

  final Products product;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 5,
              children: [
                Text(
                  product.title,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Container(
                  height: 280,
                  width: 280,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Image.network(
                    product.thumbnail,
                    height: 150,
                    width: 150,
                  ),
                ),
                Text(
                  'ref: ${product.category}',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    product.description,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
          
                Text(
                  'Precio: \$${product.price}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(onPressed:() {
                  context.pop(true);
                }, child: Text("Regresar"))  
          
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductsItem extends StatelessWidget {
  const ProductsItem({super.key, required this.product});
  final Products product; 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          spacing: 5,
          children: [
                Container(
                  height: 280,
                  width: 280,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Image.network(
                    product.thumbnail,
                    height: 150,
                    width: 150,
                  ),
                ),
                Flexible(
                  child: Column(
                    spacing: 4,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                         Text(
                  product.title,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'ref: ${product.category}',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    product.description,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
          
                Text(
                  'Precio: \$${product.price}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(onPressed:() {
                  context.pop(true);
                }, child: Text("Regresar"))  
           
                    ],
                  ))
               
          ],
        ),)
    );
  }
}