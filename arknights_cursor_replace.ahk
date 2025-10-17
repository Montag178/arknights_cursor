#Requires AutoHotkey v2.0
#SingleInstance Force
;=====================================================================================
; configuration
GroupAdd "Emulator", "ahk_exe HD-Player.exe" ; BlueStacks
GroupAdd "Emulator", "ahk_exe crosvm.exe" ; GooglePlayGames
; カーソルファイルのパス (必要に応じて修正してください)
CursorPath := "C:\your\path\to\cursor\here.cur"  ; ファイル形式は.curもしくは.ani

; ====================================================================================
OnExit(resetCursor) ; スクリプト終了時にカーソルをもとに戻す

/**
 * カスタムカーソルを読み込み、システムカーソルとして設定します。
 * サイズを指定しない場合は、OSが設定しているカーソルサイズに従います。
 * @param {Integer} cx - カーソルの幅 (0の場合はLR_DEFAULTSIZEを使用)
 * @param {Integer} cy - カーソルの高さ (0の場合はLR_DEFAULTSIZEを使用)
 */
changeCursor(cx := 0, cy := 0){
    ; サイズ指定があるかどうかでロードフラグを決定
    if (cx > 0 || cy > 0)
        dwFlags := 0x00000010 ; サイズ指定あり (LR_DEFAULTSIZEを使わない)
    else
        dwFlags := 0x00000040 | 0x00000010 ; サイズ指定なし(デフォルトサイズ)

    ;カーソルを読み込み
    hCur := DllCall("LoadImageW", "Ptr", 0, ; HINSTANCE hInst = NULL
    "WStr", CursorPath, ; LPCWSTR name = CursorPath
    "UInt", 2, ; UINT type = IMAGE_CURSOR(2)
    "Int", cx, ; int cy
    "Int", cy, ; int cy
    "UInt", dwFlags, ; UINT fuLoad = LR_DEFAULTSIZE(0x00000040) | LR_LOADFROMFILE(0x00000010)
    "Ptr") ; return value, type: HANDLE

    ; 読み込みに成功した場合のみシステムカーソルを設定
    if (hCur != 0)
    {
        DllCall("SetSystemCursor", "Ptr", hCur, ; HCURSOR hcur = hCur
        "UInt", 32512, ; DWORD id = OCR_NORMAL(32512)
        "Int") ; return value, type: BOOL
    }
    else
    {
        MsgBox("カーソルファイルの読み込みに失敗しました。パスを確認してください: " . CursorPath)
    }
}

/**
 * システムカーソルをレジストリに保存されているデフォルト値に戻します。
 * @param * は OnExit が渡す引数 (ExitReason, ExitCode) を受け取るためのワイルドカードです。
 */
resetCursor(*){
    ; システムカーソルをレジストリに保存されている値に戻す
    DllCall("SystemParametersInfoW", "UInt", 0x0057, ; UINT uiAction = SPI_SETCURSORS(0x0057)
    "UInt", 0, ; UINT uiParam = 0
    "Ptr*", 0, ; PVOID pvParam = NULL
    "UInt", 0, ; UINT fWinIni - 0
    "UInt") ; return value, type: BOOL
}

; ====================================================================================
; ホットキー定義

; エミュレーターがアクティブな場合
#HotIf WinActive("ahk_group Emulator")
^!0::changeCursor()          ; Ctrl+Alt+0: カスタムカーソルに変更（OSデフォルトサイズ）
^!9::changeCursor(128, 128)  ; Ctrl+Alt+9: カスタムカーソルに変更（128x128サイズ）
#HotIf

; エミュレータが非アクティブな場合
^!0::resetCursor()           ; Ctrl+Alt+0: デフォルトカーソルに戻す