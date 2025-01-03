part of 'base_cubit.dart';

/// The status of a bloc state when there is only a single state
/// * loading
/// * completed
/// * noInternet
enum StateStatus {
  initial,
  loading,
  loaded,
  noInternet,
}
