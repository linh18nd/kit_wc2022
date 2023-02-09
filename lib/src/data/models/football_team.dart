class Team {
  final String nameEn;
  final String flag;
  final String fifaCode;
  final String group;
  final String id;
  Team({
    required this.nameEn,
    required this.flag,
    required this.fifaCode,
    required this.group,
    required this.id,
  });
  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      nameEn: json['name_en'] as String,
      flag: json['flag'] as String,
      fifaCode: json['fifa_code'] as String,
      group: json['group'] as String,
      id: json['id'] as String,
    );
  }
}
