! Copyright (C) 2020 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: kernel io.encodings.utf8 io.files colors colors.constants.private
       assocs colors.constants colors.hex namespaces ui.theme arrays
       io io.directories splitting sequences ;
IN: base16-theme

MEMO: base16colors ( -- assoc )
    "resource:work/base16-theme/base16-greenscreen.txt"
    utf8 file-lines parse-colors ;

SINGLETON: base16-theme
theme [ base16-theme ] initialize

M: base16-theme toolbar-background "base00" base16colors at ;
M: base16-theme toolbar-button-pressed-background "base01" base16colors at  ;

M: base16-theme menu-background "base00" base16colors at ;
M: base16-theme menu-border-color "base02" base16colors at ;

M: base16-theme status-bar-background "base00" base16colors at ;
M: base16-theme status-bar-foreground "base04" base16colors at ;

M: base16-theme button-text-color "base0C" base16colors at ;
M: base16-theme button-clicked-text-color "base0B" base16colors at ;

M: base16-theme line-color "base02" base16colors at ;

M: base16-theme column-title-background "base00" base16colors at ;

M: base16-theme roll-button-rollover-border "base03" base16colors at ;
M: base16-theme roll-button-selected-background "base02" base16colors at ;

M: base16-theme source-files-color "base0B" base16colors at ;
M: base16-theme errors-color "base08" base16colors at ;
M: base16-theme details-color "base0D" base16colors at ;

M: base16-theme debugger-color "base09" base16colors at ;
M: base16-theme completion-color "base0A" base16colors at ;

M: base16-theme data-stack-color "base0D" base16colors at ;
M: base16-theme retain-stack-color "base0E" base16colors at ;
M: base16-theme call-stack-color "base0B" base16colors at ;

M: base16-theme title-bar-gradient "base01" base16colors at "base01" base16colors at 2array ;

M: base16-theme popup-color "base0A" base16colors at ;

M: base16-theme object-color "base0D" base16colors at ;
M: base16-theme contents-color "base0B" base16colors at ;

M: base16-theme help-header-background "base01" base16colors at ;

M: base16-theme thread-status-stopped-background "base0A" base16colors at ;
M: base16-theme thread-status-suspended-background "base0B" base16colors at ;
M: base16-theme thread-status-running-background "base02" base16colors at ;

M: base16-theme thread-status-stopped-foreground "base00" base16colors at ;
M: base16-theme thread-status-suspended-foreground "base00" base16colors at ;
M: base16-theme thread-status-running-foreground "base03" base16colors at ;

M: base16-theme error-summary-background "base01" base16colors at ;

M: base16-theme content-background "base00" base16colors at ;
M: base16-theme text-color "base06" base16colors at ;

M: base16-theme link-color "base0C" base16colors at ;
M: base16-theme title-color "base0B" base16colors at ;
M: base16-theme heading-color "base03" base16colors at ;
M: base16-theme snippet-color "base09" base16colors at ;
M: base16-theme output-color "base09" base16colors at ;
M: base16-theme deprecated-background-color "base01" base16colors at ;
M: base16-theme deprecated-border-color "base01" base16colors at ;
M: base16-theme warning-background-color "base01" base16colors at ;
M: base16-theme warning-border-color "base01" base16colors at ;
M: base16-theme code-background-color "base01" base16colors at ;
M: base16-theme help-path-border-color "base0F" base16colors at ;

M: base16-theme tip-background-color "base01" base16colors at ;

M: base16-theme prompt-background-color "base02" base16colors at ;

M: base16-theme dim-color "base03" base16colors at ;
M: base16-theme highlighted-word-color "base04" base16colors at ;
M: base16-theme string-color "base0A" base16colors at ;
M: base16-theme stack-effect-color "base04" base16colors at ;

M: base16-theme vocab-background-color "base00" base16colors at ;
M: base16-theme vocab-border-color "base00" base16colors at ;

M: base16-theme field-border-color "base00" base16colors at ;

M: base16-theme editor-caret-color "base06" base16colors at ;
M: base16-theme selection-color "base0D" base16colors at ;
M: base16-theme panel-background-color "base02" base16colors at ;
M: base16-theme focus-border-color "base00" base16colors at ;

M: base16-theme labeled-border-color "base01" base16colors at ;

M: base16-theme table-border-color "base00" base16colors at ;

! quick and dirty function to process gimp palettes within given dir into factor color files
: gimp-palette-conv ( path -- )
    dup
    set-current-directory
    directory-files [ ".gpl" tail? ] filter
    [
        dup
        ".gpl" ".txt" replace utf8
        [
            utf8 [ lines ] with-file-reader
            4 tail ! ignore header info
            [ "\t" "  " replace ] map
            [ " " split harvest ] map
            [ [ 4 32 pad-head ] map ] map
            [ dup last "  " prepend 1array [ 3 head ] dip append ] map
            [ "" [ append ] reduce 1 tail ] map
            [ write "\n" write ] each
        ] with-file-writer 
    ] each
    ;
