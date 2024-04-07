part of 'character_bloc.dart';

abstract class CharacterEvent {}

class GetCharacters extends CharacterEvent {
  final String? name;

  GetCharacters({this.name});
}