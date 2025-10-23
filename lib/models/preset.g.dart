// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preset.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPresetCollection on Isar {
  IsarCollection<Preset> get presets => this.collection();
}

const PresetSchema = CollectionSchema(
  name: r'Preset',
  id: -7604157809264403462,
  properties: {
    r'brand': PropertySchema(
      id: 0,
      name: r'brand',
      type: IsarType.string,
    ),
    r'capacity': PropertySchema(
      id: 1,
      name: r'capacity',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'drinkName': PropertySchema(
      id: 3,
      name: r'drinkName',
      type: IsarType.string,
    ),
    r'fullDescription': PropertySchema(
      id: 4,
      name: r'fullDescription',
      type: IsarType.string,
    ),
    r'iceLevel': PropertySchema(
      id: 5,
      name: r'iceLevel',
      type: IsarType.string,
    ),
    r'presetName': PropertySchema(
      id: 6,
      name: r'presetName',
      type: IsarType.string,
    ),
    r'sweetness': PropertySchema(
      id: 7,
      name: r'sweetness',
      type: IsarType.string,
    ),
    r'teaBase': PropertySchema(
      id: 8,
      name: r'teaBase',
      type: IsarType.string,
    ),
    r'toppings': PropertySchema(
      id: 9,
      name: r'toppings',
      type: IsarType.stringList,
    ),
    r'toppingsDisplay': PropertySchema(
      id: 10,
      name: r'toppingsDisplay',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 11,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'usageCount': PropertySchema(
      id: 12,
      name: r'usageCount',
      type: IsarType.long,
    )
  },
  estimateSize: _presetEstimateSize,
  serialize: _presetSerialize,
  deserialize: _presetDeserialize,
  deserializeProp: _presetDeserializeProp,
  idName: r'id',
  indexes: {
    r'presetName': IndexSchema(
      id: -457108311343499266,
      name: r'presetName',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'presetName',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _presetGetId,
  getLinks: _presetGetLinks,
  attach: _presetAttach,
  version: '3.1.0+1',
);

int _presetEstimateSize(
  Preset object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.brand;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.capacity;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.drinkName.length * 3;
  bytesCount += 3 + object.fullDescription.length * 3;
  bytesCount += 3 + object.iceLevel.length * 3;
  bytesCount += 3 + object.presetName.length * 3;
  bytesCount += 3 + object.sweetness.length * 3;
  {
    final value = object.teaBase;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.toppings.length * 3;
  {
    for (var i = 0; i < object.toppings.length; i++) {
      final value = object.toppings[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.toppingsDisplay.length * 3;
  return bytesCount;
}

void _presetSerialize(
  Preset object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.brand);
  writer.writeString(offsets[1], object.capacity);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeString(offsets[3], object.drinkName);
  writer.writeString(offsets[4], object.fullDescription);
  writer.writeString(offsets[5], object.iceLevel);
  writer.writeString(offsets[6], object.presetName);
  writer.writeString(offsets[7], object.sweetness);
  writer.writeString(offsets[8], object.teaBase);
  writer.writeStringList(offsets[9], object.toppings);
  writer.writeString(offsets[10], object.toppingsDisplay);
  writer.writeDateTime(offsets[11], object.updatedAt);
  writer.writeLong(offsets[12], object.usageCount);
}

Preset _presetDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Preset();
  object.brand = reader.readStringOrNull(offsets[0]);
  object.capacity = reader.readStringOrNull(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.drinkName = reader.readString(offsets[3]);
  object.iceLevel = reader.readString(offsets[5]);
  object.id = id;
  object.presetName = reader.readString(offsets[6]);
  object.sweetness = reader.readString(offsets[7]);
  object.teaBase = reader.readStringOrNull(offsets[8]);
  object.toppings = reader.readStringList(offsets[9]) ?? [];
  object.updatedAt = reader.readDateTime(offsets[11]);
  object.usageCount = reader.readLong(offsets[12]);
  return object;
}

P _presetDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringList(offset) ?? []) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readDateTime(offset)) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _presetGetId(Preset object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _presetGetLinks(Preset object) {
  return [];
}

void _presetAttach(IsarCollection<dynamic> col, Id id, Preset object) {
  object.id = id;
}

extension PresetByIndex on IsarCollection<Preset> {
  Future<Preset?> getByPresetName(String presetName) {
    return getByIndex(r'presetName', [presetName]);
  }

  Preset? getByPresetNameSync(String presetName) {
    return getByIndexSync(r'presetName', [presetName]);
  }

  Future<bool> deleteByPresetName(String presetName) {
    return deleteByIndex(r'presetName', [presetName]);
  }

  bool deleteByPresetNameSync(String presetName) {
    return deleteByIndexSync(r'presetName', [presetName]);
  }

  Future<List<Preset?>> getAllByPresetName(List<String> presetNameValues) {
    final values = presetNameValues.map((e) => [e]).toList();
    return getAllByIndex(r'presetName', values);
  }

  List<Preset?> getAllByPresetNameSync(List<String> presetNameValues) {
    final values = presetNameValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'presetName', values);
  }

  Future<int> deleteAllByPresetName(List<String> presetNameValues) {
    final values = presetNameValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'presetName', values);
  }

  int deleteAllByPresetNameSync(List<String> presetNameValues) {
    final values = presetNameValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'presetName', values);
  }

  Future<Id> putByPresetName(Preset object) {
    return putByIndex(r'presetName', object);
  }

  Id putByPresetNameSync(Preset object, {bool saveLinks = true}) {
    return putByIndexSync(r'presetName', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByPresetName(List<Preset> objects) {
    return putAllByIndex(r'presetName', objects);
  }

  List<Id> putAllByPresetNameSync(List<Preset> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'presetName', objects, saveLinks: saveLinks);
  }
}

extension PresetQueryWhereSort on QueryBuilder<Preset, Preset, QWhere> {
  QueryBuilder<Preset, Preset, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PresetQueryWhere on QueryBuilder<Preset, Preset, QWhereClause> {
  QueryBuilder<Preset, Preset, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Preset, Preset, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Preset, Preset, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Preset, Preset, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterWhereClause> presetNameEqualTo(
      String presetName) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'presetName',
        value: [presetName],
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterWhereClause> presetNameNotEqualTo(
      String presetName) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'presetName',
              lower: [],
              upper: [presetName],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'presetName',
              lower: [presetName],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'presetName',
              lower: [presetName],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'presetName',
              lower: [],
              upper: [presetName],
              includeUpper: false,
            ));
      }
    });
  }
}

