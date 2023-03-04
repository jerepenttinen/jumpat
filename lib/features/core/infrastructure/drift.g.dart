// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift.dart';

// ignore_for_file: type=lint
class $ExercisesTable extends Exercises
    with TableInfo<$ExercisesTable, Exercise> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExercisesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? 'exercises';
  @override
  String get actualTableName => 'exercises';
  @override
  VerificationContext validateIntegrity(Insertable<Exercise> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Exercise map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Exercise(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $ExercisesTable createAlias(String alias) {
    return $ExercisesTable(attachedDatabase, alias);
  }
}

class Exercise extends DataClass implements Insertable<Exercise> {
  final int id;
  final String name;
  const Exercise({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  ExercisesCompanion toCompanion(bool nullToAbsent) {
    return ExercisesCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory Exercise.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Exercise(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Exercise copyWith({int? id, String? name}) => Exercise(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('Exercise(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Exercise && other.id == this.id && other.name == this.name);
}

class ExercisesCompanion extends UpdateCompanion<Exercise> {
  final Value<int> id;
  final Value<String> name;
  const ExercisesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  ExercisesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<Exercise> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  ExercisesCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return ExercisesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExercisesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $TemplatesTable extends Templates
    with TableInfo<$TemplatesTable, Template> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TemplatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<int> color = GeneratedColumn<int>(
      'color', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, color];
  @override
  String get aliasedName => _alias ?? 'templates';
  @override
  String get actualTableName => 'templates';
  @override
  VerificationContext validateIntegrity(Insertable<Template> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Template map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Template(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}color'])!,
    );
  }

  @override
  $TemplatesTable createAlias(String alias) {
    return $TemplatesTable(attachedDatabase, alias);
  }
}

class Template extends DataClass implements Insertable<Template> {
  final int id;
  final String name;
  final int color;
  const Template({required this.id, required this.name, required this.color});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['color'] = Variable<int>(color);
    return map;
  }

  TemplatesCompanion toCompanion(bool nullToAbsent) {
    return TemplatesCompanion(
      id: Value(id),
      name: Value(name),
      color: Value(color),
    );
  }

  factory Template.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Template(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      color: serializer.fromJson<int>(json['color']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'color': serializer.toJson<int>(color),
    };
  }

  Template copyWith({int? id, String? name, int? color}) => Template(
        id: id ?? this.id,
        name: name ?? this.name,
        color: color ?? this.color,
      );
  @override
  String toString() {
    return (StringBuffer('Template(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, color);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Template &&
          other.id == this.id &&
          other.name == this.name &&
          other.color == this.color);
}

class TemplatesCompanion extends UpdateCompanion<Template> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> color;
  const TemplatesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.color = const Value.absent(),
  });
  TemplatesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int color,
  })  : name = Value(name),
        color = Value(color);
  static Insertable<Template> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? color,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (color != null) 'color': color,
    });
  }

  TemplatesCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<int>? color}) {
    return TemplatesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (color.present) {
      map['color'] = Variable<int>(color.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TemplatesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }
}

class $WorkoutsTable extends Workouts with TableInfo<$WorkoutsTable, Workout> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _templateMeta =
      const VerificationMeta('template');
  @override
  late final GeneratedColumn<int> template = GeneratedColumn<int>(
      'template', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES templates (id)'));
  @override
  List<GeneratedColumn> get $columns => [id, date, template];
  @override
  String get aliasedName => _alias ?? 'workouts';
  @override
  String get actualTableName => 'workouts';
  @override
  VerificationContext validateIntegrity(Insertable<Workout> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('template')) {
      context.handle(_templateMeta,
          template.isAcceptableOrUnknown(data['template']!, _templateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Workout map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Workout(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      template: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}template']),
    );
  }

  @override
  $WorkoutsTable createAlias(String alias) {
    return $WorkoutsTable(attachedDatabase, alias);
  }
}

class Workout extends DataClass implements Insertable<Workout> {
  final int id;
  final DateTime date;
  final int? template;
  const Workout({required this.id, required this.date, this.template});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || template != null) {
      map['template'] = Variable<int>(template);
    }
    return map;
  }

  WorkoutsCompanion toCompanion(bool nullToAbsent) {
    return WorkoutsCompanion(
      id: Value(id),
      date: Value(date),
      template: template == null && nullToAbsent
          ? const Value.absent()
          : Value(template),
    );
  }

  factory Workout.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Workout(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      template: serializer.fromJson<int?>(json['template']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'template': serializer.toJson<int?>(template),
    };
  }

  Workout copyWith(
          {int? id,
          DateTime? date,
          Value<int?> template = const Value.absent()}) =>
      Workout(
        id: id ?? this.id,
        date: date ?? this.date,
        template: template.present ? template.value : this.template,
      );
  @override
  String toString() {
    return (StringBuffer('Workout(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('template: $template')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, template);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Workout &&
          other.id == this.id &&
          other.date == this.date &&
          other.template == this.template);
}

class WorkoutsCompanion extends UpdateCompanion<Workout> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<int?> template;
  const WorkoutsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.template = const Value.absent(),
  });
  WorkoutsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    this.template = const Value.absent(),
  }) : date = Value(date);
  static Insertable<Workout> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<int>? template,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (template != null) 'template': template,
    });
  }

  WorkoutsCompanion copyWith(
      {Value<int>? id, Value<DateTime>? date, Value<int?>? template}) {
    return WorkoutsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      template: template ?? this.template,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (template.present) {
      map['template'] = Variable<int>(template.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('template: $template')
          ..write(')'))
        .toString();
  }
}

