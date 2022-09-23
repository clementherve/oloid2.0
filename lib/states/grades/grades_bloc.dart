// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';

// ignore: implementation_imports
import 'package:dartus/src/parser/parsedpage.dart';
import 'package:dartus/tomuss.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:oloid2/model/grade.dart';
import 'package:oloid2/model/teacher_model.dart';
import 'package:oloid2/model/teaching_unit.dart';
import 'package:oloid2/model/text_model.dart';

part 'grades_event.dart';

part 'grades_state.dart';

class GradesBloc extends Bloc<GradesEvent, GradesState> {
  List<TeachingUnitModel> teachingUnits = [];

  GradesBloc() : super(GradesInitial()) {
    on<GradesEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GradesLoad>(load);
  }

  Future<void> load(GradesLoad event, Emitter<GradesState> emit) async {
    emit(GradesLoading());
    Option<ParsedPage> parsedPageOpt =
        await event.dartus.getParsedPage(Dartus.currentSemester());
    if (parsedPageOpt.isNone()) {
      if (kDebugMode) {
        print("maybe there is a probleme");
      }
      emit(GradesError());
    }
    final ParsedPage parsedPage =
        parsedPageOpt.getOrElse(() => ParsedPage.empty());
    for (final TeachingUnit tu in parsedPage.teachingunits) {
      teachingUnits.add(TeachingUnitModel(
          isSeen: false,
          isHidden: false,
          name: tu.name,
          masters: tu.masters.map((e) => TeacherModel.fromTeacher(e)).toList(),
          grades: tu.grades.map((e) => GradeModel.fromGrade(e)).toList(),
          textValues:
              tu.textValues.map((e) => TextModel.fromText(e)).toList()));
    }
    emit(GradesReady());
  }
}