extension PresetQueryFilter on QueryBuilder<Preset, Preset, QFilterCondition> {
  QueryBuilder<Preset, Preset, QAfterFilterCondition> brandIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'brand',
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> brandIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'brand',
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> brandEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> brandGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> brandLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> brandBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'brand',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> brandStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> brandEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> brandContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> brandMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'brand',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> brandIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brand',
        value: '',
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> brandIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'brand',
        value: '',
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> capacityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'capacity',
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> capacityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'capacity',
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> capacityEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'capacity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> capacityGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'capacity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> capacityLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'capacity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> capacityBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'capacity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> capacityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'capacity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> capacityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'capacity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> capacityContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'capacity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> capacityMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'capacity',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> capacityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'capacity',
        value: '',
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> capacityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'capacity',
        value: '',
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> drinkNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'drinkName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> drinkNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'drinkName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> drinkNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'drinkName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> drinkNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'drinkName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> drinkNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'drinkName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> drinkNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'drinkName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> drinkNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'drinkName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> drinkNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'drinkName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> drinkNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'drinkName',
        value: '',
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> drinkNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'drinkName',
        value: '',
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> fullDescriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fullDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition>
      fullDescriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fullDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> fullDescriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fullDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> fullDescriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fullDescription',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> fullDescriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fullDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> fullDescriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fullDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> fullDescriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fullDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> fullDescriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fullDescription',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> fullDescriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fullDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition>
      fullDescriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fullDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> iceLevelEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iceLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> iceLevelGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'iceLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> iceLevelLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'iceLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> iceLevelBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'iceLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> iceLevelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'iceLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> iceLevelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'iceLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> iceLevelContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'iceLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> iceLevelMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'iceLevel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> iceLevelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iceLevel',
        value: '',
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> iceLevelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'iceLevel',
        value: '',
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> presetNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'presetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> presetNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'presetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> presetNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'presetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> presetNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'presetName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> presetNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'presetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> presetNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'presetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> presetNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'presetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> presetNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'presetName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> presetNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'presetName',
        value: '',
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> presetNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'presetName',
        value: '',
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> sweetnessEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sweetness',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> sweetnessGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sweetness',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> sweetnessLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sweetness',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> sweetnessBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sweetness',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> sweetnessStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sweetness',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> sweetnessEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sweetness',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> sweetnessContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sweetness',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> sweetnessMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sweetness',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> sweetnessIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sweetness',
        value: '',
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> sweetnessIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sweetness',
        value: '',
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> teaBaseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'teaBase',
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> teaBaseIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'teaBase',
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> teaBaseEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'teaBase',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> teaBaseGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'teaBase',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> teaBaseLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'teaBase',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> teaBaseBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'teaBase',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> teaBaseStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'teaBase',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> teaBaseEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'teaBase',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> teaBaseContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'teaBase',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> teaBaseMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'teaBase',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> teaBaseIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'teaBase',
        value: '',
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> teaBaseIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'teaBase',
        value: '',
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> toppingsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'toppings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition>
      toppingsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'toppings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> toppingsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'toppings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> toppingsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'toppings',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> toppingsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'toppings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> toppingsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'toppings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> toppingsElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'toppings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> toppingsElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'toppings',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> toppingsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'toppings',
        value: '',
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition>
      toppingsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'toppings',
        value: '',
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> toppingsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'toppings',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> toppingsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'toppings',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> toppingsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'toppings',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> toppingsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'toppings',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> toppingsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'toppings',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> toppingsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'toppings',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> toppingsDisplayEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'toppingsDisplay',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition>
      toppingsDisplayGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'toppingsDisplay',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> toppingsDisplayLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'toppingsDisplay',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> toppingsDisplayBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'toppingsDisplay',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> toppingsDisplayStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'toppingsDisplay',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> toppingsDisplayEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'toppingsDisplay',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> toppingsDisplayContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'toppingsDisplay',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> toppingsDisplayMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'toppingsDisplay',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> toppingsDisplayIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'toppingsDisplay',
        value: '',
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition>
      toppingsDisplayIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'toppingsDisplay',
        value: '',
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> updatedAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> updatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> updatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> usageCountEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usageCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> usageCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'usageCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> usageCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'usageCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Preset, Preset, QAfterFilterCondition> usageCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'usageCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PresetQueryObject on QueryBuilder<Preset, Preset, QFilterCondition> {}

extension PresetQueryLinks on QueryBuilder<Preset, Preset, QFilterCondition> {}

extension PresetQuerySortBy on QueryBuilder<Preset, Preset, QSortBy> {
  QueryBuilder<Preset, Preset, QAfterSortBy> sortByBrand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.asc);
    });
  }

  QueryBuilder<Preset, Preset, QAfterSortBy> sortByBrandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.desc);
    });
  }

  QueryBuilder<Preset, Preset, QAfterSortBy> sortByCapacity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capacity', Sort.asc);
    });
  }

  QueryBuilder<Preset, Preset, QAfterSortBy> sortByCapacityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capacity', Sort.desc);
    });
  }

  QueryBuilder<Preset, Preset, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Preset, Preset, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Preset, Preset, QAfterSortBy> sortByDrinkName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'drinkName', Sort.asc);
    });
  }

  QueryBuilder<Preset, Preset, QAfterSortBy> sortByDrinkNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'drinkName', Sort.desc);
    });
  }

  QueryBuilder<Preset, Preset, QAfterSortBy> sortByFullDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullDescription', Sort.asc);
    });
  }

  QueryBuilder<Preset, Preset, QAfterSortBy> sortByFullDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullDescription', Sort.desc);
    });
  }

  QueryBuilder<Preset, Preset, QAfterSortBy> sortByIceLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iceLevel', Sort.asc);
    });
  }

  QueryBuilder<Preset, Preset, QAfterSortBy> sortByIceLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iceLevel', Sort.desc);
    });
  }

  QueryBuilder<Preset, Preset, QAfterSortBy> sortByPresetName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'presetName', Sort.asc);
    });
  }

  QueryBuilder<Preset, Preset, QAfterSortBy> sortByPresetNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'presetName', Sort.desc);
    });
  }

  QueryBuilder<Preset, Preset, QAfterSortBy> sortBySweetness() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sweetness', Sort.asc);
    });
  }

  QueryBuilder<Preset, Preset, QAfterSortBy> sortBySweetnessDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sweetness', Sort.desc);
    });
  }

  QueryBuilder<Preset, Preset, QAfterSortBy> sortByTeaBase() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teaBase', Sort.asc);
    });
  }

  QueryBuilder<Preset, Preset, QAfterSortBy> sortByTeaBaseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teaBase', Sort.desc);
    });
  }

  QueryBuilder<Preset, Preset, QAfterSortBy> sortByToppingsDisplay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toppingsDisplay', Sort.asc);
    });
  }

  QueryBuilder<Preset, Preset, QAfterSortBy> sortByToppingsDisplayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toppingsDisplay', Sort.desc);
    });
  }

  QueryBuilder<Preset, Preset, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Preset, Preset, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<Preset, Preset, QAfterSortBy> sortByUsageCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usageCount', Sort.asc);
    });
  }

  QueryBuilder<Preset, Preset, QAfterSortBy> sortByUsageCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usageCount', Sort.desc);
    });
  }
}

