import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled8/repository/Anime/Movie%20Api.dart';
import 'package:untitled8/repository/Model_class/Anime_Model.dart';


part 'anime_event.dart';
part 'anime_state.dart';

class AnimeBloc extends Bloc<AnimeEvent, AnimeState> {
  late Anime animeModel;
  AnimeApi movieApi=AnimeApi();
  AnimeBloc() : super(AnimeInitial()) {
    on<AnimeEvent>((event, emit) async {
      emit(Animeloading());
      try{
        animeModel = await movieApi.getAnime();
        emit(Animeloaded());
      }catch(e){
        emit(Animeerror());
        print('hello'+e.toString());
      }
      // TODO: implement event handler
    });
  }
}
