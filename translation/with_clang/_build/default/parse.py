import clang.cindex

# Point it to the location of your libclang library file
clang.cindex.Config.set_library_file('/usr/local/lib/libclang.dylib')

# A set to store the unique kinds of language constructs
constructs = set()

def print_ast(cursor, tab=''):
    constructs.add(str(cursor.kind))  # add the construct kind to the set
    print(tab + str(cursor.kind), cursor.spelling)
    for c in cursor.get_children():
        print_ast(c, tab + '\t')

index = clang.cindex.Index.create()
tu = index.parse('test.cpp')
print_ast(tu.cursor)

# Print the unique constructs at the end
print("\nUnique language constructs:")
for construct in constructs:
    print(construct)
