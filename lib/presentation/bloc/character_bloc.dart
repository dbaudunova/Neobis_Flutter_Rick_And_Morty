import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobis_flutter_rick_and_morty/domain/models/character.dart';
import 'package:neobis_flutter_rick_and_morty/domain/usecases/get_all_characters_use_case.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final GetAllCharactersUseCase _getCharacterUseCase;

  CharacterBloc(this._getCharacterUseCase) : super(const CharacterLoading()) {
    on<GetCharacters>(onGetCharacters);
  }

  void onGetCharacters(
      GetCharacters event, Emitter<CharacterState> emit) async {
    emit(const CharacterLoading());
    try {
      final dataState = await _getCharacterUseCase.call(event.name ?? '');
      emit(CharacterDone(dataState));
    } on DioException catch (e) {
      emit(CharacterError(e));
    }
  }
}
