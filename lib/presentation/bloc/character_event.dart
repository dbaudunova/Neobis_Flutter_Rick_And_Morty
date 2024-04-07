part of 'character_bloc.dart';

abstract class CharacterEvent {}

class GetCharacters extends CharacterEvent {
  final CharacterEntity results;

  GetCharacters(this.results);
}