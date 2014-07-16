sy case ignore

sy keyword Keyword select from lateral view left right full outer semi join on where group by having limit cluster distribute sort order asc desc union all
sy keyword Keyword transform using as map reduce
sy keyword Keyword insert overwrite partition
sy keyword Keyword table database schema index use
sy keyword Keyword drop if exists restrict cascade
sy keyword Keyword create external partitioned clustered sorted into buckets skewed stored directories
sy keyword Keyword comment location with dbproperties tblproperties
sy keyword Keyword row format delimited fields terminated escaped collection items keys lines defined serde serdeproperties
sy keyword Keyword sequencefile textfile rcfile orc inputformat outputformat
sy keyword Keyword alter owner user role rename to archive unarchive fileformat enable disable no_drop offline touch change column replace columns first after
sy keyword Keyword array struct uniontype
sy keyword Keyword mapjoin streamtable
sy keyword Keyword explain
sy keyword Keyword msck repair
sy keyword Keyword show describe databases schemas tables partitions locks functions extended formatted
sy keyword Keyword deferred rebuild idxproperties
sy keyword Keyword temporary function

if !exists("hive_version") || hive_version >= 11
    sy keyword Keyword truncate
endif

if !exists("hive_version") || hive_version >= 12
    sy keyword Keyword exchange
endif

if !exists("hive_version") || hive_version >= 13
    sy keyword Keyword transactions compactions compact jar file
endif

sy keyword Operator between and or is not like rlike regexp exists in
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

sy match Comment +--.*+

sy region PreProc start="/\*+" end="\*/" 

sy match Keyword +\<set\>+
sy match hiveSet +^set\s[^;]*;+ nextgroup=hiveSetKw contains=hiveSetKw,hiveSetWs,hiveSetVar,hiveSetEq,hiveSetVal
sy keyword hiveSetKw set nextgroup=hiveSetWs contained
sy match hiveSetWs +\s\++ nextgroup=hiveSetVar contained
sy match hiveSetVar +[^= ]*+ nextgroup=hiveSetEq contained
sy match hiveSetEq +\s*=\s*+ nextgroup=hiveSetVal contained
sy match hiveSetVal +[^;]*+ contained contains=Identifier

sy match Keyword +\<add\>+
sy match hiveAdd +^add\s[^;]*;+ nextgroup=hiveAddKw contains=hiveAddKw,hiveAddWs,hiveAddPath
sy keyword hiveAddKw add file nextgroup=hiveAddWs contained
sy match hiveAddWs +\s\++ nextgroup=hiveAddKw,hiveAddPath contained
sy match hiveAddPath +[^;]\++ contained

sy region hiveQuote start=+`+ end=+`+

hi link hiveSetKw Keyword
hi link hiveSetVar Identifier
hi link hiveSetVal String

hi link hiveAddKw Keyword
hi link hiveAddPath String
