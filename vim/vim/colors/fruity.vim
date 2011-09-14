"
" Fruity Color Scheme
" ===================
"
" Author:   Armin Ronacher <armin.ronacher@active-4.com>
" Version:  0.2

" Setup {{{
set background=dark

hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "fruity"
"}}}

" Default Colors {{{
hi Normal     guifg=#ffffff guibg=#0a0a0a
hi NonText    guifg=#444444
hi SpecialKey guifg=#444444
hi Cursor     guibg=#aaaaaa
hi lCursor    guibg=#aaaaaa
"}}}

" Search {{{
hi Search    guifg=#800000 guibg=#ffae00
hi IncSearch guifg=#800000 guibg=#ffae00
"}}}

" Window Elements {{{
hi StatusLine   guifg=#aaaaaa guibg=#464646 gui=bold
hi StatusLineNC guifg=#464646 guibg=#aaaaaa
hi VertSplit    guifg=#464646 guibg=#464646
hi Folded       guifg=#111111 guibg=#8090a0
hi IncSearch    guifg=#708090 guibg=#f0e68c
hi Pmenu        guifg=#ffffff guibg=#cb2f27
hi SignColumn   guibg=#111111
hi CursorLine   guibg=#001A21
hi ColorColumn  guibg=#00252e
hi LineNr       guifg=#aaaaaa guibg=#1e1e1e
hi MatchParen   guifg=#b1b711 guibg=NONE    gui=bold
"}}}

" Specials {{{
hi Todo  guifg=#e50808 guibg=#520000 gui=bold
hi Title guifg=#ffffff               gui=bold
"}}}

" Syntax Elements {{{
hi String     guifg=#0086d2
hi Constant   guifg=#0086d2
hi Number     guifg=#0086f7               gui=bold
hi Statement  guifg=#fb660a               gui=bold
hi Function   guifg=#ff0086               gui=bold
hi PreProc    guifg=#ff0007               gui=bold
hi Comment    guifg=#ccff00               gui=italic
hi Type       guifg=#cdcaa9               gui=bold
hi Error      guifg=#ffffff guibg=#ab0000
hi Identifier guifg=#ff0086
hi Label      guifg=#ff0086
"}}}

" Folding {{{
hi Folded     guifg=#aaaaaa guibg=#323232
" }}}

" Minibuf Explorer {{{
hi MBENormal               guifg=#aaaaaa
hi MBEChanged              guifg=#aaaaaa gui=italic
hi MBEVisibleNormal        guifg=#bbbbbb gui=bold
hi MBEVisibleChanged       guifg=#bbbbbb gui=bold,italic
hi MBEVisibleActive        guifg=#ffffff
hi MBEVisibleNormalActive  guifg=#ffffff
hi MBEVisibleChangedActive guifg=#ffffff gui=bold,italic
"}}}

" Diff {{{
hi DiffAdd    guibg=#254000
hi DiffChange guibg=#ffbb00
hi DiffDelete guibg=#400015
" }}}
