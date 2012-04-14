'' Title: ext/preprocessor/tuple/foreachi.bi
''  This file is part of the <ext/Preprocessor> library API, and can be
''  directly included by user programs.
''
'' About: License
''  Copyright (c) 2007-2011, FreeBASIC Extended Library Development Group
''  Copyright (c) 2002, Paul Mensonides
''
''  Distributed under the Boost Software License, Version 1.0. See
''  accompanying file LICENSE_1_0.txt or copy at
''  http://www.boost.org/LICENSE_1_0.txt)
''
''  Distributed under the FreeBASIC Extended Library Group license. See
''  accompanying file LICENSE.txt or copy at
''  http://code.google.com/p/fb-extended-lib/wiki/License

# pragma once
# ifndef FBEXT_INCLUDED_PP_TUPLE_FOREACHI_BI__
# define FBEXT_INCLUDED_PP_TUPLE_FOREACHI_BI__ -1

# include once "ext/preprocessor/tuple/remparens.bi"

# define FBEXT_PP_TUPLE_FOREACHI(size, tuple, m) fbextPP_TupleForEachI(size, tuple, m)

'' Macro: fbextPP_TupleForEachI
''  repeatedly expands the user-defined macro *m*, passing it, in order, each
''  element stored in the tuple *tuple* of size *size* along with the element's
''  position in the tuple.
''
''  For example, if *size* is `3`, *tuple* is `(a,b,c)` and *m* is the name of
''  the macro,
''      : # define M(n, elem) [elem##n]
''  then this macro expands to `[a0] [b1] [c2]`.
''
'' Parameters:
''  size - is the count of elements in the tuple.
''  tuple - is the tuple which stores the element to retrieve.
''  m - is the name of the user-defined macro to expand.
# define fbextPP_TupleForEachI(size, tuple, m) _
    _fbextPP_TupleForEachI__##size (m, fbextPP_TupleRemParens(size, tuple))

