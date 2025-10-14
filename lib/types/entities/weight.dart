class Weight {
  int id;
  DateTime time;
  double weight;


  Weight({
    this.id = -1,
    required this.time,
    required this.weight,
  });


  Weight.from(Weight other)
      : id = other.id,
        time = other.time,
        weight = other.weight;
}