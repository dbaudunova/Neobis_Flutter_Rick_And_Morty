part of 'character_bloc.dart';

abstract class CharacterEvent {}

class GetCharacters extends CharacterEvent {
  final int? page;
  final String? name;

  GetCharacters({this.page,this.name});
}