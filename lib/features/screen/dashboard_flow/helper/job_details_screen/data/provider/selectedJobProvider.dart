import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:metal_head/features/screen/dashboard_flow/data/model/job_model.dart';

final selectedJob = StateProvider<JobModel?>((ref)=> null);