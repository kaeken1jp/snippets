https://pypi.org/project/jaconv/


# sample
```py
import jaconv

# Hiragana to Katakana
jaconv.hira2kata(u'ともえまみ')
# => u'トモエマミ'

# Hiragana to half-width Katakana
jaconv.hira2hkata(u'ともえまみ')
# => u'ﾄﾓｴﾏﾐ'

# Katakana to Hiragana
jaconv.kata2hira(u'巴マミ')
# => u'巴まみ'

# half-width character to full-width character
jaconv.h2z(u'ﾃｨﾛ･ﾌｨﾅｰﾚ')
# => u'ティロ･フィナーレ'

# half-width character to full-width character
# but only ascii characters
jaconv.h2z(u'abc', ascii=True)
# => u'ａｂｃ'

# half-width character to full-width character
# but only digit characters
jaconv.h2z(u'123', digit=True)
# => u'１２３'

# half-width character to full-width character
# except half-width Katakana
jaconv.h2z(u'ｱabc123', kana=False, digit=True, ascii=True)
# => u'ｱａｂｃ１２３'

# full-width character to half-width character
jaconv.z2h(u'ティロ・フィナーレ')
# => u'ﾃｨﾛ・ﾌｨﾅｰﾚ'

# full-width character to half-width character
# but only ascii characters
jaconv.z2h(u'ａｂｃ', ascii=True)
# => u'abc'

# full-width character to half-width character
# but only digit characters
jaconv.z2h(u'１２３', digit=True)
# => u'123'

# full-width character to half-width character
# except full-width Katakana
jaconv.z2h(u'アａｂｃ１２３', kana=False, digit=True, ascii=True)
# => u'アabc123'

# normalize
jaconv.normalize(u'ティロ･フィナ〜レ', 'NFKC')
# => u'ティロ・フィナーレ'

# Hiragana to alphabet
jaconv.kana2alphabet(u'じゃぱん')
# => japan

# Alphabet to Hiragana
jaconv.alphabet2kana(u'japan')
# => じゃぱん
```