extension PresetQuerySortThenBy on QueryBuilder<Preset, Preset, QSortThenBy> {
  QueryBuilder<Preset, Preset, QAfterSortBy> thenByBrand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.asc);
    });
  }

  QueryBuilder<Preset, Preset, QAfterSortBy> thenByBrandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.desc);
    });
  }

  QueryBuilder<Preset, Preset, QAfterSortBy> thenByCapacity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capacity', Sort.asc);
    });
  }

  QueryBuilder<Preset, Preset, QAfterSortBy> thenByCapacityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capacity', Sort.desc);
    });
  }

  QueryBuilder<Preset, Preset, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Preset, Preset, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Preset, Preset, QAfterSortBy> thenByDrinkName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'drinkName', Sort.asc);
    });
  }

  QueryBuilder<Preset, Preset, QAfterSortBy> thenByDrinkNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'drinkName', Sort.desc);
    });
  }

  QueryBuilder<Preset, Preset, QAfterSortBy> thenByFullDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullDescription', Sort.asc);
    });
  }

  QueryBuilder<Preset, Preset, QAfterSortBy> thenByFullDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullDescription', Sort.desc);
    });
  }

  QueryBuilder<Preset, Preset, QAfterSortBy> thenByIceLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iceLevel', Sort.asc);
    });
  }

  QueryBuilder<Preset, Preset, QAfterSortBy> thenByIceLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iceLevel', Sort.desc);
    });
  }

  QueryBuilder<Preset, Preset, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Preset, Preset, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Preset, Preset, QAfterSortBy> thenByPresetName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'presetName', Sort.asc);
    });
  }

  QueryBuilder<Preset, Preset, QAfterSortBy> thenByPresetNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'presetName', Sort.desc);
    });
  }

  QueryBuilder<Preset, Preset, QAfterSortBy> thenBySweetness() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sweetness', Sort.asc);
    });
  }

  QueryBuilder<Preset, Preset, QAfterSortBy> thenBySweetnessDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sweetness', Sort.desc);
    });
  }

  QueryBuilder<Preset, Preset, QAfterSortBy> thenByTeaBase() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teaBase', Sort.asc);
    });
  }

  QueryBuilder<Preset, Preset, QAfterSortBy> thenByTeaBaseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teaBase', Sort.desc);
    });
  }

  QueryBuilder<Preset, Preset, QAfterSortBy> thenByToppingsDisplay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toppingsDisplay', Sort.asc);
    });
  }

  QueryBuilder<Preset, Preset, QAfterSortBy> thenByToppingsDisplayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toppingsDisplay', Sort.desc);
    });
  }

  QueryBuilder<Preset, Preset, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Preset, Preset, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<Preset, Preset, QAfterSortBy> thenByUsageCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usageCount', Sort.asc);
    });
  }

  QueryBuilder<Preset, Preset, QAfterSortBy> thenByUsageCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usageCount', Sort.desc);
    });
  }
}