class $MovementsTable extends Movements
    with TableInfo<$MovementsTable, Movement> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MovementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
      'weight', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _exerciseMeta =
      const VerificationMeta('exercise');
  @override
  late final GeneratedColumn<int> exercise = GeneratedColumn<int>(
      'exercise', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES exercises (id)'));
  static const VerificationMeta _workoutMeta =
      const VerificationMeta('workout');
  @override
  late final GeneratedColumn<int> workout = GeneratedColumn<int>(
      'workout', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES workouts (id)'));
  @override
  List<GeneratedColumn> get $columns => [id, weight, exercise, workout];
  @override
  String get aliasedName => _alias ?? 'movements';
  @override
  String get actualTableName => 'movements';
  @override
  VerificationContext validateIntegrity(Insertable<Movement> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    if (data.containsKey('exercise')) {
      context.handle(_exerciseMeta,
          exercise.isAcceptableOrUnknown(data['exercise']!, _exerciseMeta));
    } else if (isInserting) {
      context.missing(_exerciseMeta);
    }
    if (data.containsKey('workout')) {
      context.handle(_workoutMeta,
          workout.isAcceptableOrUnknown(data['workout']!, _workoutMeta));
    } else if (isInserting) {
      context.missing(_workoutMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Movement map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Movement(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      weight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}weight'])!,
      exercise: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}exercise'])!,
      workout: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}workout'])!,
    );
  }

  @override
  $MovementsTable createAlias(String alias) {
    return $MovementsTable(attachedDatabase, alias);
  }
}

class Movement extends DataClass implements Insertable<Movement> {
  final int id;
  final double weight;
  final int exercise;
  final int workout;
  const Movement(
      {required this.id,
      required this.weight,
      required this.exercise,
      required this.workout});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['weight'] = Variable<double>(weight);
    map['exercise'] = Variable<int>(exercise);
    map['workout'] = Variable<int>(workout);
    return map;
  }

  MovementsCompanion toCompanion(bool nullToAbsent) {
    return MovementsCompanion(
      id: Value(id),
      weight: Value(weight),
      exercise: Value(exercise),
      workout: Value(workout),
    );
  }

  factory Movement.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Movement(
      id: serializer.fromJson<int>(json['id']),
      weight: serializer.fromJson<double>(json['weight']),
      exercise: serializer.fromJson<int>(json['exercise']),
      workout: serializer.fromJson<int>(json['workout']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'weight': serializer.toJson<double>(weight),
      'exercise': serializer.toJson<int>(exercise),
      'workout': serializer.toJson<int>(workout),
    };
  }

  Movement copyWith({int? id, double? weight, int? exercise, int? workout}) =>
      Movement(
        id: id ?? this.id,
        weight: weight ?? this.weight,
        exercise: exercise ?? this.exercise,
        workout: workout ?? this.workout,
      );
  @override
  String toString() {
    return (StringBuffer('Movement(')
          ..write('id: $id, ')
          ..write('weight: $weight, ')
          ..write('exercise: $exercise, ')
          ..write('workout: $workout')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, weight, exercise, workout);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Movement &&
          other.id == this.id &&
          other.weight == this.weight &&
          other.exercise == this.exercise &&
          other.workout == this.workout);
}

