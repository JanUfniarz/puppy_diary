import 'package:puppy_diary/types/data_types.dart';
import 'package:puppy_diary/types/function_types.dart';

Transformer mainTransformer = (ind, _) {
  double lastWeight(WeightList weightHistory) => weightHistory
      .reduce((x, y) => x.time.isAfter(y.time) ? x : y).weight;

  return (
  id: ind.id,
  name: ind.name,
  fullName: ind.fullName,
  lastWeight: lastWeight(ind.weightHistory),
  weightHistory: ind.weightHistory,
  );
};