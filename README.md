# iOSFinalAssessmentQ4

[![Travis branch](https://img.shields.io/badge/bulid-passing-brightgreen.svg)]()

題目：

![](https://github.com/dan12411/iOSFinalAssessmentQ4/blob/master/%E8%9E%A2%E5%B9%95%E5%BF%AB%E7%85%A7%202016-12-02%20%E4%B8%8B%E5%8D%882.18.36.png)

---

實作過程：

1. 使用CollectionViewController & CollectionViewCell

2. 產生六個 Collection View Custom Cell

3. 調整 Cell 長度/寬度，以符合畫面要求 (by UICollectionViewDelegateFlowLayout - sizeForItemAt)

4. 加上View for Cell，並設定 View 的 border color & width

5. 加上Label for Cell，並設定每個 Cell 要顯示的任務文字 (by switch)

6. 準備在 function - didSelectItemAt 實作各Cell的任務 (by swith & create each function)

7. cell indexPath 0 : alertCell() - present 自訂的 UIAlertController

8. cell indexPath 1 : colorChange() - 藉由添加變數 selectCell (Bool)，來判斷＆控制 background color

9. cell indexPath 2 : requestPedometerData() - 
    
    9-1. Privacy - Motion Usage Description記得要填，讓APP可以使用計步器 (參考資料 1.)

    9-2. 模擬器上無法使用計步器，要用實機測

    9-3. 要使用全域變數才能執行計步器 (參考資料 2.)

    9-4. 計步器要走遠一點，並等一小段時間，只在原地用手移來移去看不出效果，可用iphone內建的計步器，與自己建立的計步器，去比較步數，確認成功與否

10. cell indexPath 3 : openAPPSetting() - 參考網路上的code (參考資料 4.)

11. cell indexPath 4 : openGoogleMap() - 使用google map API (參考資料 5. & 6.)

12. cell indexPath 5 : sendMail() - 參考Peter Pan上課的code

![](https://github.com/dan12411/iOSFinalAssessmentQ4/blob/master/Q4_Demo.gif)

---

參考資料：

1. [CMPedometer](http://stackoverflow.com/questions/38412977/cmpedometer-in-ios-10)...計步器

2. [Domain=CMErrorDomain Code=103](http://stackoverflow.com/questions/28145158/what-does-cmerrordomain-error-103-mean-cmpedometer)..要使用全域變數才能執行計步器

3. [CoreMotion Sample Code](https://github.com/shinobicontrols/iOS8-day-by-day/blob/master/35-coremotion/LocoMotion/LocoMotion/LiveViewController.swift)

4. [open APP setting](http://stackoverflow.com/questions/39792745/ios-10-open-settings-crash)...iOS 10之後，語法不同了

5. [Google map API](https://developers.google.com/maps/premium/ios-get-started)

6. [OSStatus - 10814](https://www.osstatus.com/search/results?platform=all&framework=all&search=10814)...其實就是模擬器裡面沒有google map app，改用實機(有google map)就可以打開了，知道錯誤訊息代表什麼很重要，才不會浪費太多時間...


