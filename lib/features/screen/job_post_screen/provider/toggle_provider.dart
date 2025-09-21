import 'package:flutter_riverpod/flutter_riverpod.dart';

final jobRequirementsNumberProvider = StateProvider<int>((ref)=>1);
final notesNumberProvider = StateProvider<int>((ref)=>1);


final selectedJobTypeProvider = StateProvider<String?>((ref) => null);

final selectedPaymentTypeProvider = StateProvider<String?>((ref) => null);