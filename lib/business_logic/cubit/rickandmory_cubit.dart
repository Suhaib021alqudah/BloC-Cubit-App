import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'rickandmory_state.dart';

class RickandmoryCubit extends Cubit<RickandmoryState> {
  RickandmoryCubit() : super(RickandmoryInitial());
}
