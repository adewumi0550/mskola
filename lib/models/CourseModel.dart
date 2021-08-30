class CourseModel{
  String userId;
  String courseId;
  String departmentId;
  String level;

  CourseModel({
    required this.userId,
    required this.courseId,
    required this.departmentId,
    required this.level
  });


  // CourseModel.fromJson(Map<String, dynamic> json) {
  //  courseId = json['courseId'];
  //   departmentId = json['departmentId'];
  //   level = json['level'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['courseId'] = this.courseId;
  //   data['departmentId'] = this.departmentId;
  //   data['level'] = this.level;
  //   return data;
  // }

}