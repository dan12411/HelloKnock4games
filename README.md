# iOSFinalAssessmentQ4

[![Travis branch](https://img.shields.io/badge/bulid-passing-brightgreen.svg)]()

題目：

![](https://github.com/dan12411/HelloKnock4games/blob/master/QuestionContent.png)

---

實作過程：

＊＊系統有兩個畫面：一個為登入頁面，另一個為登入後的頁面

＊登入頁面部分：

1. 讓使用者可以key in UserName & Password

2. 按下Log in後，系統跟API溝通，method用post，parameters用使用者key in的帳密

3. 成功拿到token後，存在本地端(UserDefault)

4. 把使用者帳密儲存在document

5. 儲存後，轉場到登入後的頁面，並將輸入欄位清空


＊登入後的頁面部分：

1. 登出按鈕：實作返回前一頁(navigation pop)，並將使用者帳號密碼從Client Side刪除

2. 取得會員列表按鈕：將token從本地端(UserDefault)讀取，並放置headers內，跟API溝通，method用get

3. 新增按鈕：將token從本地端(UserDefault)讀取，並放置headers內，跟API溝通，method用post，parameters用題目給的JSON資料

＊token 1小時會自動expired，讓玩家無感覺下，自動extend token：

1. 在AppDelegate內的func applicationDidBecomeActive實作跟API拿token的動作，使得APP在被喚醒後，會自動聯繫API，取得新的token



![](https://github.com/dan12411/HelloKnock4games/blob/master/view1.png)
![](https://github.com/dan12411/HelloKnock4games/blob/master/view2.png)
![](https://github.com/dan12411/HelloKnock4games/blob/master/view3.png)



