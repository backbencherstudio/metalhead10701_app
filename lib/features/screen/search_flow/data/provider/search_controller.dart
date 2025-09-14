import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../dashboard_flow/data/model/job_model.dart';

final isSuggestionOn = StateProvider<bool>((ref) => true);

final searchQueryProvider = StateProvider<String>((ref) => '');
final searchQuerySuggestionProvider = StateProvider<String>((ref) => '');

final filteredJobsProvider = Provider<List<JobModel>>((ref) {
  final query = ref.watch(searchQueryProvider).toLowerCase();
  if (query.isEmpty) return [];
  return jobs.where((job) => job.name.toLowerCase().contains(query)).toList();
});

final filteredJobsSuggestionProvider = Provider<List<JobModel>>((ref) {
  final query = ref.watch(searchQuerySuggestionProvider).toLowerCase();
  if (query.isEmpty) return [];
  return jobs.where((job) => job.name.toLowerCase().contains(query)).toList();
});