# define _fbextPP_TupleForEachI__1(m, __0) m(0, __0)
# define _fbextPP_TupleForEachI__2(m, __0, __1) m(0, __0) m(1, __1)
# define _fbextPP_TupleForEachI__3(m, __0, __1, __2) m(0, __0) m(1, __1) m(2, __2)
# define _fbextPP_TupleForEachI__4(m, __0, __1, __2, __3) m(0, __0) m(1, __1) m(2, __2) m(3, __3)
# define _fbextPP_TupleForEachI__5(m, __0, __1, __2, __3, __4) m(0, __0) m(1, __1) m(2, __2) m(3, __3) m(4, __4)
# define _fbextPP_TupleForEachI__6(m, __0, __1, __2, __3, __4, __5) m(0, __0) m(1, __1) m(2, __2) m(3, __3) m(4, __4) m(5, __5)
# define _fbextPP_TupleForEachI__7(m, __0, __1, __2, __3, __4, __5, __6) m(0, __0) m(1, __1) m(2, __2) m(3, __3) m(4, __4) m(5, __5) m(6, __6)
# define _fbextPP_TupleForEachI__8(m, __0, __1, __2, __3, __4, __5, __6, __7) m(0, __0) m(1, __1) m(2, __2) m(3, __3) m(4, __4) m(5, __5) m(6, __6) m(7, __7)
# define _fbextPP_TupleForEachI__9(m, __0, __1, __2, __3, __4, __5, __6, __7, __8) m(0, __0) m(1, __1) m(2, __2) m(3, __3) m(4, __4) m(5, __5) m(6, __6) m(7, __7) m(8, __8)
# define _fbextPP_TupleForEachI__10(m, __0, __1, __2, __3, __4, __5, __6, __7, __8, __9) m(0, __0) m(1, __1) m(2, __2) m(3, __3) m(4, __4) m(5, __5) m(6, __6) m(7, __7) m(8, __8) m(9, __9)
# define _fbextPP_TupleForEachI__11(m, __0, __1, __2, __3, __4, __5, __6, __7, __8, __9, __10) m(0, __0) m(1, __1) m(2, __2) m(3, __3) m(4, __4) m(5, __5) m(6, __6) m(7, __7) m(8, __8) m(9, __9) m(10, __10)
# define _fbextPP_TupleForEachI__12(m, __0, __1, __2, __3, __4, __5, __6, __7, __8, __9, __10, __11) m(0, __0) m(1, __1) m(2, __2) m(3, __3) m(4, __4) m(5, __5) m(6, __6) m(7, __7) m(8, __8) m(9, __9) m(10, __10) m(11, __11)
# define _fbextPP_TupleForEachI__13(m, __0, __1, __2, __3, __4, __5, __6, __7, __8, __9, __10, __11, __12) m(0, __0) m(1, __1) m(2, __2) m(3, __3) m(4, __4) m(5, __5) m(6, __6) m(7, __7) m(8, __8) m(9, __9) m(10, __10) m(11, __11) m(12, __12)
# define _fbextPP_TupleForEachI__14(m, __0, __1, __2, __3, __4, __5, __6, __7, __8, __9, __10, __11, __12, __13) m(0, __0) m(1, __1) m(2, __2) m(3, __3) m(4, __4) m(5, __5) m(6, __6) m(7, __7) m(8, __8) m(9, __9) m(10, __10) m(11, __11) m(12, __12) m(13, __13)
# define _fbextPP_TupleForEachI__15(m, __0, __1, __2, __3, __4, __5, __6, __7, __8, __9, __10, __11, __12, __13, __14) m(0, __0) m(1, __1) m(2, __2) m(3, __3) m(4, __4) m(5, __5) m(6, __6) m(7, __7) m(8, __8) m(9, __9) m(10, __10) m(11, __11) m(12, __12) m(13, __13) m(14, __14)
# define _fbextPP_TupleForEachI__16(m, __0, __1, __2, __3, __4, __5, __6, __7, __8, __9, __10, __11, __12, __13, __14, __15) m(0, __0) m(1, __1) m(2, __2) m(3, __3) m(4, __4) m(5, __5) m(6, __6) m(7, __7) m(8, __8) m(9, __9) m(10, __10) m(11, __11) m(12, __12) m(13, __13) m(14, __14) m(15, __15)
# define _fbextPP_TupleForEachI__17(m, __0, __1, __2, __3, __4, __5, __6, __7, __8, __9, __10, __11, __12, __13, __14, __15, __16) m(0, __0) m(1, __1) m(2, __2) m(3, __3) m(4, __4) m(5, __5) m(6, __6) m(7, __7) m(8, __8) m(9, __9) m(10, __10) m(11, __11) m(12, __12) m(13, __13) m(14, __14) m(15, __15) m(16, __16)
# define _fbextPP_TupleForEachI__18(m, __0, __1, __2, __3, __4, __5, __6, __7, __8, __9, __10, __11, __12, __13, __14, __15, __16, __17) m(0, __0) m(1, __1) m(2, __2) m(3, __3) m(4, __4) m(5, __5) m(6, __6) m(7, __7) m(8, __8) m(9, __9) m(10, __10) m(11, __11) m(12, __12) m(13, __13) m(14, __14) m(15, __15) m(16, __16) m(17, __17)
# define _fbextPP_TupleForEachI__19(m, __0, __1, __2, __3, __4, __5, __6, __7, __8, __9, __10, __11, __12, __13, __14, __15, __16, __17, __18) m(0, __0) m(1, __1) m(2, __2) m(3, __3) m(4, __4) m(5, __5) m(6, __6) m(7, __7) m(8, __8) m(9, __9) m(10, __10) m(11, __11) m(12, __12) m(13, __13) m(14, __14) m(15, __15) m(16, __16) m(17, __17) m(18, __18)
# define _fbextPP_TupleForEachI__20(m, __0, __1, __2, __3, __4, __5, __6, __7, __8, __9, __10, __11, __12, __13, __14, __15, __16, __17, __18, __19) m(0, __0) m(1, __1) m(2, __2) m(3, __3) m(4, __4) m(5, __5) m(6, __6) m(7, __7) m(8, __8) m(9, __9) m(10, __10) m(11, __11) m(12, __12) m(13, __13) m(14, __14) m(15, __15) m(16, __16) m(17, __17) m(18, __18) m(19, __19)
# define _fbextPP_TupleForEachI__21(m, __0, __1, __2, __3, __4, __5, __6, __7, __8, __9, __10, __11, __12, __13, __14, __15, __16, __17, __18, __19, __20) m(0, __0) m(1, __1) m(2, __2) m(3, __3) m(4, __4) m(5, __5) m(6, __6) m(7, __7) m(8, __8) m(9, __9) m(10, __10) m(11, __11) m(12, __12) m(13, __13) m(14, __14) m(15, __15) m(16, __16) m(17, __17) m(18, __18) m(19, __19) m(20, __20)
# define _fbextPP_TupleForEachI__22(m, __0, __1, __2, __3, __4, __5, __6, __7, __8, __9, __10, __11, __12, __13, __14, __15, __16, __17, __18, __19, __20, __21) m(0, __0) m(1, __1) m(2, __2) m(3, __3) m(4, __4) m(5, __5) m(6, __6) m(7, __7) m(8, __8) m(9, __9) m(10, __10) m(11, __11) m(12, __12) m(13, __13) m(14, __14) m(15, __15) m(16, __16) m(17, __17) m(18, __18) m(19, __19) m(20, __20) m(21, __21)
# define _fbextPP_TupleForEachI__23(m, __0, __1, __2, __3, __4, __5, __6, __7, __8, __9, __10, __11, __12, __13, __14, __15, __16, __17, __18, __19, __20, __21, __22) m(0, __0) m(1, __1) m(2, __2) m(3, __3) m(4, __4) m(5, __5) m(6, __6) m(7, __7) m(8, __8) m(9, __9) m(10, __10) m(11, __11) m(12, __12) m(13, __13) m(14, __14) m(15, __15) m(16, __16) m(17, __17) m(18, __18) m(19, __19) m(20, __20) m(21, __21) m(22, __22)
# define _fbextPP_TupleForEachI__24(m, __0, __1, __2, __3, __4, __5, __6, __7, __8, __9, __10, __11, __12, __13, __14, __15, __16, __17, __18, __19, __20, __21, __22, __23) m(0, __0) m(1, __1) m(2, __2) m(3, __3) m(4, __4) m(5, __5) m(6, __6) m(7, __7) m(8, __8) m(9, __9) m(10, __10) m(11, __11) m(12, __12) m(13, __13) m(14, __14) m(15, __15) m(16, __16) m(17, __17) m(18, __18) m(19, __19) m(20, __20) m(21, __21) m(22, __22) m(23, __23)
# define _fbextPP_TupleForEachI__25(m, __0, __1, __2, __3, __4, __5, __6, __7, __8, __9, __10, __11, __12, __13, __14, __15, __16, __17, __18, __19, __20, __21, __22, __23, __24) m(0, __0) m(1, __1) m(2, __2) m(3, __3) m(4, __4) m(5, __5) m(6, __6) m(7, __7) m(8, __8) m(9, __9) m(10, __10) m(11, __11) m(12, __12) m(13, __13) m(14, __14) m(15, __15) m(16, __16) m(17, __17) m(18, __18) m(19, __19) m(20, __20) m(21, __21) m(22, __22) m(23, __23) m(24, __24)
# define _fbextPP_TupleForEachI__26(m, __0, __1, __2, __3, __4, __5, __6, __7, __8, __9, __10, __11, __12, __13, __14, __15, __16, __17, __18, __19, __20, __21, __22, __23, __24, __25) m(0, __0) m(1, __1) m(2, __2) m(3, __3) m(4, __4) m(5, __5) m(6, __6) m(7, __7) m(8, __8) m(9, __9) m(10, __10) m(11, __11) m(12, __12) m(13, __13) m(14, __14) m(15, __15) m(16, __16) m(17, __17) m(18, __18) m(19, __19) m(20, __20) m(21, __21) m(22, __22) m(23, __23) m(24, __24) m(25, __25)
# define _fbextPP_TupleForEachI__27(m, __0, __1, __2, __3, __4, __5, __6, __7, __8, __9, __10, __11, __12, __13, __14, __15, __16, __17, __18, __19, __20, __21, __22, __23, __24, __25, __26) m(0, __0) m(1, __1) m(2, __2) m(3, __3) m(4, __4) m(5, __5) m(6, __6) m(7, __7) m(8, __8) m(9, __9) m(10, __10) m(11, __11) m(12, __12) m(13, __13) m(14, __14) m(15, __15) m(16, __16) m(17, __17) m(18, __18) m(19, __19) m(20, __20) m(21, __21) m(22, __22) m(23, __23) m(24, __24) m(25, __25) m(26, __26)
# define _fbextPP_TupleForEachI__28(m, __0, __1, __2, __3, __4, __5, __6, __7, __8, __9, __10, __11, __12, __13, __14, __15, __16, __17, __18, __19, __20, __21, __22, __23, __24, __25, __26, __27) m(0, __0) m(1, __1) m(2, __2) m(3, __3) m(4, __4) m(5, __5) m(6, __6) m(7, __7) m(8, __8) m(9, __9) m(10, __10) m(11, __11) m(12, __12) m(13, __13) m(14, __14) m(15, __15) m(16, __16) m(17, __17) m(18, __18) m(19, __19) m(20, __20) m(21, __21) m(22, __22) m(23, __23) m(24, __24) m(25, __25) m(26, __26) m(27, __27)
# define _fbextPP_TupleForEachI__29(m, __0, __1, __2, __3, __4, __5, __6, __7, __8, __9, __10, __11, __12, __13, __14, __15, __16, __17, __18, __19, __20, __21, __22, __23, __24, __25, __26, __27, __28) m(0, __0) m(1, __1) m(2, __2) m(3, __3) m(4, __4) m(5, __5) m(6, __6) m(7, __7) m(8, __8) m(9, __9) m(10, __10) m(11, __11) m(12, __12) m(13, __13) m(14, __14) m(15, __15) m(16, __16) m(17, __17) m(18, __18) m(19, __19) m(20, __20) m(21, __21) m(22, __22) m(23, __23) m(24, __24) m(25, __25) m(26, __26) m(27, __27) m(28, __28)
# define _fbextPP_TupleForEachI__30(m, __0, __1, __2, __3, __4, __5, __6, __7, __8, __9, __10, __11, __12, __13, __14, __15, __16, __17, __18, __19, __20, __21, __22, __23, __24, __25, __26, __27, __28, __29) m(0, __0) m(1, __1) m(2, __2) m(3, __3) m(4, __4) m(5, __5) m(6, __6) m(7, __7) m(8, __8) m(9, __9) m(10, __10) m(11, __11) m(12, __12) m(13, __13) m(14, __14) m(15, __15) m(16, __16) m(17, __17) m(18, __18) m(19, __19) m(20, __20) m(21, __21) m(22, __22) m(23, __23) m(24, __24) m(25, __25) m(26, __26) m(27, __27) m(28, __28) m(29, __29)

# endif ' include guard
