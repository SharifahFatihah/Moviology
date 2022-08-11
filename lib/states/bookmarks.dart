import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/movie_model.dart';

class BookmarkCubit extends Cubit<Set<MovieModel>> {
  BookmarkCubit() : super({});
  void addBookmark(MovieModel e) {
    emit({...state, e});
  }

  void removeBookmark(MovieModel e) {
    state.remove(e);
    emit({...state});
  }
}
