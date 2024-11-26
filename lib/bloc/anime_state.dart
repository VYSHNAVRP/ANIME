part of 'anime_bloc.dart';

@immutable
sealed class AnimeState {}

final class AnimeInitial extends AnimeState {}
class Animeloading extends AnimeState{}
class Animeloaded extends AnimeState{}
class Animeerror extends AnimeState{}