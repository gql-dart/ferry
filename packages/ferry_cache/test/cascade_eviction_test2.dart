




import 'package:ferry_cache/src/utils/evict_cascade2.dart';
import 'package:test/test.dart';

final _postData = {
  'Query': {
    '__typename': 'Query',
    'onePost': {'\$ref': 'Post:123'},
  },
  'Post:123': {
    'id': '123',
    '__typename': 'Post',
    'parent': {'\$ref': 'Post:456'},
  },
  'Post:456': {
    'id': '456',
    '__typename': 'Post',
  },
};

final _listPostData = {
  'Query': {
    '__typename': 'Query',
    'posts': [
      {'\$ref': 'Post:123'},
      {'\$ref': 'Post:456'},
    ],
  },
  'Post:123': {
    'id': '123',
    '__typename': 'Post',
  },
  'Post:456': {
    'id': '456',
    '__typename': 'Post',
  },
};

final _circularPosts =  {
  'Query': {
    '__typename': 'Query',
    'onePost': {'\$ref': 'Post:123'},
  },
  'Post:123': {
    'id': '123',
    '__typename': 'Post',
    'parent': {'\$ref': 'Post:456'},
  },
  'Post:456': {
    'id': '456',
    '__typename': 'Post',
    'parent': {'\$ref': 'Post:123'},
  },
};

final _listPostDataNestedNormalized = {
  'Query': {
    '__typename': 'Query',
    'posts': [
      {'\$ref' : 'NestedPost:123'},
      {'\$ref' : 'NestedPost:456'},
    ],

  },
  'NestedPost:123': {
    '__typename' : 'NestedPost',
    'post': {'\$ref': 'Post:123'},
  },
  'NestedPost:456': {
    '__typename' : 'NestedPost',
    'post': {'\$ref': 'Post:456'},
  },
  'Post:123': {
    'id': '123',
    '__typename': 'Post',
  },

};

final _listPostDataNested = {
  'Query': {
    '__typename': 'Query',
    'posts': [
      {'__typename' : 'NestedPost', 'post': {'\$ref': 'Post:123'}},
      {'__typename' : 'NestedPost', 'post': {'\$ref': 'Post:456'}},

    ],
  },
  'Post:123': {
    'id': '123',
    '__typename': 'Post',
  },
  'Post:456': {
    'id': '456',
    '__typename': 'Post',
  },

};

final _listPostDataDoubleNested = {
  'Query': {
    '__typename': 'Query',
    'posts': [
      {'__typename' : 'NestedPost', 'post': {'__typename' : 'DoubleNested', 'post' : {'\$ref' : 'Post:123'} }},
    ],
  },
  'Post:123': {
    'id': '123',
    '__typename': 'Post',
  },
  'Post:456': {
    'id': '456',
    '__typename': 'Post',
  },

};

final _listPostDataDoubleRefNested = {
  'Query': {
    '__typename': 'Query',
    'posts': [
      {'__typename' : 'NestedPost', 'post': {'\$ref': 'Post:123'}},
      {'__typename' : 'NestedPost', 'post': {'\$ref': 'Post:123'}},

    ],
  },
  'Post:123': {
    'id': '123',
    '__typename': 'Post',
  },
  'Post:456': {
    'id': '456',
    '__typename': 'Post',
  },

};



void main() {


  test('can find nodes which reference an id', () {


    final ids = nodesReferencingId(_postData.keys.toSet(),  (String id) => _postData[id], 'Post:123',);

    expect(ids, { PathNodeRef('Query', ['onePost' ]),});
  });

  test('can find nodes which indirectly reference an id', () {


    final ids = nodesReferencingId(_postData.keys.toSet(),  (String id) => _postData[id], 'Post:456',);

    expect(ids, { PathNodeRef('Query', ['onePost' ]),});


  });


  test('does not enter endless loop on circular references' ,() {

    nodesReferencingId(_circularPosts.keys.toSet(),  (String id) => _circularPosts[id], 'Post:456',);

  }, timeout: Timeout(Duration(seconds: 10)));


  test('can find references in lists', (){

    final ids = nodesReferencingId(_listPostData.keys.toSet(),  (String id) => _listPostData[id], 'Post:123',);

    expect(ids, { PathNodeRef('Query', ['posts', 0 ]),});

  });



  test('can find references in nested lists which are not normalized', () {


    final ids = nodesReferencingId(_listPostDataNested.keys.toSet(),  (String id) => _listPostDataNested[id], 'Post:123',);
    expect(ids, { PathNodeRef('Query', ['posts', 0, 'post' ]),});


  });



  test('can find references in nested lists which are normalized', () {


    //final ids = calculateEvictions('Post:123', read: (id) => _listPostDataNestedNormalized[id], cascadeMode: CascadeMode.all,);
    //expect(ids, {   EvictId('NestedPost:123'), EvictField('Query', 'posts'),});

    final ids = nodesReferencingId(_listPostDataNestedNormalized.keys.toSet(),  (String id) => _listPostDataNestedNormalized[id], 'Post:123',);
    expect(ids, { PathNodeRef('Query', ['posts', 0, 'post' ]),});


  });


  test('can find references in nested lists which is not normalized', () {


    //final ids = calculateEvictions('Post:123', read: (id) => _listPostDataNestedNormalized[id], cascadeMode: CascadeMode.untilList,);
    //expect(ids, { RemoveFromList('Query', ['posts'] , 0)});

    final ids = nodesReferencingId(_listPostDataNested.keys.toSet(),  (String id) => _listPostDataNested[id], 'Post:123',);

    expect(ids, { PathNodeRef('Query', ['posts', 0, 'post' ]),});

  });


  test('can find references in double nested lists which are not normalized', () {


    //final ids = calculateEvictions('Post:123', read: (id) => _listPostDataDoubleNested[id], cascadeMode: CascadeMode.untilList,);
    //expect(ids, { RemoveFromList('Query', ['posts'] , 0)});

    final ids = nodesReferencingId(_listPostDataDoubleNested.keys.toSet(),  (String id) => _listPostDataDoubleNested[id], 'Post:123',);
    expect(ids, { PathNodeRef('Query', ['posts', 0, 'post', 'post' ]),});

  });

  test('removes list items in reverse order', () {

   // final ids = calculateEvictions('Post:123', read: (id) => _listPostDataDoubleRefNested[id], cascadeMode: CascadeMode.untilList,);
   // expect(ids, { RemoveFromList('Query', ['posts'] , 1), RemoveFromList('Query', ['posts'] , 0)});

    final ids = nodesReferencingId(_listPostDataDoubleRefNested.keys.toSet(),  (String id) => _listPostDataDoubleRefNested[id], 'Post:123',);
    expect(ids, { PathNodeRef('Query', ['posts', 0, 'post' ]), PathNodeRef('Query', ['posts', 1, 'post' ]),});

  });

}