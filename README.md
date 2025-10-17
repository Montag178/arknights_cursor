# **🖱️ 大きくて丸いカスタムカーソルとAHK切り替えスクリプト**

## **📝 概要 (Overview)**

**エミュレータで使いやすい、大きくて丸いカスタムカーソルが欲しかったので自作しました。**  
ついでに、Windowsの設定画面を開かなくてもホットキーでカーソルセットを切り替えられる **AutoHotkey (AHK) スクリプト**も作ったので公開します。  
カーソルファイル（.cur 形式）とスクリプト（.ahk 形式）を用意しています。  
ライセンスはUnlicenseなので、改造や再配布などはご自由にどうぞ！

## **📸 カーソルプレビュー**

同梱されている4つのカーソルファイルと、そのプレビュー画像です。

| カーソル名（ファイル） | プレビュー画像 |
| :---- | :---- |
| **pointer\_spot\_cyan.cur** |  <img width="128" height="128" alt="pointer_spot_cyan" src="https://github.com/user-attachments/assets/ab54738d-a906-4dbb-9f39-805586738254" /> |
| **pointer\_spot\_cyan\_thick.cur** | <img width="128" height="128" alt="pointer_spot_cyan_thick" src="https://github.com/user-attachments/assets/535796d7-42c6-4e31-84d5-409fda1554c2" /> |
| **pointer\_spot\_gray.cur** |  <img width="128" height="128" alt="pointer_spot" src="https://github.com/user-attachments/assets/f3c18bbd-6b7b-48d0-9a81-aeb0815d9b4f" /> |
| **pointer\_spot\_gray\_thick.cur** | <img width="128" height="128" alt="pointer _spot_thick" src="https://github.com/user-attachments/assets/dec09f90-5840-41af-be02-619f7bd4cc81" /> |

## **🛠️ 使用方法 (AHKスクリプト)**

**arknights_cursor_replace.ahk** を使用すると、ホットキーでカーソルを切り替えられます。

### **1\. 前提条件**

* Windows OS  
* **AutoHotkey (AHK)** がインストールされていること

### **2\. セットアップ**

1. このリポジトリをダウンロード（またはクローン）し、任意の場所に展開します。
2. **arknights_cursor_replace.ahk**をメモ帳などで開き、CursorPathに使用したいカーソルファイル(.curもしくは.ani)のパスを設定します。
3. AHKがインストールされていれば、**arknights_cursor_replace.ahk** ファイルをダブルクリックするだけで実行されます。

### **3\. 切り替え操作**

デフォルトでは以下のキー割り当てになっています。好きなキーに割り当て直してください。\
**カーソルの変更は一時的なもの**です。OSの再起動などで元に戻ります。\
また、Windowsの"設定"->"マウスポインターのスタイル"でサイズなどを変更すると元に戻せます。

| ショートカットキー | 動作 |
| :---- | :---- |
| **Ctrl \+ Alt \+ 0** (エミュレータアクティブ時) | カスタムカーソルへ切り替え |
| **Ctrl \+ Alt \+ 0** (エミュレータ非アクティブ時) | 標準カーソルへ戻す |
| **Ctrl \+ Alt \+ 9** | サイズを指定してカスタムカーソルへ切り替え |

### **4\. エミュレータ固有**

- GooglePlayGames, BlueStacks以外のエミュレータを使っている場合は、スクリプト内のGroupAdd "Emulator"でウィンドウの識別子を追加する必要があります。ウィンドウの識別子はAutoHotKey同梱のWindowSpyを使って調べてください。
- GooglePlayGamesでカーソルが変わらない場合は、エミュレータ内で**Shift \+ Tab**を押して出てくる"表示の設定" -> "マウスポインタ"でサイズが標準になっていることを確認してください。
- BlueStacksでカーソルが変わらない場合は、"環境設定" -> "ディスプレイ" でマウスカーソルの種類がシステムデフォルトになっていることを確認してください。


## **📜 ライセンス (License)**

このプロジェクトはパブリックドメインに相当する **Unlicense (アンライセンス)** の下で公開されています。  
あなたは、いかなる制限もなく、自由にコピー、変更、配布、実行、そして公開することができます。
