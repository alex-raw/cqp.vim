" Language: Corpus Query Processor
" Maintainer: Alexander Rauhut

if exists("b:current_syntax")
    finish
endif

syn region cqpStatement start=";" end=";" contains=ALL

syn keyword cqpCommand info cat group count exit discard delete join
            \ subset save show sort sleep reduce size
            \ dump undump tabulate randomize diff difference inter intersect
            \ intersection union define

syn keyword cqpBuiltinFunction f distance dist distabs int lbound rbound unify
            \ ambiguity add sub mul prefix is_prefix minus ignore normalize
            \ lbound_of rbound_of strlen
            \ RE

syn keyword cqpSet set nextgroup=cqpOption skipwhite

syn keyword cqpOption VerboseParser ShowSymtab ShowGconstraints ShowEvaltree
            \ ShowPatlist ShowDFA ShowCompDFA SymtabDebug ParserDebug TreeDebug
            \ EvalDebug InitialMatchlistDebug DebugSimulation SearchDebug
            \ ServerLog ServerDebug Snoop ParseOnly Silent ChildProcess
            \ MacroDebug CLDebug PrintNrMatches ExternalGroup
            \ ExternalGroupCommand LessCharsetVariable Readline DefaultCorpus
            \ HardBoundary HardCut QueryLock Macros UserLevel
            \ LocalCorpusDirectory Registry DataDirectory HistoryFile
            \ WriteHistory MatchingStrategy StrictRegions Paging Pager
            \ Highlighting Pager Highlighting Colour ProgressBar PrettyPrint
            \ Context LeftContext RightContext LeftKWICDelim RightKWICDelim
            \ AttributeSeparator PrintOptions PrintStructures ShowTagAttributes
            \ ShowTargets AutoShow Timing Optimize AnchorNumberTarget
            \ AnchorNumberKeyword ExternalSort ExternalSortCommand
            \ DefaultNonbrackAttr AutoSubquery AutoSave SaveOnExit
            \ eg egc lcv dc hb hc ql m lcd r dd hf wh ms sr p pg h pg h col pb
            \ pp c lc rc ld rd sep po ps sta st as o ant ank es esc da sub
            \ contained


syn keyword cqpKeyword from to within where with by not on right left without
            \ expand matches inclusive exclusive reverse desc
            \ descending asc ascending cut meet maximal foreach
syn match cqpKeyword /contains/

syn match cqpMacro +/+ nextgroup=cqpBuiltinMacro,cqpMacro
syn keyword cqpBuiltinMacro unify region in_region undef codist

syn keyword cqpConstant Last named cd corpora active

syn keyword cqpSpecial TAB MU _ unlock
syn match cqpSpecial /\.EOL\./

syn match cqpAnchor /@/
syn keyword cqpAnchor match matchend target keyword
syn keyword cqpTarget leftmost rightmost nearest farthest

syn keyword cqpBoolean on off contained
syn keyword cqpNull NULL
syn match cqpNumber '\<\d\+\>' display

syn keyword cqpPattr word pos class hw lemma

syn match cqpComment /#.*/ contains=cqpTodo
syn keyword cqpTodo TODO XXX FIX FIXME NOTE contained

syn region cqpToken start=+\[+ end=+\]+
            \ contains=ALLBUT,cqpTag,cqpSattr,cqpKeyword,cqpCommand

syn region cqpString start=+"+ skip=+\\\\\|\\"\|\\$+ end=+"+
syn region cqpString start=+'+ skip=+\\\\\|\\'\|\\$+ end=+'+

syn match cqpDelimiter /[\[({\])};:,/\.$]/
syn match cqpOperator /[!&=+\-\|\*%?<>]/

syn match cqpFlag /%[cdl]\+/

syn keyword cqpSource source nextgroup=cqpString skipwhite

syn region cqpConstraint start=+::+ end=+;+ contains=ALLBUT,cqpTag,cqpSattr


let b:current_syntax = "cqp"

hi def link cqpComment          Comment
hi def link cqpTodo             Todo
hi def link cqpCommand          Statement
hi def link cqpBuiltinFunction  Function
hi def link cqpString           String
hi def link cqpBoolean          Boolean
hi def link cqpNumber           Number
hi def link cqpOperator         Operator
hi def link cqpKeyword          Operator
hi def link cqpFlag             Special
hi def link cqpPattr            Identifier
hi def link cqpNull             Boolean
hi def link cqpSet              Keyword
hi def link cqpSpecial          Special
hi def link cqpAnchor           Type
hi def link cqpTarget           keyword
hi def link cqpOption           Type
hi def link cqpDelimiter        Delimiter
hi def link cqpMacro            Macro
hi def link cqpBuiltinMacro     Macro
hi def link cqpSource           Include
hi def link cqpConstant         Constant

