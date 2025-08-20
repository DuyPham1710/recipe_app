import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SearchMeals extends SearchEvent {
  final String query;
  SearchMeals(this.query);
}

class ClearSearch extends SearchEvent {}
