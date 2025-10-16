#Requires AutoHotkey v2.0
#SingleInstance Force
;=====================================================================================
; configuration
GroupAdd "Emulator", "ahk_exe HD-Player.exe" ; BlueStacks
GroupAdd "Emulator", "ahk_exe crosvm.exe" ; GooglePlayGames
; カーソルファイルのパス (必要に応じて修正してください)
CursorPath := "C:\your\path\to\cursor\here.cur"  ; ファイル形式は.curもしくは.ani

; ====================================================================================
; 設定用ホットキー (例: エミュレータがアクティブな時にCtrl + Alt + 0)
#HotIf WinActive("ahk_group Emulator")
^!0::
{
    ;カーソルを読み込み
    hCur := DllCall("LoadImageW", "Ptr", 0, ; HINSTANCE hInst = NULL
    "WStr", CursorPath, ; LPCWSTR name = CursorPath
    "UInt", 2, ; UINT type = IMAGE_CURSOR(2)
    "Int", 0, ; int cx = 0
    "Int", 0, ; int cy = 0
    "UInt", 0x00000040 | 0x00000010, ; UINT fuLoad = LR_DEFAULTSIZE(0x00000040) | LR_LOADFROMFILE(0x00000010)
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
#HotIf
; デフォルトに戻すホットキー (例: エミュレータが非アクティブ時にCtrl + Alt + 0)
^!0::
{
    ; システムカーソルをレジストリに保存されている値に戻す
    DllCall("SystemParametersInfoW", "UInt", 0x0057, ; UINT uiAction = SPI_SETCURSORS(0x0057)
    "UInt", 0, ; UINT uiParam = 0
    "Ptr*", 0, ; PVOID pvParam = NULL
    "UInt", 0, ; UINT fWinIni - 0
    "UInt") ; return value, type: BOOL
}


; (おまけ) カーソルサイズを指定して読み込む場合
^!9:: ; (例: Ctrl + Alt + 0)
{
    ; 128x128のサイズで読み込む
    hCur := DllCall("LoadImageW", "Ptr", 0,
    "WStr", CursorPath,
    "UInt", 2,
    "Int", 128, ; int cx = 128
    "Int", 128, ; int cy = 128
    "UInt", 0x00000010, ; UINT fuLoad = LR_LOADFROMFILE(0x00000010)
    "Ptr")

    if (hCur != 0)
    {
        DllCall("SetSystemCursor", "Ptr", hCur,
        "UInt", 32512,
        "Int")
    }
    else
    {
        MsgBox("カーソルファイルの読み込みに失敗しました。パスを確認してください: " . CursorPath)
    }
}