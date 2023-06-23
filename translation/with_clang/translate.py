import clang.cindex

clang.cindex.Config.set_library_file('/usr/local/lib/libclang.dylib')

def translate_ast(cursor):
    for c in cursor.get_children():
        print("_"*40)
        print(c.kind, c.spelling)
        print("spelling")
        print(c.spelling)
        print("\nchildren")
        print([a.kind for a in c.get_children()])
        if c.kind == clang.cindex.CursorKind.MEMBER_REF_EXPR:
            print("TODO")
        elif c.kind == clang.cindex.CursorKind.CXX_BOOL_LITERAL_EXPR:
            print("TODO")
        elif c.kind == clang.cindex.CursorKind.BINARY_OPERATOR:
            print("TODO")
        elif c.kind == clang.cindex.CursorKind.PACKED_ATTR:
            print("TODO")
        elif c.kind == clang.cindex.CursorKind.FIELD_DECL:
            print("TODO")
        elif c.kind == clang.cindex.CursorKind.CONDITIONAL_OPERATOR:
            print("TODO")
        elif c.kind == clang.cindex.CursorKind.UNARY_OPERATOR:
            print("TODO")
        elif c.kind == clang.cindex.CursorKind.DECL_REF_EXPR:
            print("TODO")
        elif c.kind == clang.cindex.CursorKind.CXX_UNARY_EXPR:
            print("TODO")
        elif c.kind == clang.cindex.CursorKind.TRANSLATION_UNIT:
            print("TODO")
        elif c.kind == clang.cindex.CursorKind.ENUM_CONSTANT_DECL:
            print("TODO")
        elif c.kind == clang.cindex.CursorKind.PARM_DECL:
            print("TODO")
        elif c.kind == clang.cindex.CursorKind.ARRAY_SUBSCRIPT_EXPR:
            print("TODO")
        elif c.kind == clang.cindex.CursorKind.CHARACTER_LITERAL:
            print("TODO")
        elif c.kind == clang.cindex.CursorKind.COMPOUND_STMT:
            print("TODO")
        elif c.kind == clang.cindex.CursorKind.TYPE_REF:
            print("TODO")
        elif c.kind == clang.cindex.CursorKind.WHILE_STMT:
            print("TODO")
        elif c.kind == clang.cindex.CursorKind.CSTYLE_CAST_EXPR:
            print("TODO")
        elif c.kind == clang.cindex.CursorKind.DECL_STMT:
            print("TODO")
        elif c.kind == clang.cindex.CursorKind.ASM_LABEL_ATTR:
            print("TODO")
        elif c.kind == clang.cindex.CursorKind.UNION_DECL:
            print("TODO")
        elif c.kind == clang.cindex.CursorKind.UNEXPOSED_DECL:
            print("TODO")
        elif c.kind == clang.cindex.CursorKind.CONST_ATTR:
            print("TODO")
        elif c.kind == clang.cindex.CursorKind.VISIBILITY_ATTR:
            print("TODO")
        elif c.kind == clang.cindex.CursorKind.WARN_UNUSED_RESULT_ATTR:
            print("TODO")
        elif c.kind == clang.cindex.CursorKind.STRING_LITERAL:
            print("TODO")
        elif c.kind == clang.cindex.CursorKind.UNEXPOSED_EXPR:
            print("TODO")
        elif c.kind == clang.cindex.CursorKind.VAR_DECL:
            print("TODO")
        elif c.kind == clang.cindex.CursorKind.TYPEDEF_DECL:
            print("TODO")
        elif c.kind == clang.cindex.CursorKind.RETURN_STMT:
            print("TODO")
        elif c.kind == clang.cindex.CursorKind.NAMESPACE:
            print("TODO")
        elif c.kind == clang.cindex.CursorKind.ENUM_DECL:
            print("TODO")
        elif c.kind == clang.cindex.CursorKind.INTEGER_LITERAL:
            print("TODO")
        elif c.kind == clang.cindex.CursorKind.CALL_EXPR:
            print("TODO")
        elif c.kind == clang.cindex.CursorKind.OVERLOADED_DECL_REF:
            print("TODO")
        elif c.kind == clang.cindex.CursorKind.PAREN_EXPR:
            print("TODO")
        elif c.kind == clang.cindex.CursorKind.GNU_NULL_EXPR:
            print("TODO")
        elif c.kind == clang.cindex.CursorKind.COMPOUND_ASSIGNMENT_OPERATOR:
            print("TODO")
        elif c.kind == clang.cindex.CursorKind.STRUCT_DECL:
            print("TODO")
        elif c.kind == clang.cindex.CursorKind.FUNCTION_DECL:
            # these should get mapped to actions
            # arguments and return types should agree
            ret_type = c.result_type.kind
            function_name = c.spelling
            returns_string = None
            if ret_type == clang.cindex.TypeKind.VOID:
                returns_string = ""
            elif ret_type == clang.cindex.TypeKind.POINTER:
                print("whoops. don't know how to handle this")
                exit(1)
            else:
                # should be careful about what return types we allow
                returns_string = f" returns (<new_variable>:{c.result_type.spelling})"
            params = [a.spelling + ":" + a.type.spelling for a in c.get_children() if a.kind == clang.cindex.CursorKind.PARM_DECL]
            params_string = ", ".join(params)
            signature = f"action {function_name}({params_string}){returns_string}"
            function_body = translate_ast(list(c.get_children())[-1]) # assuming the nonparamdecl is at idx = -1
            if function_body is None:
                # this is a placeholder while other stuff is being implemented
                function_body = "\tNot implemented"
            print(signature + " = {\n" + function_body + "\n}")
        elif c.kind == clang.cindex.CursorKind.IF_STMT:
            conditional = translate_ast(list(c.get_children())[0])
            if conditional is None:
                conditional = list(c.get_children())[0].kind
            if_case = translate_ast(list(c.get_children())[1])
            if if_case is None:
                if_case = list(c.get_children())[1].kind
            else_case = translate_ast(list(c.get_children())[2])
            if else_case is None:
                else_case = list(c.get_children())[2].kind
            print(f"if ({conditional}) {{\n{if_case}\n}} else {{\n{else_case}\n}}")
        elif c.kind == clang.cindex.CursorKind.UNEXPOSED_ATTR:
            print("TODO")
        else:
            translate_ast(c)

index = clang.cindex.Index.create()
tu = index.parse('test.cpp')
translate_ast(tu.cursor)

# Use this to get AST then port to OCaml for translation
