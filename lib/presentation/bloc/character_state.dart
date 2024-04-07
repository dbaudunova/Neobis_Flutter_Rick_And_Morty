part of 'character_bloc.dart';

abstract class CharacterState {
  final List<CharacterEntity>? characters;
  final DioException? error;

  const CharacterState({this.characters, this.error});
}

class CharacterLoading extends CharacterState {
  const CharacterLoading();
}

class CharacterDone extends CharacterState {
  const CharacterDone(List<CharacterEntity> characters)
      : super(characters: characters);
}

class CharacterError extends CharacterState {
  const CharacterError(DioException error) : super(error: error);
}