extension PresetQueryWhereDistinct on QueryBuilder<Preset, Preset, QDistinct> {
  QueryBuilder<Preset, Preset, QDistinct> distinctByBrand(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'brand', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Preset, Preset, QDistinct> distinctByCapacity(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'capacity', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Preset, Preset, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<Preset, Preset, QDistinct> distinctByDrinkName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'drinkName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Preset, Preset, QDistinct> distinctByFullDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fullDescription',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Preset, Preset, QDistinct> distinctByIceLevel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'iceLevel', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Preset, Preset, QDistinct> distinctByPresetName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'presetName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Preset, Preset, QDistinct> distinctBySweetness(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sweetness', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Preset, Preset, QDistinct> distinctByTeaBase(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'teaBase', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Preset, Preset, QDistinct> distinctByToppings() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'toppings');
    });
  }

  QueryBuilder<Preset, Preset, QDistinct> distinctByToppingsDisplay(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'toppingsDisplay',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Preset, Preset, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<Preset, Preset, QDistinct> distinctByUsageCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usageCount');
    });
  }
}

extension PresetQueryProperty on QueryBuilder<Preset, Preset, QQueryProperty> {
  QueryBuilder<Preset, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Preset, String?, QQueryOperations> brandProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'brand');
    });
  }

  QueryBuilder<Preset, String?, QQueryOperations> capacityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'capacity');
    });
  }

  QueryBuilder<Preset, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<Preset, String, QQueryOperations> drinkNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'drinkName');
    });
  }

  QueryBuilder<Preset, String, QQueryOperations> fullDescriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fullDescription');
    });
  }

  QueryBuilder<Preset, String, QQueryOperations> iceLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'iceLevel');
    });
  }

  QueryBuilder<Preset, String, QQueryOperations> presetNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'presetName');
    });
  }

  QueryBuilder<Preset, String, QQueryOperations> sweetnessProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sweetness');
    });
  }

  QueryBuilder<Preset, String?, QQueryOperations> teaBaseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'teaBase');
    });
  }

  QueryBuilder<Preset, List<String>, QQueryOperations> toppingsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'toppings');
    });
  }

  QueryBuilder<Preset, String, QQueryOperations> toppingsDisplayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'toppingsDisplay');
    });
  }

  QueryBuilder<Preset, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<Preset, int, QQueryOperations> usageCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usageCount');
    });
  }
}
