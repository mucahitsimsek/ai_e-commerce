import 'package:flutter/material.dart';

import '../../core/models/product.dart';

class CartScreen extends StatefulWidget {
  final List<Product>? cartProducts;

  const CartScreen({Key? key, this.cartProducts}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sepet'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.cartProducts?.length,
              itemBuilder: (BuildContext context, int index) {
                final product = widget.cartProducts![index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    children: [
                      Image.network(
                        product.image,
                        width: 100.0,
                        height: 100.0,
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              '${product.price} TL',
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.remove_circle_outline),
                        onPressed: () {
                          // TODO: Sepetten ürünü kaldırma işlemleri burada yapılacak.
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // TODO: Ödeme sayfasına yönlendirme yapılacak.
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Ödeme Yap',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    '${widget.cartProducts?.length} Ürün - ${widget.cartProducts?.fold<double>(0.0, (prev, element) => prev + element.price)} TL',
                    style: const TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}