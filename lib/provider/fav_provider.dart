import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_menia/model/fav_model.dart';

class FavNotifier extends StateNotifier<List<FavModel>> {
  FavNotifier() : super([]);

  void addingToFav(FavModel favItem) {
    state = [favItem, ...state];
  }

  void removeFav(FavModel favItme) {
    state = [
      for (FavModel i in state)
        if (favItme.isfav != i.isfav) i
    ];
  }
}

final favNotifierProvider =
    StateNotifierProvider<FavNotifier, List<FavModel>>((ref) {
  return FavNotifier();
});

final favBool = StateProvider<bool>((ref) {
  return false;
});
