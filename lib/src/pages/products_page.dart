import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:interapp/src/models/products.dart';
import 'package:interapp/src/providers/appstate.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key, required this.products});
  final List<Products> products;

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadProducts);
  
  }

  @override
  Widget build(BuildContext context) {
    
    return ListView.builder(
      controller: _scrollController,
      itemCount: widget.products.length,
      itemBuilder: (context, index) {
        final product = widget.products[index];
        return GestureDetector(
          onTap:() async{
            final bool? value = await context.push<bool>('/products', extra: product);
            
            if (value!=null){
              if (context.mounted){
                 _scrollController.position.correctPixels(Provider.of<AppState>(context,listen: false).position);
              }
            }
          
          },
          child: Card(
            elevation: 1,
            child: Row(
              spacing: 4,
              children: [
                Image.network(product.thumbnail, height: 150, width: 150),
                Flexible(
                  child: Column(
                    spacing: 2,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(product.description, maxLines: 2),
                      Text(product.category),
                      Text(
                        '\$${product.price}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _loadProducts() {

   // _scrollController.position.correctPixels(Provider.of<AppState>(context,listen: false).position);

    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.9) {
      Provider.of<AppState>(context, listen: false).loadProducts();
    }
    Provider.of<AppState>(context,listen: false).position=_scrollController.position.pixels ;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
