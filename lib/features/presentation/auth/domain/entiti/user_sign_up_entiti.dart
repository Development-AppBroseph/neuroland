class UserSignUpEntiti {
  final bool success;
  final List<dynamic> errors;
  final SuccessEntiti model;

  UserSignUpEntiti({
    required this.success,
    required this.errors,
    required this.model,
  });
}

class SuccessEntiti {
  final int id;
  final List<int> branchIds;
  final List<dynamic> teacherIds;
  final String name;
  final String barcode;
  final dynamic color;
  final int isStudy;
  final dynamic studyStatusId;
  final dynamic leadStatusId;
  final dynamic leadRejectId;
  final dynamic leadSourceId;
  final dynamic assignedId;
  final int legalType;
  final String legalName;
  final dynamic companyId;
  final String dob;
  final dynamic balance;
  final dynamic balanceBase;
  final dynamic balanceBonus;
  final dynamic paidCount;
  final dynamic nextLessonDate;
  final dynamic paidTill;
  final dynamic lastAttendDate;
  final DateTime bDate;
  final DateTime eDate;
  final String note;
  final dynamic paidLessonCount;
  final dynamic paidLessonDate;
  final List<String> phone;
  final List<String> email;
  final List<dynamic> web;
  final List<dynamic> addr;
  final String customDetskiysad;
  final String customKantselyarskiysbor;
  final String customKlass;
  final String customNomershkoly;
  final String customOtsenka;
  final String customPozhelanie;
  final String customPromokod;
  final String customSmena;
  final String customSoglasienavideo;
  final String customUchebnik;
  final String customUchebniknovy;
  final String customVozrastdlyadetsada;
  final String customZanyatost;

  SuccessEntiti({
    required this.id,
    required this.branchIds,
    required this.teacherIds,
    required this.name,
    required this.barcode,
    required this.color,
    required this.isStudy,
    required this.studyStatusId,
    required this.leadStatusId,
    required this.leadRejectId,
    required this.leadSourceId,
    required this.assignedId,
    required this.legalType,
    required this.legalName,
    required this.companyId,
    required this.dob,
    required this.balance,
    required this.balanceBase,
    required this.balanceBonus,
    required this.paidCount,
    required this.nextLessonDate,
    required this.paidTill,
    required this.lastAttendDate,
    required this.bDate,
    required this.eDate,
    required this.note,
    required this.paidLessonCount,
    required this.paidLessonDate,
    required this.phone,
    required this.email,
    required this.web,
    required this.addr,
    required this.customDetskiysad,
    required this.customKantselyarskiysbor,
    required this.customKlass,
    required this.customNomershkoly,
    required this.customOtsenka,
    required this.customPozhelanie,
    required this.customPromokod,
    required this.customSmena,
    required this.customSoglasienavideo,
    required this.customUchebnik,
    required this.customUchebniknovy,
    required this.customVozrastdlyadetsada,
    required this.customZanyatost,
  });
}
