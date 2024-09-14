import 'injections/bloc_injection.dart';
import 'injections/data_source_injection.dart';
import 'injections/repository_implementation_injection.dart';
import 'injections/service_injection.dart';
import 'injections/use_case_injection.dart';

void initializeDependencies() {
  /// Blocs
  registerBlocs();

  /// Use Cases
  registerUseCases();

  /// Repository Implementations
  registerRepositoryImplementations();

  /// Data Sources
  registerDataSources();

  /// Core
  registerServices();
}