class MovementsCompanion extends UpdateCompanion<Movement> {
  final Value<int> id;
  final Value<double> weight;
  final Value<int> exercise;
  final Value<int> workout;
  const MovementsCompanion({
    this.id = const Value.absent(),
    this.weight = const Value.absent(),
    this.exercise = const Value.absent(),
    this.workout = const Value.absent(),
  });
  MovementsCompanion.insert({
    this.id = const Value.absent(),
    required double weight,
    required int exercise,
    required int workout,
  })  : weight = Value(weight),
        exercise = Value(exercise),
        workout = Value(workout);
  static Insertable<Movement> custom({
    Expression<int>? id,
    Expression<double>? weight,
    Expression<int>? exercise,
    Expression<int>? workout,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (weight != null) 'weight': weight,
      if (exercise != null) 'exercise': exercise,
      if (workout != null) 'workout': workout,
    });
  }

  MovementsCompanion copyWith(
      {Value<int>? id,
      Value<double>? weight,
      Value<int>? exercise,
      Value<int>? workout}) {
    return MovementsCompanion(
      id: id ?? this.id,
      weight: weight ?? this.weight,
      exercise: exercise ?? this.exercise,
      workout: workout ?? this.workout,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (exercise.present) {
      map['exercise'] = Variable<int>(exercise.value);
    }
    if (workout.present) {
      map['workout'] = Variable<int>(workout.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MovementsCompanion(')
          ..write('id: $id, ')
          ..write('weight: $weight, ')
          ..write('exercise: $exercise, ')
          ..write('workout: $workout')
          ..write(')'))
        .toString();
  }
}

class $MovementSetsTable extends MovementSets
    with TableInfo<$MovementSetsTable, MovementSet> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MovementSetsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _countMeta = const VerificationMeta('count');
  @override
  late final GeneratedColumn<int> count = GeneratedColumn<int>(
      'count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _movementMeta =
      const VerificationMeta('movement');
  @override
  late final GeneratedColumn<int> movement = GeneratedColumn<int>(
      'movement', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES movements (id)'));
  @override
  List<GeneratedColumn> get $columns => [id, count, movement];
  @override
  String get aliasedName => _alias ?? 'movement_sets';
  @override
  String get actualTableName => 'movement_sets';
  @override
  VerificationContext validateIntegrity(Insertable<MovementSet> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('count')) {
      context.handle(
          _countMeta, count.isAcceptableOrUnknown(data['count']!, _countMeta));
    } else if (isInserting) {
      context.missing(_countMeta);
    }
    if (data.containsKey('movement')) {
      context.handle(_movementMeta,
          movement.isAcceptableOrUnknown(data['movement']!, _movementMeta));
    } else if (isInserting) {
      context.missing(_movementMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MovementSet map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MovementSet(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      count: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}count'])!,
      movement: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}movement'])!,
    );
  }

  @override
  $MovementSetsTable createAlias(String alias) {
    return $MovementSetsTable(attachedDatabase, alias);
  }
}

class MovementSet extends DataClass implements Insertable<MovementSet> {
  final int id;
  final int count;
  final int movement;
  const MovementSet(
      {required this.id, required this.count, required this.movement});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['count'] = Variable<int>(count);
    map['movement'] = Variable<int>(movement);
    return map;
  }

  MovementSetsCompanion toCompanion(bool nullToAbsent) {
    return MovementSetsCompanion(
      id: Value(id),
      count: Value(count),
      movement: Value(movement),
    );
  }

  factory MovementSet.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MovementSet(
      id: serializer.fromJson<int>(json['id']),
      count: serializer.fromJson<int>(json['count']),
      movement: serializer.fromJson<int>(json['movement']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'count': serializer.toJson<int>(count),
      'movement': serializer.toJson<int>(movement),
    };
  }

  MovementSet copyWith({int? id, int? count, int? movement}) => MovementSet(
        id: id ?? this.id,
        count: count ?? this.count,
        movement: movement ?? this.movement,
      );
  @override
  String toString() {
    return (StringBuffer('MovementSet(')
          ..write('id: $id, ')
          ..write('count: $count, ')
          ..write('movement: $movement')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, count, movement);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MovementSet &&
          other.id == this.id &&
          other.count == this.count &&
          other.movement == this.movement);
}

class MovementSetsCompanion extends UpdateCompanion<MovementSet> {
  final Value<int> id;
  final Value<int> count;
  final Value<int> movement;
  const MovementSetsCompanion({
    this.id = const Value.absent(),
    this.count = const Value.absent(),
    this.movement = const Value.absent(),
  });
  MovementSetsCompanion.insert({
    this.id = const Value.absent(),
    required int count,
    required int movement,
  })  : count = Value(count),
        movement = Value(movement);
  static Insertable<MovementSet> custom({
    Expression<int>? id,
    Expression<int>? count,
    Expression<int>? movement,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (count != null) 'count': count,
      if (movement != null) 'movement': movement,
    });
  }

  MovementSetsCompanion copyWith(
      {Value<int>? id, Value<int>? count, Value<int>? movement}) {
    return MovementSetsCompanion(
      id: id ?? this.id,
      count: count ?? this.count,
      movement: movement ?? this.movement,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (count.present) {
      map['count'] = Variable<int>(count.value);
    }
    if (movement.present) {
      map['movement'] = Variable<int>(movement.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MovementSetsCompanion(')
          ..write('id: $id, ')
          ..write('count: $count, ')
          ..write('movement: $movement')
          ..write(')'))
        .toString();
  }
}

class $TemplatesExercisesTable extends TemplatesExercises
    with TableInfo<$TemplatesExercisesTable, TemplatesExercise> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TemplatesExercisesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _templateMeta =
      const VerificationMeta('template');
  @override
  late final GeneratedColumn<int> template = GeneratedColumn<int>(
      'template', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES templates (id)'));
  static const VerificationMeta _exerciseMeta =
      const VerificationMeta('exercise');
  @override
  late final GeneratedColumn<int> exercise = GeneratedColumn<int>(
      'exercise', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES exercises (id)'));
  @override
  List<GeneratedColumn> get $columns => [template, exercise];
  @override
  String get aliasedName => _alias ?? 'templates_exercises';
  @override
  String get actualTableName => 'templates_exercises';
  @override
  VerificationContext validateIntegrity(Insertable<TemplatesExercise> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('template')) {
      context.handle(_templateMeta,
          template.isAcceptableOrUnknown(data['template']!, _templateMeta));
    } else if (isInserting) {
      context.missing(_templateMeta);
    }
    if (data.containsKey('exercise')) {
      context.handle(_exerciseMeta,
          exercise.isAcceptableOrUnknown(data['exercise']!, _exerciseMeta));
    } else if (isInserting) {
      context.missing(_exerciseMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  TemplatesExercise map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TemplatesExercise(
      template: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}template'])!,
      exercise: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}exercise'])!,
    );
  }

  @override
  $TemplatesExercisesTable createAlias(String alias) {
    return $TemplatesExercisesTable(attachedDatabase, alias);
  }
}

class TemplatesExercise extends DataClass
    implements Insertable<TemplatesExercise> {
  final int template;
  final int exercise;
  const TemplatesExercise({required this.template, required this.exercise});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['template'] = Variable<int>(template);
    map['exercise'] = Variable<int>(exercise);
    return map;
  }

  TemplatesExercisesCompanion toCompanion(bool nullToAbsent) {
    return TemplatesExercisesCompanion(
      template: Value(template),
      exercise: Value(exercise),
    );
  }

  factory TemplatesExercise.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TemplatesExercise(
      template: serializer.fromJson<int>(json['template']),
      exercise: serializer.fromJson<int>(json['exercise']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'template': serializer.toJson<int>(template),
      'exercise': serializer.toJson<int>(exercise),
    };
  }

  TemplatesExercise copyWith({int? template, int? exercise}) =>
      TemplatesExercise(
        template: template ?? this.template,
        exercise: exercise ?? this.exercise,
      );
  @override
  String toString() {
    return (StringBuffer('TemplatesExercise(')
          ..write('template: $template, ')
          ..write('exercise: $exercise')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(template, exercise);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TemplatesExercise &&
          other.template == this.template &&
          other.exercise == this.exercise);
}

class TemplatesExercisesCompanion extends UpdateCompanion<TemplatesExercise> {
  final Value<int> template;
  final Value<int> exercise;
  const TemplatesExercisesCompanion({
    this.template = const Value.absent(),
    this.exercise = const Value.absent(),
  });
  TemplatesExercisesCompanion.insert({
    required int template,
    required int exercise,
  })  : template = Value(template),
        exercise = Value(exercise);
  static Insertable<TemplatesExercise> custom({
    Expression<int>? template,
    Expression<int>? exercise,
  }) {
    return RawValuesInsertable({
      if (template != null) 'template': template,
      if (exercise != null) 'exercise': exercise,
    });
  }

  TemplatesExercisesCompanion copyWith(
      {Value<int>? template, Value<int>? exercise}) {
    return TemplatesExercisesCompanion(
      template: template ?? this.template,
      exercise: exercise ?? this.exercise,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (template.present) {
      map['template'] = Variable<int>(template.value);
    }
    if (exercise.present) {
      map['exercise'] = Variable<int>(exercise.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TemplatesExercisesCompanion(')
          ..write('template: $template, ')
          ..write('exercise: $exercise')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $ExercisesTable exercises = $ExercisesTable(this);
  late final $TemplatesTable templates = $TemplatesTable(this);
  late final $WorkoutsTable workouts = $WorkoutsTable(this);
  late final $MovementsTable movements = $MovementsTable(this);
  late final $MovementSetsTable movementSets = $MovementSetsTable(this);
  late final $TemplatesExercisesTable templatesExercises =
      $TemplatesExercisesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        exercises,
        templates,
        workouts,
        movements,
        movementSets,
        templatesExercises
      ];
}
