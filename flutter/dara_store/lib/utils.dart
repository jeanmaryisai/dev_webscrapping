import 'package:dara_store/models/Cart.dart';
import 'package:dara_store/models/Product.dart';
import 'package:dara_store/repo.dart';

void fav(Product p) {
  if (p.isFavorite) {
    p.isFavorite = false;
    demoFav.remove(p);
  } else {
    p.isFavorite = true;
    demoFav.add(p);
  }
}

void addCart(Product p) {

}

void removeFromCart(Product p) {

}

