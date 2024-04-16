class MacrosEntity {
  int calories;
  int proteins;
  int fat;
  int carbs;

  MacrosEntity({
    required this.calories,
    required this.proteins,
    required this.fat,
    required this.carbs,
  });

  Map<String, dynamic> toJson() {
    return {
      "calories": calories,
      "proteins": proteins,
      "fat": fat,
      "carbs": carbs,
    };
  }

  static MacrosEntity fromJson(Map<String, dynamic> json) {
    return MacrosEntity(
      calories: int.parse(json["calories"]),
      proteins: int.parse(json["proteins"]),
      fat: int.parse(json["fat"]),
      carbs: int.parse(json["carbs"]),
    );
  }
//
}