import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_menia/model/fav_model.dart';
import 'package:news_menia/model/news_model.dart';
import 'package:news_menia/provider/fav_provider.dart';

void favBottonWorking(WidgetRef ref, bool fav, NewsModel data, int index) {
  ref.read(favBool.notifier).state = !fav;
  data.articles[index].fav = !fav;

  ref.read(favNotifierProvider.notifier).addingToFav(
        FavModel(
          isfav: data.articles[index].fav,
          article: data.articles[index],
        ),
      );
}
