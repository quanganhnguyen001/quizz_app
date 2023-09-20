part of 'google_map_cubit.dart';

class GoogleMapState extends Equatable {
  const GoogleMapState({
    this.makers = const {},
  });
  final Set<Marker> makers;

  @override
  List<Object> get props => [makers];

  GoogleMapState copyWith({
    Set<Marker>? makers,
    List<String>? searchResults,
  }) {
    return GoogleMapState(
      makers: makers ?? this.makers,
    );
  }
}
