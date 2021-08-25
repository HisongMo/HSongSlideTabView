# HSongSlideTabView
## 让TabView变的更酷!
##### 未来会拓展它的自由度，添加更多可调整的属性
### 1.展示效果
<br />
<div>
<img src="/DIsplayImage/noImgDisplay.gif" width = "250" height = "541" alt="" align=center />
<img src="/DIsplayImage/haveImgDisplay.gif" width = "250" height = "541" alt="" align=center />
<div />

### 2.使用
  
#### ①首先引入HSongSlideTabView
  ```swift
    import HSongSlideTabView
  ```
#### ②定义TabView样式，并使用，非常简便
##### 无图标（如1中左图）
  ```swift
    struct ContentView: View {
        let manager: Manager = Manager(leftTitle: "你好", rightTitle: "欢迎")
        var body: some View {
            HSongSlideTabView(manager: manager) {
                AView()
                BView()
            }
        }
    }
  ```
 ##### 有图标（如1中右图）
  ```swift
    struct ContentView: View {
        let manager: Manager = Manager(leftImg: "dianpu", leftSelectedImg: "dianpu-sed",leftTitle: "你好", rightImg: "yinliao", rightSelectedImg: "yinliao-sed",rightTitle: "欢迎")
        var body: some View {
            HSongSlideTabView(manager: manager) {
                AView()
                BView()
            }
        }
    }
  ```
  
  ### 3.安装
  
  #### 支持通过cocoapods安装
  
  在你的项目中的Podfile添加`pod HSongSlideTabView`即可
  
  ### 4.Author

  Thered-key

  ### 5.License

  `AlertToast` is available under the MIT license. See the [LICENSE](LICENSE) file for more info.

  ---
  
