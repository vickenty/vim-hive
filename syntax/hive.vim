sy case ignore

sy keyword Keyword select from lateral view left right full outer semi join on where group by having limit cluster distribute sort order asc desc union all
sy keyword Keyword transform using as map reduce
sy keyword Keyword insert overwrite partition
sy keyword Keyword table database schema use
sy keyword Keyword drop if exists restrict cascade
sy keyword Keyword create external partitioned clustered sorted into buckets set skewed stored directories
sy keyword Keyword comment location with dbproperties tblproperties
sy keyword Keyword row format delimited fields terminated escaped collection items keys lines defined serde serdeproperties
sy keyword Keyword sequencefile textfile rcfile orc inputformat outputformat
sy keyword Keyword alter owner user role
sy keyword Keyword array struct uniontype
sy keyword Keyword mapjoin streamtable
sy keyword Keyword add explain

sy keyword Operator between and or is not like rlike regexp exists
sy keyword Conditional case when then else end

sy keyword Type int tinyint smallint bigint float double decimal
sy keyword Type timestamp date
sy keyword Type string varchar char
sy keyword Type boolean binary

sy region String start=+'+ skip=+\\'+ end=+'+ contains=Identifier
sy region String start=+"+ skip=+\\"+ end=+"+ contains=Identifier

sy match Number +\<[0-9]\++
sy match Float +\<[0-9]\+\.[0-9]\++

sy keyword Constant null

sy match Identifier +\${[^}]*}+

sy match Comment +-- .*+
sy region Comment start=+/\*+ end=+\*/+

sy region PreProc start="/\*+" end="\*/" 

sy match hiveSet +^set\s[^;]*;+ nextgroup=hiveSetKw contains=hiveSetKw,hiveSetWs,hiveSetVar,hiveSetEq,hiveSetVal
sy keyword hiveSetKw set nextgroup=hiveSetWs
sy match hiveSetWs +\s\++ nextgroup=hiveSetVar contained
sy match hiveSetVar +[^= ]*+ nextgroup=hiveSetEq contained
sy match hiveSetEq +\s*=\s*+ nextgroup=hiveSetVal contained
sy match hiveSetVal +[^;]*+ contained contains=Identifier

sy match hiveAdd +^add\s[^;]*;+ nextgroup=hiveAddKw contains=hiveAddKw,hiveAddWs,hiveAddPath
sy keyword hiveAddKw add file nextgroup=hiveAddWs contained
sy match hiveAddWs + \++ nextgroup=hiveAddKw,hiveAddPath contained
sy match hiveAddPath +[^;]\++ contained

sy region hiveQuote start=+`+ end=+`+

hi link hiveSetKw Keyword
hi link hiveSetVar Identifier
hi link hiveSetVal String

hi link hiveAddKw Keyword
hi link hiveAddPath String
