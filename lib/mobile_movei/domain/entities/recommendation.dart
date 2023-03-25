import 'package:equatable/equatable.dart';

class Recommendation extends Equatable {

  final int id;
  final String? backdrobpath;

  const Recommendation({required this.id,  this.backdrobpath});

  @override
  List<Object?> get props => [id, backdrobpath];

}