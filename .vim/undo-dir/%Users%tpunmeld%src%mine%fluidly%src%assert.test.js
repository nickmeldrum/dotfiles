Vim�UnDo� ��N��[8�#hZ���U$}|)m��3g�J{�2   �   ,        new RegExp(`^${message}Expected $`),   }   (                       [��    _�                     w        ����                                                                                                                                                                                                                                                                                                                                                             [���     �   w   y   y    �   w   x   y    5�_�                    w       ����                                                                                                                                                                                                                                                                                                                                                             [���     �   w   y   z    5�_�                    w       ����                                                                                                                                                                                                                                                                                                                                                             [���     �   w   z   |          �   w   y   {    5�_�                    y        ����                                                                                                                                                                                                                                                                                                                                                             [���     �   x   z              tit5�_�                    y       ����                                                                                                                                                                                                                                                                                                                                                             [���     �   z   |           �   y   {           �   x   z           �   y   |   }    �   x   z              5�_�                    y       ����                                                                                                                                                                                                                                                                                                                            y          y          v       [���     �   x   z             it('description', () => {5�_�                    y       ����                                                                                                                                                                                                                                                                                                                            y          y          v       [���     �   x   z             it('zz', () => {5�_�      	              y       ����                                                                                                                                                                                                                                                                                                                            y          y          v       [���     �   x   z         +    it('missing prop should show ', () => {�   y   z       5�_�                 	   y   !    ����                                                                                                                                                                                                                                                                                                                            y          y          v       [���     �   x   z         +    it("missing prop should show ", () => {5�_�   	      
          z        ����                                                                                                                                                                                                                                                                                                                            z           z           V        [��      �   y   ~   ~    �   z   {   ~    �   y   z          
      body5�_�                    |   (    ����                                                                                                                                                                                                                                                                                                                            |   (       |   A       v   A    [��     �   {   }   �      F        new RegExp(`^${message}Expected array length 2 but found 3$`),5�_�                            ����                                                                                                                                                                                                                                                                                                                            |   (       |   A       v   A    [��F     �         �    �         �    5�_�                    |   )    ����                                                                                                                                                                                                                                                                                                                            |   )       |   -       v   -    [��M     �   {   }   �      J      expect(() => assertEquals(message, [1, 2], [1, 2, 3])).toThrowError(5�_�                    |   *    ����                                                                                                                                                                                                                                                                                                                            |   )       |   -       v   -    [��N     �   {   }   �      E      expect(() => assertEquals(message, ], [1, 2, 3])).toThrowError(5�_�                    |   )    ����                                                                                                                                                                                                                                                                                                                            |   )       |   -       v   -    [��_     �   {   }   �      D      expect(() => assertEquals(message, , [1, 2, 3])).toThrowError(5�_�                    |   B    ����                                                                                                                                                                                                                                                                                                                            |   )       |   -       v   -    [��d     �   {   }   �      [      expect(() => assertEquals(message, testData.complexObject1, [1, 2, 3])).toThrowError(5�_�                    �        ����                                                                                                                                                                                                                                                                                                                            �           �   3       V   X    [��l     �      �              3 *  Test 08: Expected propB.propC but was not found5�_�                    }   (    ����                                                                                                                                                                                                                                                                                                                            �           �   3       V   X    [��     �   |   ~   �      ,        new RegExp(`^${message}Expected $`),5�_�                     |   E    ����                                                                                                                                                                                                                                                                                                                            �           �   3       V   X    [��    �   �   �          })�      �            })�   ~   �              })�   }                   )�   |   ~          I        new RegExp(`^${message}Expected propB.propC but was not found$`),�   {   }          i      expect(() => assertEquals(message, testData.complexObject1, testData.complexObject3)).toThrowError(�   z   |                const message = 'yah'�   y   {          S    it("missing prop should show 'Expected propB.propC but was not found'", () => {�   x   z           �   w   y              })�   v   x                )�   u   w          F        new RegExp(`^${message}Expected array length 2 but found 3$`),�   t   v          J      expect(() => assertEquals(message, [1, 2], [1, 2, 3])).toThrowError(�   s   u                const message = 'yah'�   r   t          r    it("array length failure should show 'Expected array length n but found m' concatenated onto message", () => {�   q   s           �   p   r              })�   o   q                )�   n   p          9        `${message}Expected type Array but found Object`,�   m   o          ?      expect(() => assertEquals(message, [], {})).toThrowError(�   l   n                const message = 'boo'�   k   m          s    it("type compare failure should show 'Expected type Array but found Object' concatenated onto message", () => {�   j   l           �   i   k              })�   h   j                )�   g   i          2        `${message}Expected "abcdef" found "abc"`,�   f   h          H      expect(() => assertEquals(message, 'abcdef', 'abc')).toThrowError(�   e   g          )      const message = 'some test message'�   d   f          k    test('string compare failure should show \'Expected "a" found "b"\' concatenated onto message', () => {�   c   e           �   b   d              })�   a   c          P      expect(() => assertEquals(message, 'abcdef', 'abc')).toThrowError(message)�   `   b          )      const message = 'some test message'�   _   a          U    test('a failed assertion should throw the assertion message given to it', () => {�   ^   `          '  describe('assertion message', () => {�   ]   _           �   \   ^            })�   [   ]          :    shouldFail([{ foo: 'bar' }, {}], [{}, { foo: 'bar' }])�   Z   \          8    shouldFail({ foo: [1, 'bat'] }, { foo: [1, 'bar'] })�   Y   [           �   X   Z          F    shouldFail({ foo: { foot: 'feet' } }, { foo: { foot: 'baaaaa' } })�   W   Y          D    shouldPass({ foo: { foot: 'feet' } }, { foo: { foot: 'feet' } })�   V   X           �   U   W          /    shouldFail({ foo: 'bar' }, { foo: 'bart' })�   T   V          "    shouldFail({ foo: 'bar' }, {})�   S   U          .    shouldPass({ foo: 'bar' }, { foo: 'bar' })�   R   T              shouldPass({}, {})�   Q   S            describe('objects', () => {�   P   R           �   O   Q            })�   N   P          U    shouldFail([1, [true, 'thing', ['foo', 42]]], [1, [true, 'thing', ['foot', 42]]])�   M   O          T    shouldPass([1, [true, 'thing', ['foo', 42]]], [1, [true, 'thing', ['foo', 42]]])�   L   N          &    shouldFail([1, 2, 3], [1, 3, '3'])�   K   M          0    shouldPass([1, 2, 'three'], [1, 2, 'three'])�   J   L              shouldPass([1], [1])�   I   K              shouldFail([1], [2])�   H   J              shouldFail([1], [])�   G   I              shouldPass([], [])�   F   H            describe('arrays', () => {�   E   G           �   D   F            })�   C   E              shouldFail(true, () => {})�   B   D              shouldFail(true, {})�   A   C              shouldFail(true, [])�   @   B              shouldFail(1, '1')�   ?   A              shouldFail(true, 'true')�   >   @              shouldFail(false, 0)�   =   ?              shouldFail(true, 1)�   <   >          "  describe('truthy/falsy', () => {�   ;   =           �   :   <            })�   9   ;              shouldFail(true, false)�   8   :              shouldPass(false, false)�   7   9              shouldPass(true, true)�   6   8            describe('booleans', () => {�   5   7           �   4   6            })�   3   5              shouldFail(NaN, Infinity)�   2   4          #    shouldFail(undefined, Infinity)�   1   3              shouldFail(undefined, NaN)�   0   2              shouldFail(null, Infinity)�   /   1              shouldFail(null, NaN)�   .   0              shouldFail(null, undefined)�   -   /           �   ,   .          "    shouldPass(Infinity, Infinity)�   +   -              shouldPass(NaN, NaN)�   *   ,          $    shouldPass(undefined, undefined)�   )   +              shouldPass(null, null)�   (   *          %  describe('special objects', () => {�   '   )           �   &   (            })�   %   '              shouldFail(1, 2)�   $   &              shouldPass(1, 1)�   #   %            describe('numbers', () => {�   "   $           �   !   #            })�       "              shouldFail('abcdef', 'abc')�      !              shouldPass('abc', 'abc')�                   describe('strings', () => {�                 �                  }�                    })�                [      expect(() => assertEquals(testDescription, expected, actual)).toThrow(AssertionError)�                !    test(testDescription, () => {�                E    const testDescription = makeDescription(expected, actual, 'fail')�                ,  const shouldFail = (expected, actual) => {�                 �                  }�                    })�                _      expect(() => assertEquals(testDescription, expected, actual)).not.toThrow(AssertionError)�                !    test(testDescription, () => {�                E    const testDescription = makeDescription(expected, actual, 'pass')�                ,  const shouldPass = (expected, actual) => {�                 �                \    `${stringFromVariable(expected)} and ${stringFromVariable(actual)} should ${passOrFail}`�                ;  const makeDescription = (expected, actual, passOrFail) =>�                  }�                #    return JSON.stringify(variable)�   
             a    if (typeof variable === 'boolean' || typeof variable === 'number') return variable.toString()�   	             G    if (typeof variable === 'string') return `"${variable.toString()}"`�      
          @    if (Array.isArray(variable)) return JSON.stringify(variable)�      	          2    if (variable === undefined) return 'undefined'�                (    if (variable === null) return 'null'�                *  const stringFromVariable = variable => {�                 describe('assertEquals', () => {�                 �                'const testData = require('./test-data')�                (const assertEquals = require('./assert')�                 3const AssertionError = require('./assertion-error')5�_�   	             
   s        ����                                                                                                                                                                                                                                                                                                                            s          s          V   H    [���     �   r   w        5�_�   
                  t        ����                                                                                                                                                                                                                                                                                                                            s          s          V   H    [���     �   t   u   {    �   t   u   {            const message = 'yah'   J      expect(() => assertEquals(message, [1, 2], [1, 2, 3])).toThrowError(   F        new RegExp(`^${message}Expected array length 2 but found 3$`),         )5��