import 'dart:io';

import 'package:ferry_generator2_end_to_end/aliases/__generated__/alias_var_fragment.data.gql.dart';
import 'package:ferry_generator2_end_to_end/custom/date.dart';
import 'package:ferry_generator2_end_to_end/directives/__generated__/create_review_with_directives.req.gql.dart';
import 'package:ferry_generator2_end_to_end/directives/__generated__/create_review_with_directives.var.gql.dart';
import 'package:ferry_generator2_end_to_end/directives/__generated__/human_with_directives.data.gql.dart';
import 'package:ferry_generator2_end_to_end/directives/__generated__/human_with_directives.req.gql.dart';
import 'package:ferry_generator2_end_to_end/directives/__generated__/human_with_directives.var.gql.dart';
import 'package:ferry_generator2_end_to_end/edge_cases/__generated__/conditional_type_fragment.data.gql.dart'
    as conditional;
import 'package:ferry_generator2_end_to_end/edge_cases/__generated__/deep_fragments.data.gql.dart';
import 'package:ferry_generator2_end_to_end/edge_cases/__generated__/fragment_directives.data.gql.dart';
import 'package:ferry_generator2_end_to_end/edge_cases/__generated__/human_birthday.data.gql.dart';
import 'package:ferry_generator2_end_to_end/edge_cases/__generated__/posts_by_likes.var.gql.dart';
import 'package:ferry_generator2_end_to_end/edge_cases/__generated__/review_by_one_of.req.gql.dart';
import 'package:ferry_generator2_end_to_end/edge_cases/__generated__/review_by_one_of.var.gql.dart';
import 'package:ferry_generator2_end_to_end/edge_cases/__generated__/reviews_with_defaults.var.gql.dart';
import 'package:ferry_generator2_end_to_end/edge_cases/__generated__/search_with_default.var.gql.dart';
import 'package:ferry_generator2_end_to_end/edge_cases/__generated__/search_with_starship.data.gql.dart';
import 'package:ferry_generator2_end_to_end/edge_cases/__generated__/settings.data.gql.dart';
import 'package:ferry_generator2_end_to_end/edge_cases/__generated__/unconditional_type_fragment.data.gql.dart'
    as unconditional;
import 'package:ferry_generator2_end_to_end/edge_cases/__generated__/weird_names.data.gql.dart';
import 'package:ferry_generator2_end_to_end/fragments/__generated__/fragment_with_scalar_var.var.gql.dart';
import 'package:ferry_generator2_end_to_end/fragments/__generated__/hero_with_interface_subtyped_fragments.data.gql.dart';
import 'package:ferry_generator2_end_to_end/fragments/__generated__/nested_duplicate_fragments.data.gql.dart';
import 'package:ferry_generator2_end_to_end/fragments/__generated__/shared_fragment_queries.data.gql.dart';
import 'package:ferry_generator2_end_to_end/interfaces/__generated__/hero_for_episode.data.gql.dart';
import 'package:ferry_generator2_end_to_end/interfaces/__generated__/hero_for_episode.req.gql.dart';
import 'package:ferry_generator2_end_to_end/interfaces/__generated__/hero_for_episode.var.gql.dart';
import 'package:ferry_generator2_end_to_end/interfaces/__generated__/multiple_interfaces_plus_fragments.data.gql.dart';
import 'package:ferry_generator2_end_to_end/interfaces/__generated__/transitive_interface_inheritance.data.gql.dart';
import 'package:ferry_generator2_end_to_end/issue_610/__generated__/books.data.gql.dart';
import 'package:ferry_generator2_end_to_end/no_vars/__generated__/hero_no_vars.req.gql.dart';
import 'package:ferry_generator2_end_to_end/subscriptions/__generated__/review_added.data.gql.dart';
import 'package:ferry_generator2_end_to_end/subscriptions/__generated__/review_added.req.gql.dart';
import 'package:ferry_generator2_end_to_end/subscriptions/__generated__/review_added.var.gql.dart';
import 'package:ferry_generator2_end_to_end/scalars/__generated__/review_with_date.var.gql.dart';
import 'package:ferry_generator2_end_to_end/scalars/__generated__/review_with_date.req.gql.dart';
import 'package:ferry_generator2_end_to_end/scalars/__generated__/review_with_date.data.gql.dart';
import 'package:ferry_generator2_end_to_end/variables/__generated__/create_custom_field.data.gql.dart';
import 'package:ferry_generator2_end_to_end/variables/__generated__/create_custom_field.var.gql.dart';
import 'package:ferry_generator2_end_to_end/variables/__generated__/create_review.data.gql.dart';
import 'package:ferry_generator2_end_to_end/variables/__generated__/create_review.req.gql.dart';
import 'package:ferry_generator2_end_to_end/variables/__generated__/create_review.var.gql.dart';
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.schema.gql.dart'
    as _schema;
import 'package:gql_tristate_value/gql_tristate_value.dart';
import 'package:test/test.dart';

