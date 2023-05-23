import 'package:flutter/material.dart';

import 'utils.dart';

class CategoryCard extends StatelessWidget {
  final String categoryName;
  final String categoryImage;
  
  final VoidCallback onTap;
  CategoryCard({required this.categoryName, required this.categoryImage, required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return
    InkWell(
      onTap:onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: AssetImage(categoryImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            categoryName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ) ,

    );
    
  }
}

// class ProductCard extends StatelessWidget {
//   final String productName;
//   final String productImage;
//   final VoidCallback onTap;

//   ProductCard({
//     required this.productName,
//     required this.productImage,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Card(
//         child: Column(
//           children: [
//             Expanded(
//               child: Image.asset(
//                 productImage,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 productName,
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class ProductCard extends StatelessWidget {
  final String productName;
  final String productImage;
  final String description;
  final VoidCallback onTap;
  final Function(String) addProduct;
  final Function(String) addWishProduct;
  // final VoidCallback onAddToCart;
  // final VoidCallback onAddToFavorites;

  ProductCard({super.key, 
    required this.productName,
    required this.productImage,
    this.description = 'Ceci est une description par défaut',
    required this.onTap,
    required this.addProduct,
    required this.addWishProduct,
    // required this.onAddToCart,
    // required this.onAddToFavorites,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 400,
        width: 400,
      
        // child: Card(
          
        //   elevation: 4,
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(8),
        //   ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8),
                  ),
                  child: Image.asset(
                    productImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: (){showSnackBar(context);},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Colors.orange,
                            ),
                          ),
                          child: Text('Ajouter au panier'),
                        ),
                        SizedBox(width: 8),
                        IconButton(
                          onPressed: (){addWishProduct(productName);},
                          icon: Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      // ),\
    );
  }
}
