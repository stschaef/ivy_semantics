#!/usr/bin/env python3

import clang.cindex
import json

def cursor_to_dict(cursor):
    return {
        'kind': str(cursor.kind),
        'spelling': cursor.spelling,
        'location': str(cursor.location),
        'type': str(cursor.type.kind),
        'tokens': [t.spelling for t in cursor.get_tokens()],
        'children': [cursor_to_dict(c) for c in cursor.get_children()]
    }

def serialize_ast(source_file):
    index = clang.cindex.Index.create()
    tu = index.parse(source_file)
    ast_dict = cursor_to_dict(tu.cursor)
    with open('ast.json', 'w') as f:
        json.dump(ast_dict, f, indent=2)

serialize_ast('test.cpp')
