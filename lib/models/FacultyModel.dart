// class FacultyModel{
//   String faculty;
//   String alias;
//   List<String> department;

//   FacultyModel({
//     this.faculty,
//     this.alias,
//     this.department
//   });
  
//   FacultyModel.fromJson(Map<String, dynamic> json) {
//     faculty = json['faculty'];
//     alias = json['alias'];
//     department = json['department'].cast<String>();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['faculty'] = this.faculty;
//     data['alias'] = this.alias;
//     data['department'] = this.department;
//     return data;
//   }

// }