void main() {
  test('issue 610 generated classes stay scoped', () async {
    final file = File('lib/issue_610/__generated__/books.data.gql.dart');
    final contents = await file.readAsString();

    expect(contents, contains('class GAuthorFragmentData__asPerson'));
    expect(contents, contains('class GAuthorFragmentData__asCompany'));
    expect(contents, contains('class GBookFragmentData__asTextbook'));
    expect(contents, contains('class GBookFragmentData__asColoringBook'));
    expect(contents, isNot(contains('GBookFragmentData__asPerson')));
    expect(contents, isNot(contains('GBookFragmentData__asCompany')));
    expect(contents, isNot(contains('class GBookFragmentData_author')));
    expect(contents, contains('GAuthorFragmentData'));
  });

  test('shared fragments reuse data classes across operations', () async {
    final file = File(
      'lib/fragments/__generated__/shared_fragment_queries.data.gql.dart',
    );
    final contents = await file.readAsString();

    expect(contents, contains('class GSharedBookFragmentData'));
    expect(contents, contains('class GSharedBooksAData'));
    expect(contents, contains('class GSharedBooksBData'));
    expect(contents, isNot(contains('class GSharedBooksAData_books')));
    expect(contents, isNot(contains('class GSharedBooksBData_books')));
  });

  test('interface fragments generate typed nested selections', () {
    final data = GHeroWithInterfaceSubTypedFragmentsData.fromJson({
      '__typename': 'Query',
      'hero': {
        '__typename': 'Human',
        'id': '1000',
        'name': 'Luke',
        'homePlanet': 'Tatooine',
        'friends': [
          {
            '__typename': 'Droid',
            'id': '2000',
            'name': 'R2-D2',
            'primaryFunction': 'Astromech',
          },
          {
            '__typename': 'Human',
            'id': '1001',
            'name': 'Han',
            'homePlanet': null,
          },
        ],
      },
    });

    final hero = data.hero;
    expect(hero, isA<GheroFieldsFragmentData__asHuman>());

    final friends = (hero as GheroFieldsFragmentData__asHuman).friends!;
    expect(friends, hasLength(2));
    expect(
      friends.first!,
      isA<GheroFieldsFragmentData__asHuman_friends__asDroid>(),
    );
    expect(
      friends.last!,
      isA<GheroFieldsFragmentData__asHuman_friends__asHuman>(),
    );
    expect(
      friends.first!,
      isA<GheroFieldsFragment__asHuman_friends>(),
    );
  });

  test('unknown fallback handles unexpected union members', () {
    final data = GSearchResultsQueryData.fromJson({
      '__typename': 'Query',
      'search': [
        {'__typename': 'Starship'},
      ],
    });

    final result = data.search!.first!;
    expect(result, isA<GSearchResultsQueryData_search__unknown>());
    expect(result.G__typename, 'Starship');
  });

  test('interface unknown fallback preserves typename', () {
    final data = GHeroWithInterfaceSubTypedFragmentsData.fromJson({
      '__typename': 'Query',
      'hero': {
        '__typename': 'Wookiee',
        'id': '3000',
        'name': 'Chewbacca',
      },
    });

    final hero = data.hero;
    expect(hero, isNotNull);
    expect(hero, isA<GheroFieldsFragmentData__unknown>());
    expect(hero!.G__typename, 'Wookiee');
  });

  test('unknown friend variant uses __unknown for interface fragments', () {
    final data = GHeroWithInterfaceSubTypedFragmentsData.fromJson({
      '__typename': 'Query',
      'hero': {
        '__typename': 'Human',
        'id': '1000',
        'name': 'Luke',
        'homePlanet': 'Tatooine',
        'friends': [
          {
            '__typename': 'Wookiee',
          },
        ],
      },
    });

    final hero = data.hero;
    expect(hero, isA<GheroFieldsFragmentData__asHuman>());
    final friends = (hero as GheroFieldsFragmentData__asHuman).friends!;
    expect(
      friends.first,
      isA<GheroFieldsFragmentData__asHuman_friends__unknown>(),
    );
  });

  test('interface friends preserve null entries', () {
    final data = GHeroWithInterfaceSubTypedFragmentsData.fromJson({
      '__typename': 'Query',
      'hero': {
        '__typename': 'Human',
        'id': '1000',
        'name': 'Luke',
        'homePlanet': 'Tatooine',
        'friends': [
          null,
          {
            '__typename': 'Droid',
            'id': '2000',
            'name': 'R2-D2',
            'primaryFunction': 'Astromech',
          },
        ],
      },
    });

    final hero = data.hero as GheroFieldsFragmentData__asHuman;
    expect(hero.friends, isNotNull);
    expect(hero.friends!.first, isNull);
  });

  test('nested fragments round-trip through JSON', () {
    final input = {
      '__typename': 'Query',
      'search': [
        {
          '__typename': 'Human',
          'id': '1000',
          'name': 'Luke',
          'appearsIn': ['NEWHOPE'],
          'friends': [
            {
              '__typename': 'Human',
              'id': '1001',
              'name': 'Leia',
              'friendsConnection': {
                '__typename': 'FriendsConnection',
                'friends': [
                  {
                    '__typename': 'Human',
                    'id': '1002',
                    'name': 'Han',
                  },
                ],
              },
            },
          ],
        },
      ],
    };

    final data = GSearchResultsQueryData.fromJson(input);
    final first = data.search!.first!;
    expect(first, isA<GSearchResultsQueryData_search__asHuman>());
    expect(
      (first as GSearchResultsQueryData_search__asHuman).appearsIn,
      equals([_schema.GEpisode.NEWHOPE]),
    );
    expect(data.toJson(), equals(input));
  });

  test('union list preserves null entries', () {
    final input = {
      '__typename': 'Query',
      'search': [
        null,
        {
          '__typename': 'Starship',
          'id': '3000',
          'name': 'Falcon',
          'length': 34.75,
          'coordinates': [
            [1.0, 2.0],
          ],
        },
      ],
    };

    final data = GSearchWithStarshipData.fromJson(input);
    expect(data.search?.first, isNull);
    expect(data.toJson(), equals(input));
  });

  test('enum list uses unknown fallback for unexpected values', () {
    final data = GSearchResultsQueryData.fromJson({
      '__typename': 'Query',
      'search': [
        {
          '__typename': 'Human',
          'id': '1000',
          'name': 'Luke',
          'appearsIn': ['NEWHOPE', 'SURPRISE'],
          'friends': const <Object?>[],
        },
      ],
    });

    final human =
        data.search!.first! as GSearchResultsQueryData_search__asHuman;
    expect(human.appearsIn, contains(_schema.GEpisode.gUnknownEnumValue));
    final json = data.toJson();
    final search = json['search'] as List<dynamic>;
    final first = search.first as Map<String, dynamic>;
    final appearsIn = first['appearsIn'] as List<dynamic>;
    expect(appearsIn, contains('gUnknownEnumValue'));
  });

  test('fragment directives allow skipped fields', () {
    final data = GHeroFragmentDirectivesData.fromJson({
      '__typename': 'Query',
      'hero': {
        '__typename': 'Human',
        'id': '1000',
      },
    });

    final hero = data.hero!;
    expect(hero.id, '1000');
    expect(hero.name, isNull);
    expect(data.toJson()['hero']['name'], isNull);
  });

  test('deep fragments round-trip through JSON', () {
    final input = {
      '__typename': 'Query',
      'hero': {
        '__typename': 'Human',
        'id': '1000',
        'name': 'Luke',
        'friends': [
          {
            '__typename': 'Droid',
            'id': '2000',
            'name': 'R2-D2',
          },
        ],
      },
    };

    final data = GDeepFragmentsData.fromJson(input);
    expect(data.hero, isA<GFragLevel1Data>());
    expect(data.hero, isA<GFragLevel3>());
    expect(data.hero, isNot(isA<GFragLevel4>()));
    expect(data.hero!.friends!.first, isA<GFragLevel4Data>());
    expect(data.toJson(), equals(input));
  });

  test('conditional inline fragment does not add interface implements', () {
    final input = {
      '__typename': 'Query',
      'hero': {
        '__typename': 'Human',
        'id': '1000',
        'name': 'Luke',
      },
    };

    final data = conditional.GHeroConditionalTypeFragmentData.fromJson(input);
    expect(
      data.hero,
      isA<conditional.GHeroConditionalTypeFragmentData_hero__asHuman>(),
    );
    expect(data.hero is conditional.GHumanName, isFalse);
  });

  test('unconditional inline fragment adds interface on variant', () {
    final input = {
      '__typename': 'Query',
      'hero': {
        '__typename': 'Human',
        'id': '1000',
        'name': 'Luke',
      },
    };

    final data =
        unconditional.GHeroUnconditionalTypeFragmentData.fromJson(input);
    expect(
      data.hero,
      isA<unconditional.GHeroUnconditionalTypeFragmentData_hero__asHuman>(),
    );
    expect(data.hero, isA<unconditional.GHumanName>());
  });

  test('hero_for_episode data round-trips through JSON', () {
    final input = {
      '__typename': 'Query',
      'hero': {
        '__typename': 'Droid',
        'name': 'R2-D2',
        'friends': [
          {
            '__typename': 'Human',
            'name': 'Luke',
          },
        ],
        'primaryFunction': 'Astromech',
        'result': null,
      },
    };

    final data = GHeroForEpisodeData.fromJson(input);
    expect(data.hero, isA<GDroidFragment>());
    expect(data.toJson(), equals(input));
  });

  test('union selection includes starship fields', () {
    final input = {
      '__typename': 'Query',
      'search': [
        {
          '__typename': 'Starship',
          'id': '3000',
          'name': 'Falcon',
          'length': 34.75,
          'coordinates': [
            [1.0, 2.0],
            [3.0, 4.0],
          ],
        },
      ],
    };

    final data = GSearchWithStarshipData.fromJson(input);
    final starship =
        data.search!.first! as GSearchWithStarshipData_search__asStarship;
    expect(
        starship.coordinates,
        equals([
          [1.0, 2.0],
          [3.0, 4.0]
        ]));
    expect(data.toJson(), equals(input));
  });

  test('weird names are escaped and round-trip', () {
    final input = {
      '__typename': 'Query',
      'weirdNames': {
        '__typename': 'WeirdNames',
        'class': 'klass',
        'toJson': 'to',
        'fromJson': 'from',
        'copyWith': 'copy',
        'hashCode': 'hash',
        'values': ['a', null],
        'result': 'ok',
        'runtimeType': 'type',
      },
    };

    final data = GWeirdNamesData.fromJson(input);
    final weird = data.weirdNames!;
    expect(weird.Gclass, 'klass');
    expect(weird.GtoJson, 'to');
    expect(weird.GfromJson, 'from');
    expect(weird.GcopyWith, 'copy');
    expect(weird.GhashCode, 'hash');
    expect(weird.Gvalues, equals(['a', null]));
    expect(weird.result, 'ok');
    expect(weird.GruntimeType, 'type');
    expect(data.toJson(), equals(input));
  });

  test('fragment reuse keeps selection types compact', () {
    final data = GPostsData.fromJson({
      '__typename': 'Query',
      'posts': [
        {
          '__typename': 'Post',
          'id': 'post-1',
          'isFavorited': {
            '__typename': 'PostLikes',
            'totalCount': 2,
          },
          'isLiked': {
            '__typename': 'PostFavorites',
            'totalCount': 1,
          },
        },
      ],
    });

    final fragment = data.posts!.first!;
    expect(fragment, isA<GPostFragmentData>());
    expect(fragment.isFavorited?.totalCount, 2);
    expect(fragment.isLiked?.totalCount, 1);
  });

  test('postsByLikes vars serialize with null items', () {
    final vars = GPostsByLikesVars(
      likes: Value.present([
        null,
        const _schema.GPostLikesInput(id: '1'),
      ]),
    );
    expect(
      vars.toJson(),
      equals({
        'likes': [
          null,
          {'id': '1'},
        ],
      }),
    );
    expect(GPostsByLikesVars.fromJson(vars.toJson()).toJson(), vars.toJson());
  });

  test('searchWithDefault vars omit absent values', () {
    final vars = GSearchWithDefaultVars();
    expect(vars.toJson(), isEmpty);

    final withNull = GSearchWithDefaultVars(text: const Value.present(null));
    expect(withNull.toJson(), equals({'text': null}));
  });

  test('reviewsWithDefaults vars omit default stars', () {
    final vars = GReviewsWithDefaultsVars(episode: _schema.GEpisode.JEDI);
    expect(vars.toJson(), equals({'episode': 'JEDI'}));

    final withStars = GReviewsWithDefaultsVars(
      episode: _schema.GEpisode.JEDI,
      stars: const Value.present([5, 4]),
    );
    expect(
        withStars.toJson(),
        equals({
          'episode': 'JEDI',
          'stars': [5, 4]
        }));
  });

  test('date scalar output uses custom converter', () {
    final input = {
      '__typename': 'Query',
      'human': {
        '__typename': 'Human',
        'id': '1000',
        'name': 'Luke',
        'birthday': '2020-01-01T00:00:00.000Z',
      },
    };

    final data = GHumanBirthdayData.fromJson(input);
    final human = data.human!;
    expect(human.birthday, isA<CustomDate>());
    expect(human.birthday.value, DateTime.utc(2020, 1, 1));
    expect(data.toJson(), equals(input));
  });

  test('json scalar output maps to Map<String, dynamic>', () {
    final input = {
      '__typename': 'Query',
      'settings': {
        'theme': 'dark',
        'flags': [true, false],
        'nested': {'count': 2},
      },
    };

    final data = GSettingsData.fromJson(input);
    expect(data.settings, isA<Map<String, dynamic>>());
    expect(data.toJson(), equals(input));
  });

  test('issue 610 fragments stay scoped to author selections', () {
    final input = {
      '__typename': 'Query',
      'books': [
        {
          '__typename': 'Textbook',
          'title': 'GraphQL 101',
          'courses': ['Intro'],
          'tagMatrix': [
            ['tag1', 'tag2'],
            ['tag3'],
          ],
          'tagMatrixNullable': [
            ['nullable', null],
            null,
            const <Object>[],
          ],
          'relatedBooks': [
            [
              {
                '__typename': 'Textbook',
                'title': 'GraphQL 102',
                'author': {
                  '__typename': 'Person',
                  'displayName': 'Bob Builder',
                  'firstName': 'Bob',
                  'lastName': 'Builder',
                },
              },
            ],
          ],
          'author': {
            '__typename': 'Person',
            'displayName': 'Ada Lovelace',
            'firstName': 'Ada',
            'lastName': 'Lovelace',
          },
        },
      ],
    };
    final data = GGetBooksData.fromJson(input);
    expect(data.toJson(), equals(input));

    final book = data.books.first;
    expect(book, isA<GBookFragmentData__asTextbook>());
    expect(book.author, isA<GAuthorFragmentData__asPerson>());

    final author = book.author as GAuthorFragmentData__asPerson;
    expect(author.displayName, 'Ada Lovelace');
    expect(author.firstName, 'Ada');
    expect(author.lastName, 'Lovelace');
  });

  test('shared fragment reuse across operations', () {
    final input = {
      '__typename': 'Query',
      'books': [
        {
          '__typename': 'Textbook',
          'title': 'GraphQL 101',
          'courses': ['Intro'],
          'tagMatrix': [
            ['tag1', 'tag2'],
            ['tag3'],
          ],
          'tagMatrixNullable': [
            ['nullable', null],
            null,
            <Object>[],
          ],
          'relatedBooks': [
            [
              {
                '__typename': 'Textbook',
                'title': 'GraphQL 102',
                'author': {
                  '__typename': 'Person',
                  'displayName': 'Bob Builder',
                  'firstName': 'Bob',
                  'lastName': 'Builder',
                },
              },
            ],
          ],
          'author': {
            '__typename': 'Person',
            'displayName': 'Ada Lovelace',
            'firstName': 'Ada',
            'lastName': 'Lovelace',
          },
        },
      ],
    };

    final first = GSharedBooksAData.fromJson(input);
    final second = GSharedBooksBData.fromJson(input);
    expect(first.books.first, isA<GSharedBookFragmentData>());
    expect(second.books.first, isA<GSharedBookFragmentData>());
    expect(first.toJson(), equals(input));
    expect(second.toJson(), equals(input));
  });

  test('data equality deep-compares lists', () {
    final input = {
      '__typename': 'Query',
      'books': [
        {
          '__typename': 'Textbook',
          'title': 'GraphQL 101',
          'courses': ['Intro', 'Advanced'],
          'tagMatrix': [
            ['tag1', 'tag2'],
            ['tag3'],
          ],
          'tagMatrixNullable': [
            ['nullable', null],
            null,
            <Object?>[],
          ],
          'relatedBooks': [
            [
              {
                '__typename': 'Textbook',
                'title': 'GraphQL 102',
                'author': {
                  '__typename': 'Person',
                  'displayName': 'Bob Builder',
                  'firstName': 'Bob',
                  'lastName': 'Builder',
                },
              },
            ],
          ],
          'author': {
            '__typename': 'Person',
            'displayName': 'Ada Lovelace',
            'firstName': 'Ada',
            'lastName': 'Lovelace',
          },
        },
      ],
    };

    final first = GGetBooksData.fromJson(input);
    final second = GGetBooksData.fromJson(input);

    expect(identical(first, second), isFalse);
    expect(first, equals(second));
    expect(first.hashCode, equals(second.hashCode));

    final different = GGetBooksData.fromJson({
      '__typename': 'Query',
      'books': [
        {
          '__typename': 'Textbook',
          'title': 'GraphQL 101',
          'courses': ['Intro'],
          'tagMatrix': [
            ['tag1', 'tag2'],
            ['tag3'],
          ],
          'tagMatrixNullable': [
            ['nullable', null],
            null,
            <Object?>[],
          ],
          'relatedBooks': [
            [
              {
                '__typename': 'Textbook',
                'title': 'GraphQL 102',
                'author': {
                  '__typename': 'Person',
                  'displayName': 'Bob Builder',
                  'firstName': 'Bob',
                  'lastName': 'Builder',
                },
              },
            ],
          ],
          'author': {
            '__typename': 'Person',
            'displayName': 'Ada Lovelace',
            'firstName': 'Ada',
            'lastName': 'Lovelace',
          },
        },
      ],
    });

    expect(first, isNot(equals(different)));
  });

  test('equals handles field named other', () {
    final input = {
      '__typename': 'Query',
      'cThing': {
        '__typename': 'Other',
        'id': 'c-1',
        'cField': 'cField-1',
      },
      'dThing': {
        '__typename': 'Other',
        'id': 'd-1',
        'dField': 'dField-1',
      },
      'other': {
        '__typename': 'Other',
        'id': 'o-1',
        'cField': 'cField-2',
        'dField': 'dField-2',
      },
    };

    final first = GMultipleInterfacesData.fromJson(input);
    final second = GMultipleInterfacesData.fromJson(input);

    expect(first, equals(second));
    expect(first.hashCode, equals(second.hashCode));
  });

  test('create review mutation round-trips and vars serialize', () {
    final input = {
      '__typename': 'Mutation',
      'createReview': {
        '__typename': 'Review',
        'episode': 'JEDI',
        'stars': 5,
        'commentary': 'Great',
      },
    };

    final data = GCreateReviewData.fromJson(input);
    expect(data.createReview?.episode, _schema.GEpisode.JEDI);
    expect(data.toJson(), equals(input));

    final vars = GCreateReviewVars(
      episode: Value.present(_schema.GEpisode.JEDI),
      review: _schema.GReviewInput(
        stars: 5,
        commentary: Value.present('Great'),
      ),
    );
    final varsJson = vars.toJson();
    expect(
        varsJson,
        equals({
          'episode': 'JEDI',
          'review': {'stars': 5, 'commentary': 'Great'}
        }));
    expect(GCreateReviewVars.fromJson(varsJson).toJson(), equals(varsJson));

    final req = GCreateReviewReq(vars: vars);
    expect(req.execRequest.variables, equals(varsJson));
    expect(req.dataToJson(GCreateReviewData.fromJson(input)), equals(input));
  });

  test('review input omits absent optional fields', () {
    final input = _schema.GReviewInput(stars: 4);
    expect(input.toJson(), equals({'stars': 4}));
  });

  test('review input supports present nulls and custom scalar lists', () {
    final input = _schema.GReviewInput(
      stars: 5,
      commentary: const Value.present(null),
      favorite_color: const Value.present(null),
      seenOn: Value.present(
        [
          CustomDate(DateTime.utc(2020, 1, 1)),
          null,
        ],
      ),
    );

    final json = input.toJson();
    expect(json['commentary'], isNull);
    expect(json['favorite_color'], isNull);
    expect(
      json['seenOn'],
      equals(['2020-01-01T00:00:00.000Z', null]),
    );
    expect(_schema.GReviewInput.fromJson(json).toJson(), equals(json));
  });

  test('@oneOf input objects serialize as exactly one key', () {
    final byId = _schema.GReviewBy.id(id: 'r-1');
    expect(byId.toJson(), equals({'id': 'r-1'}));
    expect(_schema.GReviewBy.fromJson(byId.toJson()).toJson(),
        equals(byId.toJson()));

    final bySeenOn = _schema.GReviewBy.seenOn(
      seenOn: [
        CustomDate(DateTime.utc(2020, 1, 1)),
        null,
      ],
    );
    expect(
      bySeenOn.toJson(),
      equals({
        'seenOn': ['2020-01-01T00:00:00.000Z', null]
      }),
    );
    expect(
      _schema.GReviewBy.fromJson(bySeenOn.toJson()).toJson(),
      equals(bySeenOn.toJson()),
    );

    final vars = GReviewByOneOfVars(by: byId);
    final varsJson = vars.toJson();
    expect(
        varsJson,
        equals({
          'by': {'id': 'r-1'}
        }));

    final req = GReviewByOneOfReq(vars: vars);
    expect(req.execRequest.variables, equals(varsJson));

    expect(
      () => _schema.GReviewBy.fromJson(const <String, dynamic>{}),
      throwsA(isA<ArgumentError>()),
    );
    expect(
      () => _schema.GReviewBy.fromJson({'id': 'r-1', 'createdAt': 'x'}),
      throwsA(isA<ArgumentError>()),
    );
    expect(
      () => _schema.GReviewBy.fromJson(const {'id': null}),
      throwsA(isA<ArgumentError>()),
    );
  });

  test('review added subscription round-trips and vars serialize', () {
    final input = {
      '__typename': 'Subscription',
      'reviewAdded': {
        '__typename': 'Review',
        'episode': 'EMPIRE',
        'stars': 4,
        'commentary': 'Nice',
      },
    };

    final data = GReviewAddedData.fromJson(input);
    expect(data.reviewAdded?.episode, _schema.GEpisode.EMPIRE);
    expect(data.toJson(), equals(input));

    final vars = GReviewAddedVars(episode: _schema.GEpisode.EMPIRE);
    final varsJson = vars.toJson();
    expect(varsJson, equals({'episode': 'EMPIRE'}));
    final parsedVars = GReviewAddedVars.fromJson(varsJson);
    expect(parsedVars.episode, _schema.GEpisode.EMPIRE);
    expect(parsedVars.toJson(), equals(varsJson));

    final req = GReviewAddedReq(vars: vars);
    expect(req.execRequest.variables, equals(varsJson));
    expect(req.dataToJson(GReviewAddedData.fromJson(input)), equals(input));
  });

  test('operation request parseData and vars serialize', () {
    final request = GHeroNoVarsReq();
    expect(request.vars, isNull);
    expect(request.varsToJson(), equals(<String, dynamic>{}));
    expect(request.execRequest.variables, equals(<String, dynamic>{}));

    final input = {
      '__typename': 'Query',
      'hero': {
        '__typename': 'Droid',
        'id': '2001',
        'name': 'R2-D2',
      },
    };
    final parsed = request.parseData(input)!;
    expect(request.dataToJson(parsed), equals(input));
  });

  test('request equality and hashCode compare deep maps', () {
    final vars = GCreateReviewVars(
      episode: Value.present(_schema.GEpisode.JEDI),
      review: const _schema.GReviewInput(stars: 5),
    );
    final first = GCreateReviewReq(
      vars: vars,
      requestId: 'req-1',
      updateCacheHandlerContext: <String, dynamic>{
        'tags': ['a', 'b'],
      },
    );
    final second = GCreateReviewReq(
      vars: vars,
      requestId: 'req-1',
      updateCacheHandlerContext: <String, dynamic>{
        'tags': ['a', 'b'],
      },
    );

    expect(identical(first, second), isFalse);
    expect(first, equals(second));
    expect(first.hashCode, equals(second.hashCode));

    final different = GCreateReviewReq(
      vars: vars,
      requestId: 'req-1',
      updateCacheHandlerContext: <String, dynamic>{
        'tags': ['a'],
      },
    );
    expect(first, isNot(equals(different)));
  });

  test('request copyWith updates nullable fields', () {
    final vars = GCreateReviewVars(
      episode: Value.present(_schema.GEpisode.JEDI),
      review: const _schema.GReviewInput(stars: 5),
    );
    final original = GCreateReviewReq(
      vars: vars,
      requestId: 'req-1',
      updateCacheHandlerContext: <String, dynamic>{
        'count': 1,
      },
    );

    final updated = original.copyWith(
      requestId: 'req-2',
      requestIdIsSet: true,
      updateCacheHandlerContext: <String, dynamic>{
        'count': 2,
      },
      updateCacheHandlerContextIsSet: true,
    );
    expect(updated.requestId, 'req-2');
    expect(
      updated.updateCacheHandlerContext,
      equals(<String, dynamic>{'count': 2}),
    );

    final cleared = updated.copyWith(
      requestId: null,
      requestIdIsSet: true,
    );
    expect(cleared.requestId, isNull);
  });

  test('no-vars request copyWith preserves vars', () {
    final original = GHeroNoVarsReq(
      requestId: 'req-1',
    );
    final updated = original.copyWith(
      requestId: 'req-2',
      requestIdIsSet: true,
    );
    expect(updated.vars, isNull);
    expect(updated.requestId, 'req-2');
  });

  test('vars equality and hashCode compare deep maps', () {
    final first = GCreateReviewVars(
      episode: Value.present(_schema.GEpisode.JEDI),
      review: const _schema.GReviewInput(
        stars: 5,
        commentary: Value.present('Nice'),
      ),
    );
    final second = GCreateReviewVars(
      episode: Value.present(_schema.GEpisode.JEDI),
      review: const _schema.GReviewInput(
        stars: 5,
        commentary: Value.present('Nice'),
      ),
    );

    expect(identical(first, second), isFalse);
    expect(first, equals(second));
    expect(first.hashCode, equals(second.hashCode));
  });

  test('vars copyWith updates fields', () {
    final original = GCreateReviewVars(
      episode: Value.present(_schema.GEpisode.NEWHOPE),
      review: const _schema.GReviewInput(stars: 3),
    );
    final updated = original.copyWith(
      episode: Value.present(_schema.GEpisode.JEDI),
    );

    expect(updated.toJson()['episode'], 'JEDI');
    expect(updated.review.stars, 3);
  });

  test('vars toString includes class name and fields', () {
    final vars = GCreateReviewVars(
      episode: Value.present(_schema.GEpisode.JEDI),
      review: const _schema.GReviewInput(stars: 4),
    );
    final value = vars.toString();
    expect(value, contains('GCreateReviewVars'));
    expect(value, contains('episode'));
    expect(value, contains('review'));
  });

  test('operation vars round-trip and execRequest variables', () {
    final vars = GHeroForEpisodeVars(ep: _schema.GEpisode.EMPIRE);
    final request = GHeroForEpisodeReq(vars: vars);

    final json = vars.toJson();
    expect(json, equals({'ep': 'EMPIRE'}));
    final parsed = GHeroForEpisodeVars.fromJson(json);
    expect(parsed.ep, _schema.GEpisode.EMPIRE);
    expect(parsed.toJson(), equals(json));
    expect(request.execRequest.variables, equals(json));
  });

  test('directive vars serialize and include input objects', () {
    final json = {
      'episode': 'JEDI',
      'review': {'stars': 5},
      'includeReview': true,
      'skipCommentary': false,
    };
    final vars = GCreateReviewWithDirectivesVars.fromJson(json);
    expect(vars.toJson(), equals(json));

    final req = GCreateReviewWithDirectivesReq(vars: vars);
    expect(req.execRequest.variables, equals(json));
  });

  test('human directives vars round-trip in requests', () {
    final json = {'includeName': true, 'skipId': false};
    final vars = GHumanWithDirectivesVars.fromJson(json);
    expect(vars.toJson(), equals(json));

    final req = GHumanWithDirectivesReq(vars: vars);
    expect(req.execRequest.variables, equals(json));
  });

  test('when and maybeWhen dispatch by typename', () {
    final data = GHeroForEpisodeData.fromJson({
      '__typename': 'Query',
      'hero': {
        '__typename': 'Droid',
        'name': 'R2-D2',
        'friends': const <Object?>[],
        'primaryFunction': 'Astromech',
      },
    });

    final hero = data.hero!;
    final selected = hero.when<String>(
      droid: (droid) => droid.primaryFunction ?? 'unknown',
      orElse: () => 'other',
    );
    expect(selected, 'Astromech');

    final maybe = hero.maybeWhen<String>(
      droid: null,
      orElse: () => 'fallback',
    );
    expect(maybe, 'fallback');
  });

  test('transitive interface fragments dispatch by concrete typename', () {
    final dataFoo = GAThingTransitiveInterfaceInheritanceData.fromJson({
      '__typename': 'Query',
      'aThing': {
        '__typename': 'Foo',
        'id': 'foo-1',
        'bField': 'b-1',
      },
    });

    final selectedFoo = dataFoo.aThing!.when<String>(
      b: (b) => 'b:${b.bField}',
      john: (john) => 'john:${john.johnOnly}',
      orElse: () => 'other',
    );
    expect(selectedFoo, 'b:b-1');

    final dataJohn = GAThingTransitiveInterfaceInheritanceData.fromJson({
      '__typename': 'Query',
      'aThing': {
        '__typename': 'John',
        'id': 'john-1',
        'johnOnly': 'j-1',
      },
    });

    final selectedJohn = dataJohn.aThing!.when<String>(
      b: (b) => 'b:${b.bField}',
      john: (john) => 'john:${john.johnOnly}',
      orElse: () => 'other',
    );
    expect(selectedJohn, 'john:j-1');
  });

  test('custom scalar overrides serialize via helpers', () {
    final vars = GReviewWithDateVars(
      episode: Value.present(_schema.GEpisode.JEDI),
      review: const _schema.GReviewInput(stars: 5),
      createdAt: Value.present(CustomDate(DateTime.utc(2020, 1, 1))),
    );

    final json = vars.toJson();
    expect(json['episode'], 'JEDI');
    expect(json['createdAt'], '2020-01-01T00:00:00.000Z');
  });

  test('vars deserialize and serialize with custom scalars', () {
    final input = {
      'episode': 'JEDI',
      'review': {
        'stars': 4,
      },
      'createdAt': '2020-01-02T03:04:05.000Z',
    };

    final vars = GReviewWithDateVars.fromJson(input);
    expect(vars.toJson(), equals(input));
  });

  test('scalar overrides map CustomField to String', () {
    final data = GCreateCustomFieldData.fromJson({
      '__typename': 'Mutation',
      'createCustomField': 'payload-1',
    });
    expect(data.createCustomField, 'payload-1');
    expect(
        data.toJson(),
        equals({
          '__typename': 'Mutation',
          'createCustomField': 'payload-1',
        }));

    final vars = GCreateCustomFieldVars(
      input: _schema.GCustomFieldInput(
        id: 'custom-1',
        customField: Value.present('custom-1'),
      ),
    );
    final varsJson = vars.toJson();
    expect(
      varsJson,
      equals({
        'input': {
          'id': 'custom-1',
          'customField': 'custom-1',
        },
      }),
    );
    expect(
        GCreateCustomFieldVars.fromJson(varsJson).toJson(), equals(varsJson));
  });

  test('scalar overrides map Json to Map<String, dynamic>', () {
    final vars = GPostsWithFixedVariableVars(
      filter: Value.present({
        'premium': true,
        'tags': ['starter', 'beta'],
      }),
    );

    expect(vars.filter, isA<Value<Map<String, dynamic>>>());

    final varsJson = vars.toJson();
    expect(
      varsJson,
      equals({
        'filter': {
          'premium': true,
          'tags': ['starter', 'beta'],
        },
      }),
    );

    final parsed = GPostsWithFixedVariableVars.fromJson(varsJson);
    expect(parsed.filter.isPresent, isTrue);
    expect(
      parsed.filter.requireValue,
      equals({
        'premium': true,
        'tags': ['starter', 'beta'],
      }),
    );
  });

  test('review_with_date mutation round-trips and req serialize', () {
    final input = {
      '__typename': 'Mutation',
      'createReview': {
        '__typename': 'Review',
        'episode': 'JEDI',
        'stars': 5,
        'commentary': 'Nice',
        'createdAt': '2020-01-02T03:04:05.000Z',
        'seenOn': ['2020-01-01T00:00:00.000Z'],
        'custom': ['foo'],
      },
    };

    final data = GReviewWithDateData.fromJson(input);
    expect(data.toJson(), equals(input));

    final vars = GReviewWithDateVars.fromJson({
      'episode': 'JEDI',
      'review': {'stars': 5},
      'createdAt': '2020-01-02T03:04:05.000Z',
    });
    final req = GReviewWithDateReq(vars: vars);
    expect(req.execRequest.variables, equals(vars.toJson()));
    expect(req.dataToJson(data), equals(input));
  });

  test('enum fallback returns global unknown value', () {
    expect(
      _schema.GEpisode.fromJson('SURPRISE'),
      _schema.GEpisode.gUnknownEnumValue,
    );
  });

  test('absent optional vars are omitted from JSON', () {
    final vars = GReviewWithDateVars(
      review: const _schema.GReviewInput(stars: 3),
    );

    final json = vars.toJson();
    expect(json.containsKey('episode'), isFalse);
    expect(json.containsKey('createdAt'), isFalse);
    expect(json['review'], isA<Map<String, dynamic>>());
  });

  test('conditional directives allow nullable fields', () {
    final data = GHumanWithDirectivesData.fromJson({
      '__typename': 'Query',
      'human': {
        '__typename': 'Human',
      },
    });

    final human = data.human!;
    expect(human.id, isNull);
    expect(human.name, isNull);
  });
}
