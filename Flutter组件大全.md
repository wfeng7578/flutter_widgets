## 1. MaterialApp

一、**一句话说明**

* MaterialApp 是 Flutter 应用的根组件，负责配置全局主题、路由、语言、导航等基础设施，整个应用只需要一个。

二、**使用场景**

- 创建一个新的 Flutter 应用入口
- 配置全局主题（颜色、字体、暗黑模式）
- 定义命名路由表实现页面跳转
- 配置多语言国际化
- 去掉右上角 DEBUG 横幅

三、**核心属性表**

| 属性名                       | 类型                                 | 说明                            |
| ---------------------------- | ------------------------------------ | ------------------------------- |
| `home`                       | `Widget?`                            | 应用启动后的首页                |
| `routes`                     | `Map<String, WidgetBuilder>?`        | 命名路由表                      |
| `initialRoute`               | `String?`                            | 初始路由名，替代home            |
| `onGenerateRoute`            | `RouteFactory?`                      | 动态路由生成（带参数跳转）      |
| `onUnknownRoute`             | `RouteFactory?`                      | 未匹配到路由时的兜底页面（404） |
| `navigatorKey`               | `GlobalKey<NavigatorState>?`         | 全局导航Key，用于无Context导航  |
| `theme`                      | `ThemeData?`                         | 亮色主题                        |
| `darkTheme`                  | `ThemeData?`                         | 暗色主题                        |
| `themeMode`                  | `ThemeMode`                          | 主题模式切换                    |
| `title`                      | `String`                             | 任务管理器中显示的应用名称      |
| `color`                      | `Color?`                             | 任务管理器中的应用主色          |
| `debugShowCheckedModeBanner` | `bool`                               | 是否显示右上角DEBUG横幅         |
| `locale`                     | `Locale?`                            | 强制指定语言                    |
| `localizationsDelegates`     | `Iterable<LocalizationsDelegate>?`   | 国际化委托列表                  |
| `supportedLocales`           | `Iterable<Locale>`                   | 支持的语言列表                  |
| `scaffoldMessengerKey`       | `GlobalKey<ScaffoldMessengerState>?` | 全局SnackBar控制Key             |
| `builder`                    | `TransitionBuilder?`                 | 在Navigator外层包裹全局组件     |
| `navigatorObservers`         | `List<NavigatorObserver>`            | 路由监听器列表                  |
| `scrollBehavior`             | `ScrollBehavior?`                    | 自定义全局滚动行为              |
| `debugShowMaterialGrid`      | `bool`                               | 显示Material设计网格线          |
| `showPerformanceOverlay`     | `bool`                               | 显示性能覆盖层                  |
| `themeAnimationCurve`        | `Curve`                              | 主题切换动画曲线                |
| `themeAnimationDuration`     | `Duration`                           | 主题切换动画时长                |



## 2. Scaffold

一、 **一句话说明**

* Scaffold 是 Material Design 的页面骨架，提供 AppBar、Body、Drawer、BottomNavigationBar、FloatingActionButton、SnackBar 等标准布局槽位，几乎每个页面都要用。

二、**应用场景**

- 搭建带顶部导航栏 + 内容区的标准页面
- 页面需要侧滑抽屉菜单
- 页面右下角需要悬浮操作按钮
- 底部需要 Tab 导航栏切换页面
- 需要弹出 SnackBar / BottomSheet 的宿主页面

三、**核心属性**

| 属性名                           | 类型                            | 说明                                          |
| -------------------------------- | ------------------------------- | --------------------------------------------- |
| `appBar`                         | `PreferredSizeWidget?`          | 顶部导航栏                                    |
| `body`                           | `Widget?`                       | 页面主体内容区                                |
| `floatingActionButton`           | `Widget?`                       | 悬浮操作按钮                                  |
| `floatingActionButtonLocation`   | `FloatingActionButtonLocation?` | FAB 的位置                                    |
| `floatingActionButtonAnimator`   | `FloatingActionButtonAnimator?` | FAB 位置切换时的动画                          |
| `drawer`                         | `Widget?`                       | 左侧抽屉菜单                                  |
| `endDrawer`                      | `Widget?`                       | 右侧抽屉菜单                                  |
| `drawerEnableOpenDragGesture`    | `bool`                          | 是否允许手势滑出左抽屉                        |
| `endDrawerEnableOpenDragGesture` | `bool`                          | 是否允许手势滑出右抽屉                        |
| `drawerEdgeDragWidth`            | `double?`                       | 触发抽屉滑出的边缘宽度                        |
| `drawerScrimColor`               | `Color?`                        | 抽屉打开时遮罩颜色                            |
| `bottomNavigationBar`            | `Widget?`                       | 底部导航栏                                    |
| `bottomSheet`                    | `Widget?`                       | 固定显示的底部面板                            |
| `backgroundColor`                | `Color?`                        | 页面背景色                                    |
| `resizeToAvoidBottomInset`       | `bool`                          | 键盘弹出时是否自动调整body高度避免遮挡        |
| `extendBody`                     | `bool`                          | body 是否延伸到 bottomNavigationBar 下方      |
| `extendBodyBehindAppBar`         | `bool`                          | body 是否延伸到 AppBar 背后（透明AppBar场景） |
| `persistentFooterButtons`        | `List<Widget>?`                 | body下方固定按钮行                            |
| `persistentFooterAlignment`      | `AlignmentDirectional`          | 底部按钮行的对齐方式                          |
| `primary`                        | `bool`                          | 是否与系统状态栏对齐（顶部留白）              |
| `key`                            | `Key?`                          | 用于全局控制Scaffold状态                      |

## 3. Text

一、**一句话说明**

- Text 是 Flutter 中用于显示一段文本的基础组件，支持样式、对齐、换行等控制。

二、**应用场景**

- 显示标题、正文、标签等静态文本内容
- 展示接口返回的动态文字信息
- 带样式的富文本展示（配合 Text.rich）
- 文本溢出时省略号截断处理
- 多语言国际化文本显示

三、**核心属性**

| 属性名         | 类型           | 说明                                   |
| -------------- | -------------- | -------------------------------------- |
| data           | String         | 要显示的文本内容（构造函数第一个参数） |
| style          | TextStyle?     | 文本样式（字体大小、颜色、粗细等）     |
| textAlign      | TextAlign?     | 文本对齐方式（左、右、居中等）         |
| textDirection  | TextDirection? | 文本方向（从左到右或从右到左）         |
| maxLines       | int?           | 最大显示行数                           |
| overflow       | TextOverflow?  | 文本溢出时的处理方式（省略号、裁剪等） |
| softWrap       | bool?          | 是否自动换行                           |
| textScaler     | TextScaler?    | 文本缩放因子，控制字体缩放             |
| strutStyle     | StrutStyle?    | 设置文本行的最小行高等支撑样式         |
| selectionColor | Color?         | 文本被选中时的高亮颜色                 |

**TextStyle 常用属性：**

| 属性名          | 类型                 | 说明                           |
| --------------- | -------------------- | ------------------------------ |
| fontSize        | double?              | 字体大小                       |
| color           | Color?               | 文字颜色                       |
| fontWeight      | FontWeight?          | 字体粗细                       |
| fontStyle       | FontStyle?           | 斜体或正常                     |
| letterSpacing   | double?              | 字符间距                       |
| wordSpacing     | double?              | 单词间距                       |
| height          | double?              | 行高倍数（相对于 fontSize）    |
| decoration      | TextDecoration?      | 文本装饰线（下划线、删除线等） |
| decorationColor | Color?               | 装饰线颜色                     |
| decorationStyle | TextDecorationStyle? | 装饰线样式（实线、虚线等）     |
| fontFamily      | String?              | 字体族名称                     |
| backgroundColor | Color?               | 文字背景颜色                   |
| shadows         | List<Shadow>?        | 文字阴影                       |
| overflow        | TextOverflow?        | 溢出处理（TextStyle 级别）     |

四、**优缺点与注意事项**

**优点：**

- 简单易用，一个字符串即可渲染文本
- TextStyle 属性丰富，覆盖绑大多数排版需求
- 通过 `Text.rich` + `TextSpan` 可实现同一段落内多种样式混排

**缺点：**

- 不支持原生 HTML 富文本渲染，需借助第三方包
- 复杂图文混排能力有限，需配合 `WidgetSpan`

**注意事项：**

- `maxLines` 配合 `overflow: TextOverflow.ellipsis` 才能显示省略号，单独设其中一个效果不完整
- `textScaler` 会受系统字体缩放影响，若需固定大小应显式设置 `TextScaler.noScaling`
- `style` 未设置时会继承最近的 `DefaultTextStyle`，排查样式问题时需注意父级默认样式的影响



## 4. Container

一、**一句话说明**

- Container 是一个组合型便捷组件，用于对子组件进行装饰、定位、约束尺寸，本质上是 Padding、Align、DecoratedBox、ConstrainedBox、Transform 等组件的封装。

二、**应用场景**

- 为子组件添加背景色、圆角、边框、阴影等装饰效果
- 设置固定宽高或最大最小尺寸约束
- 通过 margin/padding 控制内外间距
- 作为简单的占位盒子或分隔区域
- 配合 transform 实现旋转、平移等变换效果

三、**核心属性**

| 属性名               | 类型                | 说明                                              |
| -------------------- | ------------------- | ------------------------------------------------- |
| child                | Widget?             | 子组件                                            |
| width                | double?             | 固定宽度                                          |
| height               | double?             | 固定高度                                          |
| color                | Color?              | 背景颜色（不能与 decoration 中的 color 同时使用） |
| decoration           | Decoration?         | 装饰（背景色、圆角、边框、阴影、渐变等）          |
| foregroundDecoration | Decoration?         | 前景装饰，绘制在 child 之上                       |
| padding              | EdgeInsetsGeometry? | 内边距                                            |
| margin               | EdgeInsetsGeometry? | 外边距                                            |
| alignment            | AlignmentGeometry?  | 子组件对齐方式                                    |
| constraints          | BoxConstraints?     | 尺寸约束（最大/最小宽高）                         |
| transform            | Matrix4?            | 变换矩阵（旋转、缩放、平移等）                    |
| transformAlignment   | AlignmentGeometry?  | 变换的锚点对齐方式                                |
| clipBehavior         | Clip                | 装饰裁剪行为                                      |

**BoxDecoration 常用属性（decoration 最常用的类型）：**

| 属性名       | 类型                  | 说明                     |
| ------------ | --------------------- | ------------------------ |
| color        | Color?                | 背景颜色                 |
| borderRadius | BorderRadiusGeometry? | 圆角半径                 |
| border       | BoxBorder?            | 边框                     |
| boxShadow    | List<BoxShadow>?      | 阴影列表                 |
| gradient     | Gradient?             | 渐变（线性、径向、扫描） |
| image        | DecorationImage?      | 背景图片                 |
| shape        | BoxShape              | 形状（矩形或圆形）       |

四、**优缺点与注意事项**

**优点：**

- 一个组件即可完成装饰+约束+对齐+间距，代码简洁
- BoxDecoration 能力丰富，覆盖绑大多数视觉需求

**缺点：**

- 本质是多层组件的嵌套封装，功能用不到时存在不必要的开销
- 仅需要 Padding 或 Align 时，直接用对应单一组件性能更优

**注意事项：**

- `color` 属性和 `decoration` 中的 `color` 不能同时设置，否则运行时报错；使用了 `decoration` 就把颜色写在 `BoxDecoration.color` 里
- Container 没有 child 且未设置约束时，会尽可能撑满父组件；有 child 时则包裹 child 大小——这一行为差异容易让新手困惑
- 需要圆角裁剪子组件内容时，Container 的 `borderRadius` 只装饰自身不裁剪 child，应配合 `ClipRRect` 或设置 `clipBehavior: Clip.hardEdge`



## 5. Column

一、**一句话说明**

- Column 是将子组件沿垂直方向（从上到下）依次排列的弹性布局组件，继承自 Flex。

二、**应用场景**

- 表单页面中多个输入框和按钮的纵向排列
- 列表项内部标题、副标题、描述等信息的垂直堆叠
- 页面整体布局中头部、内容、底部的纵向分区
- 配合 Expanded/Flexible 实现子组件按比例分配垂直空间
- 卡片内多行文字与图标的纵向组合

三、**核心属性**

| 属性名             | 类型               | 说明                                                    |
| ------------------ | ------------------ | ------------------------------------------------------- |
| children           | List<Widget>       | 子组件列表                                              |
| mainAxisAlignment  | MainAxisAlignment  | 主轴（垂直方向）的对齐方式                              |
| crossAxisAlignment | CrossAxisAlignment | 交叉轴（水平方向）的对齐方式                            |
| mainAxisSize       | MainAxisSize       | 主轴方向占用空间大小（尽可能大或包裹内容）              |
| verticalDirection  | VerticalDirection  | 子组件排列顺序（从上到下或从下到上）                    |
| textDirection      | TextDirection      | 水平方向的文本方向，影响交叉轴对齐中 start/end 的含义   |
| textBaseline       | TextBaseline?      | 文本基线类型，crossAxisAlignment 为 baseline 时必须设置 |
| spacing            | double             | 子组件之间的间距（Flutter 3.27+）                       |

四、**优缺点与注意事项**

**优点：**

- 语义清晰，纵向布局首选，配合 Expanded/Flexible 弹性分配空间非常灵活
- 与 Row 属性一致，学一个等于掌握两个

**缺点：**

- 不具备滚动能力，子组件超出可用高度会溢出报错
- 子组件数量很多时性能不如 ListView

**注意事项：**

- Column 默认 `mainAxisSize: MainAxisSize.max`，会占满父组件的全部高度；如果只想包裹子组件高度，需显式设为 `MainAxisSize.min`
- Column 嵌套在 ListView 或另一个 Column 中且没有固定高度约束时，内部再使用 Expanded 会报错——因为可用高度为无限大，无法按比例分配
- `crossAxisAlignment: CrossAxisAlignment.stretch` 会让所有子组件在水平方向撑满，容易出现意料之外的宽度拉伸



## 6. Row

一、**一句话说明**

- Row 是将子组件沿水平方向（从左到右）依次排列的弹性布局组件，继承自 Flex。

二、**应用场景**

- 导航栏中图标、标题、操作按钮的水平排列
- 表单项中标签与输入框的左右布局
- 列表项中头像、文字、右侧箭头的横向组合
- 底部按钮组的水平并排展示
- 标签/徽章的横向流式排列（少量固定数量时）

三、**核心属性**

| 属性名             | 类型               | 说明                                                    |
| ------------------ | ------------------ | ------------------------------------------------------- |
| children           | List<Widget>       | 子组件列表                                              |
| mainAxisAlignment  | MainAxisAlignment  | 主轴（水平方向）的对齐方式                              |
| crossAxisAlignment | CrossAxisAlignment | 交叉轴（垂直方向）的对齐方式                            |
| mainAxisSize       | MainAxisSize       | 主轴方向占用空间大小（尽可能大或包裹内容）              |
| textDirection      | TextDirection?     | 子组件排列的水平方向（左到右或右到左）                  |
| verticalDirection  | VerticalDirection  | 交叉轴方向，影响 start/end 的含义                       |
| textBaseline       | TextBaseline?      | 文本基线类型，crossAxisAlignment 为 baseline 时必须设置 |
| spacing            | double             | 子组件之间的间距（Flutter 3.27+）                       |

四、**优缺点与注意事项**

**优点：**

- 语义清晰，水平布局首选，与 Column 属性完全对称，学习成本低
- 配合 Expanded/Flexible 可轻松实现子组件按比例分配水平空间

**缺点：**

- 子组件总宽度超出可用宽度时直接溢出报错，不会自动换行
- 需要自动换行应改用 Wrap 组件

**注意事项：**

- Row 默认 `mainAxisSize: MainAxisSize.max`，会占满父组件全部宽度；只想包裹内容宽度需设为 `MainAxisSize.min`
- 子组件中放置 Text 或其他不定宽组件时，未用 Expanded/Flexible 包裹容易导致水平溢出（黄黑条纹警告）
- `crossAxisAlignment: CrossAxisAlignment.baseline` 时必须同时设置 `textBaseline`，否则运行时报错

## 7. Center

一、一句话说明

`Center` 是一个将子组件在自身空间内**水平和垂直方向同时居中**的便捷布局组件，本质是 `Align` 的子类，alignment 固定为 `Alignment.center`。

二、应用场景

- 页面中将加载指示器（如 `CircularProgressIndicator`）居中显示
- 空状态页面将提示文本/图标居中展示
- `Scaffold.body` 中快速将单个子组件居中
- 在固定尺寸容器内将内容居中对齐

三、核心属性

| 属性名         | 类型      | 说明                                                         |
| -------------- | --------- | ------------------------------------------------------------ |
| `child`        | `Widget?` | 需要居中的子组件                                             |
| `widthFactor`  | `double?` | 将自身宽度设为子组件宽度的倍数；为 null 时尽可能占满父级宽度 |
| `heightFactor` | `double?` | 将自身高度设为子组件高度的倍数；为 null 时尽可能占满父级高度 |
| `key`          | `Key?`    | 组件的唯一标识                                               |

四、优缺点与注意事项

**优点**

- 语义清晰，代码简洁，比 `Align(alignment: Alignment.center)` 更直观
- 零学习成本，适合快速布局

**缺点**

- 功能单一，只能居中；若需其他对齐方式必须换用 `Align`
- 无法同时对多个子组件进行居中（只接受单个 child）

**注意事项**

- `Center` 在无约束（unbounded）方向上**默认会尽可能撑大**（如直接放在 `ListView`、`Row`/`Column` 中），可能导致布局异常；此时应设置 `widthFactor` 或 `heightFactor` 使其包裹子组件
- `Center` 继承自 `Align`，不会改变子组件自身的大小，只改变子组件在父级空间中的**位置**
- 嵌套多层 `Center` 无实际意义，徒增 widget 树深度



## 8. Padding

一、一句话说明

`Padding` 是一个为子组件添加**内边距**的布局组件，在子组件周围插入指定的空白区域。

二、应用场景

- 为文本、图标等元素与容器边缘之间添加间距
- 在 `Column`/`Row` 中为某个子项单独增加局部间距
- 替代 `Container` 仅需要 padding 而不需要装饰/尺寸等额外功能的场景
- 列表项内部内容与边界的留白处理
- 嵌套布局中对特定层级精确控制间距

三、核心属性

| 属性名    | 类型                 | 说明                                     |
| --------- | -------------------- | ---------------------------------------- |
| `padding` | `EdgeInsetsGeometry` | **必填**，定义上下左右各方向的内边距大小 |
| `child`   | `Widget?`            | 需要添加内边距的子组件                   |
| `key`     | `Key?`               | 组件的唯一标识                           |

> **`EdgeInsetsGeometry` 常用子类速查：**
>
> | 构造方式                                                | 说明                    |
> | ------------------------------------------------------- | ----------------------- |
> | `EdgeInsets.all(value)`                                 | 四边等距                |
> | `EdgeInsets.symmetric({vertical, horizontal})`          | 对称设置纵/横向         |
> | `EdgeInsets.only({left, top, right, bottom})`           | 分别指定各边            |
> | `EdgeInsets.fromLTRB(l, t, r, b)`                       | 按左上右下顺序指定      |
> | `EdgeInsetsDirectional.only({start, top, end, bottom})` | 支持 RTL 文字方向的版本 |

四、优缺点与注意事项

**优点**

- 职责单一、语义明确，比 `Container(padding: ...)` 更轻量（少一层组合）
- 支持 `EdgeInsetsDirectional`，天然适配 RTL 国际化布局

**缺点**

- 只能设置 padding，不能设置 margin（外边距需在外层再包一层或使用 `Container`）
- 功能单一，若同时需要背景色/边框/尺寸约束，不如直接用 `Container`

**注意事项**

- `padding` 属性为**必填**，传 `null` 会报错
- `Padding` 会**消耗父级约束空间**：若父级给了 100 宽，padding 左右各 20，则子组件最大只能获得 60 宽
- 当仅需要列表项之间的间距时，优先考虑 `SizedBox` 或 `ListView` 的 `separator`，而非给每个子项包 `Padding`
- 与 `Container.padding` 效果完全相同，但单独使用 `Padding` 在 widget 树中更轻量、语义更清晰



## 9. SizedBox

一、一句话说明

`SizedBox` 是一个将子组件强制约束为**指定宽高**的盒模型组件，也常用作组件之间的**固定间距占位符**。

二、应用场景

- 在 `Row`/`Column` 中作为子项之间的固定间距（替代 `Padding`）
- 强制将子组件限定为精确的宽度和高度
- 使用 `SizedBox.expand` 让子组件撑满父级剩余空间
- 使用 `SizedBox.shrink` 创建零尺寸占位，用于条件渲染时替代 `null`
- 包裹按钮/输入框等控件以统一尺寸

三、核心属性

| 属性名   | 类型      | 说明                                               |
| -------- | --------- | -------------------------------------------------- |
| `width`  | `double?` | 盒子的宽度；为 null 时不约束子组件宽度，由父级决定 |
| `height` | `double?` | 盒子的高度；为 null 时不约束子组件高度，由父级决定 |
| `child`  | `Widget?` | 子组件；为 null 时 SizedBox 仅作为空白占位         |
| `key`    | `Key?`    | 组件的唯一标识                                     |

**常用命名构造函数：**

| 构造函数                     | 说明                                         |
| ---------------------------- | -------------------------------------------- |
| `SizedBox.expand()`          | 宽高均设为 `double.infinity`，尽可能撑满父级 |
| `SizedBox.shrink()`          | 宽高均设为 `0`，生成零尺寸盒子               |
| `SizedBox.fromSize(size)`    | 通过 `Size` 对象同时指定宽高                 |
| `SizedBox.square(dimension)` | 宽高相等的正方形盒子                         |

四、优缺点与注意事项

**优点**

- 极其轻量，是 Flutter 中最常用的间距/尺寸约束工具
- 语义清晰：作为间距时比 `Padding`/`Container` 更直观
- `const SizedBox` 可被编译器优化，性能优于 `Container`

**缺点**

- 只能指定固定尺寸，无法表达弹性/比例尺寸（需用 `Flexible`/`Expanded`）
- 不支持装饰（背景色、边框等），需要时应使用 `Container` 或 `DecoratedBox`

**注意事项**

- `SizedBox` 是 **tight 约束**：当指定了 width/height，子组件会被**强制**设为该尺寸，忽略子组件自身的期望大小
- 当父级本身的约束比 `SizedBox` 指定的值更严格时，父级约束优先（如父级最大宽 50，`SizedBox(width: 100)` 实际只能是 50）
- 作为间距使用时建议加 `const` 修饰，避免不必要的重建
- `SizedBox` 与 `Container(width:, height:)` 在只需尺寸约束时效果相同，但 `SizedBox` 更轻量、推荐优先使用



## 10. Icon

**一、一句话说明**

`Icon` 是 Flutter 中用于显示 Material Design 图标或自定义图标字体的组件。

**二、应用场景**

- 导航栏（BottomNavigationBar、AppBar）中的功能图标
- 按钮内搭配文字使用（如 `TextButton.icon`、`ElevatedButton.icon`）
- 列表项（ListTile）的前缀/后缀图标
- 状态指示（如勾选、警告、错误提示图标）
- 表单输入框的前缀/后缀装饰图标

**三、核心属性**

| 属性名                         | 类型             | 说明                                             |
| ------------------------------ | ---------------- | ------------------------------------------------ |
| icon（构造函数第一个位置参数） | `IconData?`      | 要显示的图标数据，如 `Icons.home`                |
| size                           | `double?`        | 图标的逻辑像素大小，宽高相同                     |
| color                          | `Color?`         | 图标颜色，未设置时继承 `IconTheme` 的颜色        |
| fill                           | `double?`        | 图标填充程度（0.0-1.0），用于可变字体图标        |
| weight                         | `double?`        | 图标笔画粗细，用于可变字体图标                   |
| grade                          | `double?`        | 图标细腻度/粗糙度，用于可变字体图标              |
| opticalSize                    | `double?`        | 光学尺寸，用于可变字体图标                       |
| shadows                        | `List<Shadow>?`  | 图标的阴影列表                                   |
| semanticLabel                  | `String?`        | 无障碍语义标签，供屏幕阅读器使用                 |
| textDirection                  | `TextDirection?` | 控制图标的文本方向（影响部分有方向性的图标镜像） |
| applyTextScaling               | `bool?`          | 是否随系统文字缩放比例缩放图标大小               |

**四、优缺点与注意事项**

**优点：**

- 使用极其简单，一行代码即可渲染图标
- 基于字体渲染，矢量无损，任意缩放不模糊
- 与 `IconTheme` 深度集成，可通过主题统一控制样式

**缺点：**

- 仅支持单色图标，无法显示多色/渐变图标（需用 `ShaderMask` 等额外处理）
- Material Icons 图标库体积较大，若只用少量图标会增加包体积

**注意事项：**

- `Icon` 本身**不可点击**，需要交互请包裹在 `IconButton`、`GestureDetector` 等组件中
- `color` 未指定时会沿 Widget 树向上查找最近的 `IconTheme`，再找不到则使用 `ThemeData` 中的默认值，而非黑色
- `size` 未指定时默认值为 24.0，同时也决定了组件占据的空间大小
- `semanticLabel` 建议始终设置，否则图标对无障碍用户不可见
- `Icons.arrow_back` 等方向性图标会根据 `textDirection` 自动镜像（RTL 布局下翻转），如不需要可手动指定 `textDirection`



## 11. Image

**一、一句话说明**

`Image` 是 Flutter 中用于显示各种来源（网络、本地资源、文件、内存）图片的核心组件。

**二、应用场景**

- 显示网络图片（如用户头像、商品图片）
- 加载应用内置的资源图片（如 Logo、引导页插图）
- 从设备文件系统读取图片（如相册选取的照片）
- 图片画廊 / 轮播图 / Banner 展示
- 背景图装饰（配合 `DecorationImage` 或 `Stack` 使用）

**三、核心属性**

**通用构造函数共有属性：**

| 属性名                | 类型                       | 说明                                                  |
| --------------------- | -------------------------- | ----------------------------------------------------- |
| image（默认构造函数） | `ImageProvider`            | 图片数据源，如 `NetworkImage`、`AssetImage` 等        |
| width                 | `double?`                  | 图片显示宽度                                          |
| height                | `double?`                  | 图片显示高度                                          |
| fit                   | `BoxFit?`                  | 图片在给定空间内的适配方式（cover、contain、fill 等） |
| alignment             | `AlignmentGeometry`        | 图片在容器内的对齐方式                                |
| repeat                | `ImageRepeat`              | 当图片未填满容器时的重复平铺方式                      |
| color                 | `Color?`                   | 与 `colorBlendMode` 配合，对图片进行颜色混合          |
| colorBlendMode        | `BlendMode?`               | 颜色混合模式                                          |
| filterQuality         | `FilterQuality`            | 图片缩放时的滤波质量                                  |
| semanticLabel         | `String?`                  | 无障碍语义描述                                        |
| excludeFromSemantics  | `bool`                     | 是否从语义树中排除该图片                              |
| gaplessPlayback       | `bool`                     | 图片源切换时是否保留旧图直到新图加载完成              |
| isAntiAlias           | `bool`                     | 是否启用抗锯齿                                        |
| opacity               | `Animation<double>?`       | 控制图片透明度，可结合动画使用                        |
| frameBuilder          | `ImageFrameBuilder?`       | 自定义每帧图片构建逻辑（可用于淡入动画）              |
| loadingBuilder        | `ImageLoadingBuilder?`     | 自定义加载过程中的 UI（如进度指示器）                 |
| errorBuilder          | `ImageErrorWidgetBuilder?` | 图片加载失败时的兜底 UI                               |

**常用命名构造函数：**

| 构造函数                        | 说明                                               |
| ------------------------------- | -------------------------------------------------- |
| `Image.network(String src)`     | 从网络 URL 加载图片                                |
| `Image.asset(String name)`      | 从应用资源包（pubspec.yaml 声明的 assets）加载图片 |
| `Image.file(File file)`         | 从本地文件加载图片                                 |
| `Image.memory(Uint8List bytes)` | 从内存字节数据加载图片                             |

**`Image.network` 额外常用属性：**

| 属性名      | 类型                   | 说明                                 |
| ----------- | ---------------------- | ------------------------------------ |
| headers     | `Map<String, String>?` | 请求图片时附带的 HTTP 头             |
| scale       | `double`               | 图片缩放因子                         |
| cacheWidth  | `int?`                 | 解码时缓存的目标宽度（减少内存占用） |
| cacheHeight | `int?`                 | 解码时缓存的目标高度（减少内存占用） |

**`Image.asset` 额外常用属性：**

| 属性名      | 类型      | 说明                                          |
| ----------- | --------- | --------------------------------------------- |
| package     | `String?` | 图片所在的 package 名称（跨包引用资源时使用） |
| scale       | `double?` | 图片缩放因子                                  |
| cacheWidth  | `int?`    | 解码时缓存的目标宽度                          |
| cacheHeight | `int?`    | 解码时缓存的目标高度                          |

**四、优缺点与注意事项**

**优点：**

- 多种构造函数覆盖几乎所有图片来源，开箱即用
- 内置图片缓存机制（`ImageCache`），相同 key 的图片不会重复加载
- `loadingBuilder` 和 `errorBuilder` 可直接处理加载态和异常态，无需额外状态管理
- `cacheWidth` / `cacheHeight` 可在解码层面压缩分辨率，有效降低内存占用

**缺点：**

- `Image.network` 的缓存仅为**内存缓存**，不提供磁盘缓存，应用重启后需重新下载（生产环境建议使用 `cached_network_image` 等第三方库）
- 不支持 SVG 格式（需使用 `flutter_svg` 等第三方库）
- 大量高分辨率图片同时加载容易导致内存峰值过高

**注意事项：**

- 使用 `Image.asset` 前必须在 `pubspec.yaml` 的 `assets` 中声明图片路径，否则运行时报错
- 未指定 `width` / `height` 时，图片会尝试以原始尺寸渲染；在无约束环境下可能撑满或溢出布局
- 高分辨率大图务必设置 `cacheWidth` / `cacheHeight`，否则会按原始分辨率解码到内存，极易造成 OOM
- `BoxFit.cover` 会裁剪超出部分，`BoxFit.contain` 可能留白——根据实际需求选择
- `gaplessPlayback` 设为 `true` 可避免切换图片时出现闪白，适用于头像、轮播等场景
- `frameBuilder` 适合做首帧渐显动画，`loadingBuilder` 适合做带进度条的加载指示，两者职责不同，不要混淆



## 12. ListView

**一、一句话说明**

ListView 是 Flutter 中最常用的可滚动列表组件，用于在垂直或水平方向上线性排列一组子组件。

**二、应用场景**

- 聊天消息列表、通讯录等长列表展示
- 设置页面中多个选项的纵向排列
- 商品列表、新闻资讯等信息流展示
- 水平滑动的标签栏、图片画廊
- 动态加载的分页数据列表（配合 `ListView.builder`）

**三、核心属性**

| 属性名                  | 类型                              | 说明                                   |
| ----------------------- | --------------------------------- | -------------------------------------- |
| children                | List<Widget>                      | 直接传入子组件列表（仅默认构造函数）   |
| itemBuilder             | IndexedWidgetBuilder              | 按需构建子项的回调（builder 构造函数） |
| itemCount               | int?                              | 子项数量（builder/separated 构造函数） |
| separatorBuilder        | IndexedWidgetBuilder              | 分隔线构建回调（separated 构造函数）   |
| scrollDirection         | Axis                              | 滚动方向，默认 Axis.vertical           |
| reverse                 | bool                              | 是否反向排列                           |
| controller              | ScrollController?                 | 滚动控制器，用于监听/控制滚动位置      |
| primary                 | bool?                             | 是否使用父级 PrimaryScrollController   |
| physics                 | ScrollPhysics?                    | 滚动物理效果（弹性、固定等）           |
| shrinkWrap              | bool                              | 是否根据内容收缩高度，而非填满父容器   |
| padding                 | EdgeInsetsGeometry?               | 列表内边距                             |
| itemExtent              | double?                           | 强制每个子项固定高度（可提升性能）     |
| prototypeItem           | Widget?                           | 用一个原型子项推算所有子项尺寸         |
| cacheExtent             | double?                           | 预渲染区域的像素范围                   |
| addAutomaticKeepAlives  | bool                              | 是否自动用 AutomaticKeepAlive 包裹子项 |
| addRepaintBoundaries    | bool                              | 是否自动用 RepaintBoundary 包裹子项    |
| addSemanticIndexes      | bool                              | 是否自动添加语义索引                   |
| clipBehavior            | Clip                              | 内容裁剪行为                           |
| keyboardDismissBehavior | ScrollViewKeyboardDismissBehavior | 滚动时键盘收起策略                     |
| dragStartBehavior       | DragStartBehavior                 | 拖拽起始行为                           |
| restorationId           | String?                           | 状态恢复标识符                         |

**四、优缺点与注意事项**

**优点：**

- 提供多种构造函数（默认、builder、separated、custom），适配不同场景
- `ListView.builder` 按需创建子项，天然支持大数据量列表的懒加载渲染
- 设置 `itemExtent` 后可跳过子项布局计算，显著提升滚动性能

**缺点：**

- 默认构造函数一次性构建所有 children，数据量大时性能差
- 不支持多列网格布局，需改用 GridView 或 SliverList

**新手易踩的坑：**

- **`shrinkWrap: true` 滥用**：会一次性计算所有子项高度，列表长时严重影响性能，且失去懒加载优势；应优先通过 `Expanded` 或固定高度容器约束
- **嵌套滚动冲突**：ListView 嵌套在 Column 中未限制高度会报错，需用 `Expanded` 包裹或设置 `shrinkWrap: true`
- **ListView 嵌套 ListView**：内层需设置 `shrinkWrap: true` + `physics: NeverScrollableScrollPhysics()`，否则滚动冲突；但更推荐用 CustomScrollView + Sliver 组合替代
- **忘记设置 `itemCount`**：`ListView.builder` 不传 itemCount 会生成无限列表，itemBuilder 返回 null 不再是合法终止方式
- **Key 缺失**：列表项有状态变化（增删改）时，未给子项设置唯一 Key 会导致状态错乱



## 13. AppBar

**一、一句话说明**

AppBar 是 Flutter 中的顶部应用栏组件，用于在页面顶部展示标题、导航按钮和操作按钮等内容。

**二、应用场景**

- 页面顶部显示标题文字和返回按钮
- 顶部栏右侧放置搜索、分享、更多菜单等操作按钮
- 配合 TabBar 实现顶部选项卡导航
- 带搜索输入框的搜索栏页面
- 结合 SliverAppBar 实现滚动折叠效果的基础结构

**三、核心属性**

| 属性名                    | 类型                  | 说明                                                         |
| ------------------------- | --------------------- | ------------------------------------------------------------ |
| leading                   | Widget?               | 左侧组件，通常为返回按钮或菜单图标                           |
| automaticallyImplyLeading | bool                  | 是否自动推断 leading（如有 Drawer 显示菜单图标，可返回时显示返回箭头） |
| title                     | Widget?               | 标题组件，通常为 Text                                        |
| centerTitle               | bool?                 | 标题是否居中显示                                             |
| actions                   | List<Widget>?         | 右侧操作按钮列表                                             |
| flexibleSpace             | Widget?               | 堆叠在 AppBar 背后的组件，通常配合 FlexibleSpaceBar 使用     |
| bottom                    | PreferredSizeWidget?  | AppBar 底部组件，通常放 TabBar                               |
| elevation                 | double?               | 阴影高度                                                     |
| scrolledUnderElevation    | double?               | 内容滚动到 AppBar 下方时的阴影高度                           |
| shadowColor               | Color?                | 阴影颜色                                                     |
| surfaceTintColor          | Color?                | Material 3 表面着色颜色                                      |
| backgroundColor           | Color?                | 背景颜色                                                     |
| foregroundColor           | Color?                | 前景颜色（标题、图标等的默认颜色）                           |
| iconTheme                 | IconThemeData?        | 图标主题样式                                                 |
| actionsIconTheme          | IconThemeData?        | actions 区域图标主题样式                                     |
| titleTextStyle            | TextStyle?            | 标题文本样式                                                 |
| toolbarTextStyle          | TextStyle?            | 工具栏中其他文本的样式                                       |
| shape                     | ShapeBorder?          | AppBar 的形状（如圆角）                                      |
| toolbarHeight             | double?               | 工具栏高度                                                   |
| toolbarOpacity            | double                | 工具栏透明度                                                 |
| bottomOpacity             | double                | bottom 区域透明度                                            |
| leadingWidth              | double?               | leading 组件的宽度                                           |
| titleSpacing              | double?               | title 与 leading/actions 之间的间距                          |
| primary                   | bool                  | 是否在状态栏下方留出安全区域padding                          |
| systemOverlayStyle        | SystemUiOverlayStyle? | 状态栏图标/文字亮暗模式及状态栏颜色                          |
| clipBehavior              | Clip?                 | 内容裁剪行为                                                 |
| forceMaterialTransparency | bool                  | 是否强制背景透明（去除 Material 背景）                       |

**四、优缺点与注意事项**

**优点：**

- 高度集成化，leading / title / actions 三段式布局开箱即用
- 自动处理导航返回按钮和 Drawer 菜单图标，无需手动判断
- 通过 bottom 可无缝集成 TabBar，实现标准 Material 选项卡

**缺点：**

- 高度自定义困难，非标准布局（如多行标题、复杂嵌套）时需大量覆盖或改用自定义组件
- Material 3 默认带有 `scrolledUnderElevation` 的色调变化，视觉效果可能与设计稿不符

**新手易踩的坑：**

- **Material 3 滚动变色**：Flutter 3.x 默认启用 Material 3，页面滚动时 AppBar 背景会出现色调覆盖层，需将 `scrolledUnderElevation` 设为 0 或 `surfaceTintColor` 设为透明来消除
- **centerTitle 跨平台差异**：Android 默认左对齐，iOS 默认居中；若需统一需显式设置 `centerTitle`
- **title 溢出**：标题文字过长时会溢出，应在 Text 中设置 `overflow: TextOverflow.ellipsis` 并用 `maxLines: 1` 限制
- **bottom 类型限制**：bottom 要求 `PreferredSizeWidget`，直接传普通 Widget 会编译报错；自定义组件需实现 `PreferredSizeWidget` 或用 `PreferredSize` 包裹
- **leading 被自动覆盖**：当 Scaffold 有 Drawer 时，leading 会被自动替换为菜单图标；若需自定义 leading，应将 `automaticallyImplyLeading` 设为 false



## 14. ElevatedButton

**一、一句话说明**

ElevatedButton 是 Flutter 中带有阴影和背景填充的 Material 风格凸起按钮，用于触发主要操作。

**二、应用场景**

- 表单提交按钮（登录、注册、保存）
- 页面中的主要行动号召按钮（CTA）
- 对话框中的确认/取消操作按钮
- 购物车中的"立即购买""加入购物车"等关键操作
- 引导流程中的"下一步"按钮

**三、核心属性**

| 属性名        | 类型          | 说明                                                 |
| ------------- | ------------- | ---------------------------------------------------- |
| onPressed     | VoidCallback? | 点击回调，为 null 时按钮置灰禁用                     |
| onLongPress   | VoidCallback? | 长按回调                                             |
| child         | Widget?       | 按钮内容，通常为 Text 或 Row（图标+文字）            |
| style         | ButtonStyle?  | 按钮样式，控制颜色、形状、内边距、阴影等全部视觉属性 |
| autofocus     | bool          | 是否自动获取焦点                                     |
| focusNode     | FocusNode?    | 焦点控制节点                                         |
| clipBehavior  | Clip          | 内容裁剪行为                                         |
| iconAlignment | IconAlignment | 图标对齐方向（用于 ElevatedButton.icon 构造函数）    |

**ButtonStyle 常用子属性（通过 `style` 或 `ElevatedButton.styleFrom` 设置）：**

| 属性名                  | 类型                   | 说明                               |
| ----------------------- | ---------------------- | ---------------------------------- |
| foregroundColor         | Color?                 | 文字与图标颜色                     |
| backgroundColor         | Color?                 | 背景填充颜色                       |
| disabledForegroundColor | Color?                 | 禁用状态下前景颜色                 |
| disabledBackgroundColor | Color?                 | 禁用状态下背景颜色                 |
| shadowColor             | Color?                 | 阴影颜色                           |
| surfaceTintColor        | Color?                 | Material 3 表面着色颜色            |
| elevation               | double?                | 阴影高度                           |
| padding                 | EdgeInsetsGeometry?    | 内边距                             |
| minimumSize             | Size?                  | 按钮最小尺寸                       |
| maximumSize             | Size?                  | 按钮最大尺寸                       |
| fixedSize               | Size?                  | 按钮固定尺寸                       |
| side                    | BorderSide?            | 边框样式                           |
| shape                   | OutlinedBorder?        | 按钮形状（圆角、圆形等）           |
| textStyle               | TextStyle?             | 文字样式（字号、字重等，不含颜色） |
| tapTargetSize           | MaterialTapTargetSize? | 点击目标区域大小策略               |
| animationDuration       | Duration?              | 状态切换动画时长                   |
| overlayColor            | Color?                 | 按压/悬浮时的水波纹覆盖色          |
| iconColor               | Color?                 | 图标颜色                           |
| iconSize                | double?                | 图标尺寸                           |

**四、优缺点与注意事项**

**优点：**

- 自带阴影和背景填充，视觉层级最高，适合作为页面主操作按钮
- `ElevatedButton.styleFrom` 提供简洁的样式快捷方式，无需手动包裹 `WidgetStateProperty`
- `ElevatedButton.icon` 构造函数可快速创建带图标的按钮
- `onPressed` 设为 null 即自动进入禁用态，状态管理直观

**缺点：**

- 样式深度定制需通过 `ButtonStyle` + `WidgetStateProperty` 逐状态配置，写法较冗长
- Material 3 下默认视觉风格（圆角、色调映射）与 Material 2 差异较大，升级时可能需要调整

**新手易踩的坑：**

- **`textStyle` 中设颜色无效**：`styleFrom` 的 `textStyle` 仅控制字号、字重等，文字颜色应通过 `foregroundColor` 设置，两者职责分离
- **按钮有默认最小尺寸和内边距**：即使 child 很小，按钮仍占据默认 `minimumSize`（64×36）和 padding；需通过 `minimumSize: Size.zero` + `padding: EdgeInsets.zero` + `tapTargetSize: MaterialTapTargetSize.shrinkWrap` 三者同时设置才能完全紧凑
- **禁用态不响应手势**：`onPressed` 为 null 时，外层包裹的 GestureDetector/InkWell 也会被按钮拦截，需注意事件传递
- **Material 3 阴影弱化**：Material 3 中 ElevatedButton 默认 elevation 为 1 且使用 surfaceTint 替代阴影，视觉上可能看不到明显凸起，可手动调大 `elevation` 或设置 `surfaceTintColor: Colors.transparent`
- **与其他按钮的选择混淆**：ElevatedButton 用于最高优先级操作；次要操作应用 `OutlinedButton` 或 `TextButton`，避免页面中多个 ElevatedButton 争夺视觉焦点



## 15. TextField

**一、一句话说明**

TextField 是 Flutter 中最基础的文本输入组件，用于接收用户的键盘输入内容。

**二、应用场景**

- 登录/注册页面的用户名、密码输入框
- 搜索栏输入关键词
- 表单中填写姓名、地址、备注等信息
- 聊天界面底部的消息输入框
- 带验证的多字段数据录入表单（配合 TextFormField）

**三、核心属性**

| 属性名                     | 类型                            | 说明                                                 |
| -------------------------- | ------------------------------- | ---------------------------------------------------- |
| controller                 | TextEditingController?          | 文本控制器，用于获取/设置输入内容、监听变化          |
| focusNode                  | FocusNode?                      | 焦点控制节点，用于手动聚焦/失焦                      |
| decoration                 | InputDecoration?                | 输入框装饰，控制标签、提示文字、边框、图标等全部外观 |
| keyboardType               | TextInputType?                  | 键盘类型（文本、数字、邮箱、电话等）                 |
| textInputAction            | TextInputAction?                | 键盘回车键类型（完成、下一个、搜索、发送等）         |
| style                      | TextStyle?                      | 输入文本的样式                                       |
| textAlign                  | TextAlign                       | 文本水平对齐方式                                     |
| textAlignVertical          | TextAlignVertical?              | 文本垂直对齐方式                                     |
| textDirection              | TextDirection?                  | 文本方向（LTR/RTL）                                  |
| readOnly                   | bool                            | 是否只读（可选中复制但不可编辑）                     |
| enabled                    | bool?                           | 是否启用（false 时置灰且不可交互）                   |
| obscureText                | bool                            | 是否隐藏输入内容（密码模式）                         |
| obscuringCharacter         | String                          | 密码模式下的遮掩字符                                 |
| maxLines                   | int?                            | 最大行数，null 为不限，1 为单行                      |
| minLines                   | int?                            | 最小行数（输入框初始高度）                           |
| maxLength                  | int?                            | 最大字符数，设置后自动显示计数器                     |
| maxLengthEnforcement       | MaxLengthEnforcement?           | 超出最大字符数时的限制策略                           |
| expands                    | bool                            | 是否扩展填满父容器高度                               |
| inputFormatters            | List<TextInputFormatter>?       | 输入格式化器列表（过滤字符、格式限制等）             |
| onChanged                  | ValueChanged<String>?           | 输入内容每次变化时的回调                             |
| onSubmitted                | ValueChanged<String>?           | 键盘提交（回车）时的回调                             |
| onTap                      | GestureTapCallback?             | 点击输入框时的回调                                   |
| onTapOutside               | TapRegionCallback?              | 点击输入框外部时的回调                               |
| onEditingComplete          | VoidCallback?                   | 编辑完成时的回调（在 onSubmitted 之前触发）          |
| autocorrect                | bool                            | 是否启用自动纠错                                     |
| enableSuggestions          | bool                            | 是否启用输入建议                                     |
| autofocus                  | bool                            | 是否自动获取焦点                                     |
| autofillHints              | Iterable<String>?               | 自动填充提示（用户名、密码、邮箱等）                 |
| cursorColor                | Color?                          | 光标颜色                                             |
| cursorWidth                | double                          | 光标宽度                                             |
| cursorHeight               | double?                         | 光标高度                                             |
| cursorRadius               | Radius?                         | 光标圆角                                             |
| showCursor                 | bool?                           | 是否显示光标                                         |
| selectionControls          | TextSelectionControls?          | 文本选择控件样式（剪切/复制/粘贴菜单）               |
| contextMenuBuilder         | EditableTextContextMenuBuilder? | 自定义右键/长按上下文菜单                            |
| scrollController           | ScrollController?               | 输入框内部滚动控制器                                 |
| scrollPhysics              | ScrollPhysics?                  | 输入框内部滚动物理效果                               |
| clipBehavior               | Clip                            | 内容裁剪行为                                         |
| textCapitalization         | TextCapitalization              | 文本大写策略（句首、单词、全部）                     |
| enableInteractiveSelection | bool?                           | 是否允许交互式选择文本                               |
| undoController             | UndoHistoryController?          | 撤销/重做控制器                                      |

**InputDecoration 常用子属性（通过 `decoration` 设置）：**

| 属性名                | 类型                   | 说明                                                  |
| --------------------- | ---------------------- | ----------------------------------------------------- |
| labelText             | String?                | 浮动标签文字                                          |
| hintText              | String?                | 占位提示文字                                          |
| helperText            | String?                | 输入框下方的帮助文字                                  |
| errorText             | String?                | 错误提示文字（非 null 时进入错误态）                  |
| counterText           | String?                | 自定义计数器文字（替代默认字符计数）                  |
| prefixIcon            | Widget?                | 输入框内左侧图标                                      |
| suffixIcon            | Widget?                | 输入框内右侧图标                                      |
| prefix                | Widget?                | 输入文本前的内联组件                                  |
| suffix                | Widget?                | 输入文本后的内联组件                                  |
| prefixText            | String?                | 输入文本前的固定文本                                  |
| suffixText            | String?                | 输入文本后的固定文本                                  |
| icon                  | Widget?                | 输入框外左侧图标                                      |
| border                | InputBorder?           | 边框样式（OutlineInputBorder / UnderlineInputBorder） |
| enabledBorder         | InputBorder?           | 启用未聚焦时的边框                                    |
| focusedBorder         | InputBorder?           | 聚焦时的边框                                          |
| errorBorder           | InputBorder?           | 错误未聚焦时的边框                                    |
| focusedErrorBorder    | InputBorder?           | 错误且聚焦时的边框                                    |
| disabledBorder        | InputBorder?           | 禁用时的边框                                          |
| filled                | bool?                  | 是否填充背景色                                        |
| fillColor             | Color?                 | 背景填充颜色                                          |
| contentPadding        | EdgeInsetsGeometry?    | 输入内容区域内边距                                    |
| isDense               | bool?                  | 是否紧凑模式（减少垂直空间）                          |
| isCollapsed           | bool                   | 是否折叠模式（移除所有默认装饰空间）                  |
| constraints           | BoxConstraints?        | 输入框约束尺寸                                        |
| floatingLabelBehavior | FloatingLabelBehavior? | 浮动标签行为（始终浮动/聚焦时浮动/从不浮动）          |

**四、优缺点与注意事项**

**优点：**

- 功能极其丰富，键盘类型、格式化、装饰、回调一应俱全
- InputDecoration 提供了完整的多状态边框和装饰体系，可实现复杂的输入框 UI
- 通过 `inputFormatters` 可灵活实现手机号格式化、仅允许数字等限制

**缺点：**

- InputDecoration 属性极多，配置一个精致的输入框往往代码冗长
- 不同状态的边框需逐一配置（enabled / focused / error / disabled），缺一则可能视觉不一致
- 不自带表单验证能力，需配合 `TextFormField` + `Form` 使用

**新手易踩的坑：**

- **controller 内存泄漏**：`TextEditingController` 必须在 `dispose` 中手动销毁，否则造成内存泄漏
- **onChanged 与 controller.addListener 重复监听**：两者都能监听输入变化，同时使用容易触发重复逻辑，选其一即可
- **maxLines 与 obscureText 冲突**：`obscureText: true` 要求 `maxLines` 必须为 1，否则抛出断言错误
- **键盘遮挡输入框**：输入框在页面底部时，弹出键盘可能遮挡；需确保外层有 `Scaffold`（其 `resizeToAvoidBottomInset` 默认为 true）或用 `SingleChildScrollView` 包裹
- **decoration 设为 null 与 InputDecoration.collapsed 的区别**：设 `decoration: null` 会移除所有装饰但保留默认内边距不可控；要完全去除装饰和空间应使用 `InputDecoration.collapsed`
- **onSubmitted 不触发**：`maxLines` 不为 1 时，回车键变为换行而非提交，`onSubmitted` 不会被调用
- **enabled: false 与 readOnly 混淆**：`enabled: false` 完全禁用（置灰、不可聚焦）；`readOnly: true` 仍可聚焦、选中复制，只是不弹出键盘编辑



## 16. TextFormField

**一、一句话说明**

`TextFormField` 是 `TextField` 的 `Form` 封装版本，用于在表单中接收用户文本输入并提供内置的验证、保存和重置能力。

**二、应用场景**

- 登录/注册页面的用户名、密码、邮箱等输入项
- 带有实时校验的多字段表单（如收货地址、个人信息填写）
- 搜索框需要与 `Form` 联动进行提交前校验的场景
- 需要在提交时统一调用 `save()` 收集多个字段值的业务表单
- 评论、反馈等需要字数限制与格式校验的输入场景

**三、核心属性**

| 属性名                       | 类型                                                | 说明                                                        |
| ---------------------------- | --------------------------------------------------- | ----------------------------------------------------------- |
| `controller`                 | `TextEditingController?`                            | 控制和读取输入框的文本内容                                  |
| `initialValue`               | `String?`                                           | 初始文本值（与 `controller` 互斥，二者只能传一个）          |
| `decoration`                 | `InputDecoration?`                                  | 输入框装饰，含 label、hint、icon、border、errorText 等      |
| `keyboardType`               | `TextInputType?`                                    | 弹出键盘类型（文本、数字、邮箱、电话等）                    |
| `textInputAction`            | `TextInputAction?`                                  | 键盘右下角动作按钮类型（完成、下一项、搜索等）              |
| `textCapitalization`         | `TextCapitalization`                                | 文本大小写策略（句首、单词、全部、无）                      |
| `style`                      | `TextStyle?`                                        | 输入文本的样式                                              |
| `textAlign`                  | `TextAlign`                                         | 文本水平对齐方式                                            |
| `textAlignVertical`          | `TextAlignVertical?`                                | 文本垂直对齐方式                                            |
| `textDirection`              | `TextDirection?`                                    | 文本方向（LTR / RTL）                                       |
| `readOnly`                   | `bool`                                              | 是否只读（仍可聚焦和选中文本）                              |
| `showCursor`                 | `bool?`                                             | 是否显示光标                                                |
| `obscureText`                | `bool`                                              | 是否隐藏输入内容（密码模式）                                |
| `obscuringCharacter`         | `String`                                            | 隐藏时使用的替代字符                                        |
| `autocorrect`                | `bool`                                              | 是否启用自动纠错                                            |
| `enableSuggestions`          | `bool`                                              | 是否启用输入建议                                            |
| `maxLines`                   | `int?`                                              | 最大行数（设为 `null` 可自动扩展，设为 1 为单行）           |
| `minLines`                   | `int?`                                              | 最小行数                                                    |
| `maxLength`                  | `int?`                                              | 最大字符数（会自动显示计数器）                              |
| `maxLengthEnforcement`       | `MaxLengthEnforcement?`                             | 超出最大长度时的强制策略                                    |
| `inputFormatters`            | `List<TextInputFormatter>?`                         | 输入格式化器列表（如只允许数字、正则过滤等）                |
| `enabled`                    | `bool?`                                             | 是否启用（禁用后不可交互且视觉置灰）                        |
| `expands`                    | `bool`                                              | 是否填满父容器高度（需 `maxLines` 和 `minLines` 均为 null） |
| `focusNode`                  | `FocusNode?`                                        | 焦点节点，用于控制和监听焦点状态                            |
| `autofocus`                  | `bool`                                              | 是否自动获取焦点                                            |
| `cursorColor`                | `Color?`                                            | 光标颜色                                                    |
| `cursorWidth`                | `double`                                            | 光标宽度                                                    |
| `cursorHeight`               | `double?`                                           | 光标高度                                                    |
| `cursorRadius`               | `Radius?`                                           | 光标圆角                                                    |
| `scrollPadding`              | `EdgeInsets`                                        | 滚动时输入框与可视区域边缘的内边距                          |
| `enableInteractiveSelection` | `bool?`                                             | 是否允许长按选中、拖拽选择等交互                            |
| `selectionControls`          | `TextSelectionControls?`                            | 自定义文本选择控件（复制/粘贴工具栏）                       |
| `autofillHints`              | `Iterable<String>?`                                 | 自动填充提示（如用户名、密码、邮箱等语义）                  |
| `autovalidateMode`           | `AutovalidateMode?`                                 | 自动校验时机（禁用、始终、用户交互后）                      |
| `validator`                  | `String? Function(String?)?`                        | 校验函数，返回非 null 字符串表示校验失败并显示错误信息      |
| `onSaved`                    | `void Function(String?)?`                           | 调用 `FormState.save()` 时触发，用于收集字段值              |
| `onChanged`                  | `void Function(String)?`                            | 文本内容每次变化时回调                                      |
| `onTap`                      | `void Function()?`                                  | 点击输入框时回调                                            |
| `onTapOutside`               | `void Function(PointerDownEvent)?`                  | 点击输入框外部时回调（常用于收起键盘）                      |
| `onEditingComplete`          | `void Function()?`                                  | 用户完成编辑（按下键盘完成键）时回调                        |
| `onFieldSubmitted`           | `void Function(String)?`                            | 用户提交字段（按下键盘完成键）时回调并传入当前值            |
| `scrollController`           | `ScrollController?`                                 | 内容超长时滚动控制器                                        |
| `restorationId`              | `String?`                                           | 状态恢复标识（用于应用恢复场景）                            |
| `contextMenuBuilder`         | `Widget Function(BuildContext, EditableTextState)?` | 自定义右键/长按上下文菜单                                   |
| `mouseCursor`                | `MouseCursor?`                                      | 鼠标悬停时的光标样式（桌面端）                              |

**四、优缺点与注意事项**

**优点：**

- 与 `Form` / `FormState` 无缝集成，一行 `validate()` / `save()` / `reset()` 即可统一管理所有字段
- 内置 `validator` 返回错误文本即自动渲染到 `decoration.errorText` 位置，无需手动管理错误状态
- 本质是对 `TextField` + `FormField<String>` 的组合，保留了 `TextField` 的全部能力

**缺点：**

- 必须有上层 `Form` 祖先才能使用 `validate` / `save` / `reset` 等表单能力，单独使用与 `TextField` 无异
- 复杂的联动校验（跨字段依赖）仍需额外逻辑，`validator` 仅针对单字段

**注意事项：**

- `controller` 和 `initialValue` **不能同时传入**，否则会抛断言错误；使用 `controller` 时通过 `controller.text` 设初始值
- 使用 `controller` 时务必在 `dispose` 中释放，否则内存泄漏
- `autovalidateMode` 设为 `always` 会在首次构建就触发校验，通常应使用 `onUserInteraction` 以避免用户还没输入就报红
- `obscureText: true` 时 `maxLines` 必须为 1，否则抛异常
- `validator` 返回 `null` 表示校验通过，返回字符串表示失败——新手常反写逻辑
- 在 `ListView` 等滚动容器中使用时，注意 `scrollPadding` 的设置，避免键盘弹出后输入框被遮挡



## 17. GestureDetector

**一、一句话说明**

`GestureDetector` 是一个无可视外观的手势识别组件，用于检测用户对其子组件的点击、双击、长按、拖拽、缩放等各类触摸/指针交互。

**二、应用场景**

- 为无交互能力的组件（如 `Container`、`Image`、`Text`）添加点击事件
- 实现图片的双指缩放、旋转等多点触控交互
- 自定义可拖拽的悬浮按钮或可拖动排序的卡片
- 检测长按弹出上下文菜单或操作面板
- 监听滑动方向实现手势导航或侧滑删除

**三、核心属性**

| 属性名                      | 类型                                         | 说明                                                |
| --------------------------- | -------------------------------------------- | --------------------------------------------------- |
| `child`                     | `Widget?`                                    | 被手势检测包裹的子组件                              |
| `onTap`                     | `void Function()?`                           | 单击回调                                            |
| `onTapDown`                 | `void Function(TapDownDetails)?`             | 手指按下时回调（在确认为点击之前）                  |
| `onTapUp`                   | `void Function(TapUpDetails)?`               | 手指抬起时回调                                      |
| `onTapCancel`               | `void Function()?`                           | 点击被取消时回调（如按下后滑走）                    |
| `onDoubleTap`               | `void Function()?`                           | 双击回调                                            |
| `onDoubleTapDown`           | `void Function(TapDownDetails)?`             | 双击的第二次按下时回调                              |
| `onDoubleTapCancel`         | `void Function()?`                           | 双击被取消时回调                                    |
| `onLongPress`               | `void Function()?`                           | 长按回调                                            |
| `onLongPressStart`          | `void Function(LongPressStartDetails)?`      | 长按开始时回调（含位置信息）                        |
| `onLongPressMoveUpdate`     | `void Function(LongPressMoveUpdateDetails)?` | 长按后移动时持续回调                                |
| `onLongPressEnd`            | `void Function(LongPressEndDetails)?`        | 长按结束时回调                                      |
| `onLongPressUp`             | `void Function()?`                           | 长按后手指抬起回调                                  |
| `onLongPressCancel`         | `void Function()?`                           | 长按被取消时回调                                    |
| `onSecondaryTap`            | `void Function()?`                           | 鼠标右键单击回调（桌面端）                          |
| `onSecondaryTapDown`        | `void Function(TapDownDetails)?`             | 鼠标右键按下回调                                    |
| `onSecondaryTapUp`          | `void Function(TapUpDetails)?`               | 鼠标右键抬起回调                                    |
| `onSecondaryTapCancel`      | `void Function()?`                           | 鼠标右键点击取消回调                                |
| `onSecondaryLongPress`      | `void Function()?`                           | 鼠标右键长按回调                                    |
| `onTertiaryTapDown`         | `void Function(TapDownDetails)?`             | 鼠标中键按下回调                                    |
| `onTertiaryTapUp`           | `void Function(TapUpDetails)?`               | 鼠标中键抬起回调                                    |
| `onTertiaryTapCancel`       | `void Function()?`                           | 鼠标中键点击取消回调                                |
| `onVerticalDragDown`        | `void Function(DragDownDetails)?`            | 垂直拖拽手指按下回调                                |
| `onVerticalDragStart`       | `void Function(DragStartDetails)?`           | 垂直拖拽开始回调                                    |
| `onVerticalDragUpdate`      | `void Function(DragUpdateDetails)?`          | 垂直拖拽过程中持续回调（含偏移量）                  |
| `onVerticalDragEnd`         | `void Function(DragEndDetails)?`             | 垂直拖拽结束回调（含速度）                          |
| `onVerticalDragCancel`      | `void Function()?`                           | 垂直拖拽取消回调                                    |
| `onHorizontalDragDown`      | `void Function(DragDownDetails)?`            | 水平拖拽手指按下回调                                |
| `onHorizontalDragStart`     | `void Function(DragStartDetails)?`           | 水平拖拽开始回调                                    |
| `onHorizontalDragUpdate`    | `void Function(DragUpdateDetails)?`          | 水平拖拽过程中持续回调                              |
| `onHorizontalDragEnd`       | `void Function(DragEndDetails)?`             | 水平拖拽结束回调                                    |
| `onHorizontalDragCancel`    | `void Function()?`                           | 水平拖拽取消回调                                    |
| `onPanDown`                 | `void Function(DragDownDetails)?`            | 任意方向拖拽按下回调（不可与水平/垂直拖拽同时使用） |
| `onPanStart`                | `void Function(DragStartDetails)?`           | 任意方向拖拽开始回调                                |
| `onPanUpdate`               | `void Function(DragUpdateDetails)?`          | 任意方向拖拽持续回调                                |
| `onPanEnd`                  | `void Function(DragEndDetails)?`             | 任意方向拖拽结束回调                                |
| `onPanCancel`               | `void Function()?`                           | 任意方向拖拽取消回调                                |
| `onScaleStart`              | `void Function(ScaleStartDetails)?`          | 缩放手势开始回调                                    |
| `onScaleUpdate`             | `void Function(ScaleUpdateDetails)?`         | 缩放过程中持续回调（含缩放比例、旋转角度）          |
| `onScaleEnd`                | `void Function(ScaleEndDetails)?`            | 缩放结束回调                                        |
| `onForcePressStart`         | `void Function(ForcePressDetails)?`          | 压力触控达到阈值时回调（3D Touch）                  |
| `onForcePressPeak`          | `void Function(ForcePressDetails)?`          | 压力达到峰值时回调                                  |
| `onForcePressUpdate`        | `void Function(ForcePressDetails)?`          | 压力变化时持续回调                                  |
| `onForcePressEnd`           | `void Function(ForcePressDetails)?`          | 压力触控结束回调                                    |
| `behavior`                  | `HitTestBehavior?`                           | 命中测试行为：控制透明区域是否响应手势              |
| `excludeFromSemantics`      | `bool`                                       | 是否将手势回调从语义树中排除（无障碍相关）          |
| `dragStartBehavior`         | `DragStartBehavior`                          | 拖拽起始位置的计算方式（按下位置 or 首次移动位置）  |
| `supportedDevices`          | `Set<PointerDeviceKind>?`                    | 限定响应的设备类型（触摸、鼠标、触控笔等）          |
| `trackpadScrollCausesScale` | `bool`                                       | 触控板滚动是否触发缩放手势                          |

**四、优缺点与注意事项**

**优点：**

- 覆盖几乎所有常见手势类型，一个组件即可完成点击、拖拽、缩放等全部检测
- 零视觉侵入，不会引入任何额外的外观或布局（无 padding、无 splash 效果）
- 支持桌面端鼠标右键、中键、触控板等多设备交互

**缺点：**

- 不提供任何视觉反馈（无水波纹、无高亮），需要自行实现；若需要 Material 风格反馈应使用 `InkWell` / `InkResponse`
- 手势种类繁多，回调命名冗长，初次使用有一定学习成本

**注意事项：**

- **`behavior` 是最常踩的坑**：默认值 `deferToChild`，当 `child` 的透明/空白区域不参与命中测试时点击无效；设为 `HitTestBehavior.opaque` 可让整个区域（包括空白部分）都响应手势；设为 `translucent` 则响应手势的同时允许事件继续向下传递
- **Pan 与 Horizontal/Vertical Drag 互斥**：不能同时设置 `onPanXxx` 和 `onHorizontalDragXxx` 或 `onVerticalDragXxx`，否则运行时报错
- **Scale 与 Pan/Drag 互斥**：`onScaleXxx` 已包含单指拖拽能力（`scale=1.0` 时即为平移），不能与 Pan/Drag 系列共存
- **同时设置 `onTap` 和 `onDoubleTap` 时**，`onTap` 会有约 200ms 延迟，因为框架需要等待判断是否为双击；若不需要双击，移除 `onDoubleTap` 可消除延迟
- **手势竞争**：多个 `GestureDetector` 嵌套时，内层会优先获胜（arena 竞技场机制）；复杂场景可能需要 `RawGestureDetector` 自定义竞争策略
- 包裹 `TextField`、`ListView` 等自带手势的组件时，容易发生手势冲突，需谨慎处理



## 18. SafeArea

**一、一句话说明**

`SafeArea` 是一个自动为子组件添加内边距的组件，用于避免内容被系统状态栏、刘海屏、底部导航条、圆角等系统 UI 区域遮挡。

**二、应用场景**

- 全屏页面中防止内容被顶部状态栏或底部 Home Indicator 遮挡
- 刘海屏 / 挖孔屏设备上确保关键内容不被异形区域遮挡
- 横屏模式下避免内容延伸到左右两侧的圆角或传感器区域
- 自定义 `Scaffold` 或不使用 `AppBar` 时手动保障顶部安全距离
- 底部浮动按钮或底部操作栏需要避开系统手势区域

**三、核心属性**

| 属性名                      | 类型         | 说明                                                         |
| --------------------------- | ------------ | ------------------------------------------------------------ |
| `child`                     | `Widget`     | 需要被保护的子组件                                           |
| `top`                       | `bool`       | 是否在顶部添加安全内边距（避开状态栏）                       |
| `bottom`                    | `bool`       | 是否在底部添加安全内边距（避开 Home Indicator 等）           |
| `left`                      | `bool`       | 是否在左侧添加安全内边距（横屏刘海等）                       |
| `right`                     | `bool`       | 是否在右侧添加安全内边距（横屏刘海等）                       |
| `minimum`                   | `EdgeInsets` | 各方向的最小内边距，取系统安全区与此值的较大者               |
| `maintainBottomViewPadding` | `bool`       | 是否保留底部 viewPadding（键盘弹出时是否仍保持底部安全距离） |

**四、优缺点与注意事项**

**优点：**

- 使用极其简单，包一层即可自动适配各种异形屏，无需手动计算安全距离
- 可按方向精细控制是否应用安全边距，灵活度高
- `minimum` 属性可以保证即使在无异形区域的设备上也有最低内边距

**缺点：**

- 本质是通过 `MediaQuery.padding` 插入 `Padding`，会占用实际布局空间；若需要背景延伸到安全区域但内容不被遮挡，需另行处理

**注意事项：**

- **避免重复嵌套**：`Scaffold` 的 `AppBar` 和 `bottomNavigationBar` 已内部处理了安全区域，若再在 `body` 外层包 `SafeArea` 会导致双重内边距；通常只在 `body` 内部或不使用 `AppBar` 时使用
- **`SafeArea` 会消费 `MediaQuery.padding`**：其子树中再通过 `MediaQuery.of(context).padding` 查询时，已被处理的方向会变为 0，这是设计行为，避免重复偏移
- **背景色/背景图需求**：如果希望背景铺满全屏（含状态栏区域）但文字内容安全，应将背景放在 `SafeArea` 外层，`SafeArea` 只包裹内容部分
- **键盘弹出时的行为**：默认情况下键盘弹出后底部安全区域会被键盘取代而消失；若需要键盘弹出时仍保留底部安全边距，可设置 `maintainBottomViewPadding: true`
- **横屏场景容易遗漏**：竖屏开发时常只关注 `top` / `bottom`，切到横屏后刘海可能出现在左或右侧，建议保持 `left` 和 `right` 为 `true`



## 19. Stack

**一、一句话说明**

`Stack` 是一个将子组件按顺序层叠（重叠）放置的布局组件，用于实现多个子组件在同一区域内的叠加定位。

**二、应用场景**

- 在图片上叠加文字标签、渐变遮罩或角标徽章
- 实现头像右上角的未读消息红点 / 数字气泡
- 页面中的浮动按钮或悬浮提示覆盖在内容之上
- 轮播图指示器叠加在轮播内容底部
- 多层动画元素的自由定位与叠加组合

**三、核心属性**

| 属性名          | 类型                | 说明                                                         |
| --------------- | ------------------- | ------------------------------------------------------------ |
| `children`      | `List<Widget>`      | 子组件列表，列表顺序即绘制顺序（后面的在上层）               |
| `alignment`     | `AlignmentGeometry` | 未使用 `Positioned` 包裹的子组件（non-positioned children）的对齐方式 |
| `textDirection` | `TextDirection?`    | 文本方向，影响 `alignment` 中 `start` / `end` 的解析方向     |
| `fit`           | `StackFit`          | 未定位子组件的尺寸约束方式：`loose`（用自身大小）、`expand`（撑满 Stack）、`passthrough`（透传父级约束） |
| `clipBehavior`  | `Clip`              | 子组件超出 Stack 边界时的裁剪行为                            |

**四、优缺点与注意事项**

**优点：**

- 实现叠加布局最直接的方式，配合 `Positioned` 可精确控制每个子组件的绝对位置
- 概念简单，类似 CSS 中的 `position: absolute` + 容器定位
- 子组件绘制顺序即列表顺序，层级关系清晰可控

**缺点：**

- 不适合做流式或线性排列布局，仅用于叠加场景
- Stack 自身大小由 non-positioned children 决定；若所有子组件都是 `Positioned`，Stack 会尝试尽可能大，需要外部约束控制尺寸

**注意事项：**

- **Positioned 与 non-positioned 的区别**：用 `Positioned` 包裹的子组件通过 `top`/`bottom`/`left`/`right` 绝对定位，不受 `alignment` 和 `fit` 影响；未包裹的子组件受 `alignment` 和 `fit` 控制
- **Stack 尺寸计算**：Stack 的大小等于所有 non-positioned children 中最大的那个；若全部子组件都是 `Positioned`，Stack 自身没有固有大小，会尽量填满父级约束，若父级也无约束则可能报错或尺寸为零
- **`clipBehavior` 默认为 `Clip.hardEdge`**：超出边界的子组件会被裁剪；若需要子组件溢出可见（如阴影、徽章超出边缘），需改为 `Clip.none`
- **`fit: StackFit.expand`**：会强制所有 non-positioned children 撑满 Stack，容易意外拉伸不需要铺满的子组件
- **层级顺序**：`children` 列表中索引越大的组件绘制越靠上（越后面越在顶层）；若需要动态调整层级，可使用 `IndexedStack` 或调整列表顺序
- **性能提示**：大量叠加组件或频繁重建时，配合 `RepaintBoundary` 可避免不必要的重绘扩散

## 20. Expanded

**一、一句话说明**

`Expanded` 是一个用于在 `Row`、`Column` 或 `Flex` 中让子组件沿主轴方向填充剩余可用空间的弹性布局组件。

**二、应用场景**

- 在 `Row` 中让某个子组件自动占满剩余宽度（如搜索框旁边的输入区域）
- 在 `Column` 中让列表或内容区域填满剩余高度
- 多个子组件按比例分配空间（如两栏 1:2 布局，分别设置 `flex` 为 1 和 2）
- 在底部导航栏中让按钮均分宽度
- 长文本在 `Row` 中自动换行或截断而不溢出

**三、核心属性**

| 属性名  | 类型     | 说明                                     |
| ------- | -------- | ---------------------------------------- |
| `child` | `Widget` | 需要被扩展填充的子组件                   |
| `flex`  | `int`    | 弹性因子，决定该组件占剩余空间的比例权重 |

**四、优缺点与注意事项**

**优点：**

- API 极简，只需包裹即可实现弹性填充，无需手动计算尺寸
- 多个 `Expanded` 配合 `flex` 即可轻松实现按比例分配空间

**缺点：**

- 功能单一，始终强制子组件填满分配到的空间；若只希望子组件最大可用但不强制拉伸，应使用 `Flexible`（`fit: FlexFit.loose`）

**注意事项：**

- **只能作为 `Row`、`Column`、`Flex` 的直接子组件**：放在其他父组件中会直接报错（`Incorrect use of ParentDataWidget`）
- **`Expanded` 本质是 `Flexible` 的 `fit: FlexFit.tight` 简写**：它会强制子组件精确占满分到的空间；若子组件本身较小且不想被拉伸，应改用 `Flexible`
- **嵌套滚动组件时需注意**：在 `Column` 中用 `Expanded` 包裹 `ListView` 是正确做法，可为其提供有限高度约束；但若 `Column` 本身处于不受约束的滚动容器中，则仍会报错
- **不要在 `Expanded` 内再给子组件设固定主轴尺寸**：如在 `Row` 的 `Expanded` 内给 `Container` 设 `width`，该 `width` 会被忽略，因为 `Expanded` 已强制接管了宽度
- **多个 `Expanded` 的 `flex` 总和决定分配比例**：例如三个 `flex` 分别为 1、2、3，则分别占剩余空间的 1/6、2/6、3/6
- **与固定尺寸子组件混用**：`Row` / `Column` 会先布局非弹性子组件，再将剩余空间分配给 `Expanded`，这是常见且正确的用法



## 21. SingleChildScrollView

**一、一句话说明**

`SingleChildScrollView` 是一个只能包含单个子组件的可滚动容器，用于当内容可能超出屏幕时提供滚动能力。

**二、应用场景**

- 表单页面内容较多，需要整体滚动以防键盘弹起遮挡输入框
- 页面内容略超出屏幕，需简单包裹使其可滚动（如协议页、设置页）
- 配合 `Column` 实现整页纵向滚动布局
- 横向滚动展示一行超宽内容（如横向时间轴、宽表格）
- 在弹窗/底部弹出面板中包裹可能溢出的动态内容

**三、核心属性**

| 属性名                    | 类型                                | 说明                                                         |
| ------------------------- | ----------------------------------- | ------------------------------------------------------------ |
| `child`                   | `Widget?`                           | 唯一子组件                                                   |
| `scrollDirection`         | `Axis`                              | 滚动方向，水平或垂直                                         |
| `reverse`                 | `bool`                              | 是否反向滚动（内容从末尾开始）                               |
| `padding`                 | `EdgeInsetsGeometry?`               | 子组件周围的内边距                                           |
| `controller`              | `ScrollController?`                 | 滚动控制器，用于监听或控制滚动位置                           |
| `physics`                 | `ScrollPhysics?`                    | 滚动物理效果（弹性、固定等）                                 |
| `primary`                 | `bool?`                             | 是否使用 PrimaryScrollController；为 true 时不可同时设置 controller |
| `clipBehavior`            | `Clip`                              | 内容裁剪行为                                                 |
| `restorationId`           | `String?`                           | 用于保存和恢复滚动位置的标识                                 |
| `keyboardDismissBehavior` | `ScrollViewKeyboardDismissBehavior` | 滚动时键盘的关闭策略                                         |
| `dragStartBehavior`       | `DragStartBehavior`                 | 拖拽开始行为的检测方式                                       |

**四、优缺点与注意事项**

**优点：**

- 使用极其简单，直接包裹即可让内容可滚动
- 适合内容量有限但可能略微溢出的场景
- 配合 `Column` + `Expanded`/`Flexible` 等可快速搭建简单滚动页面

**缺点：**

- **不支持懒加载**：子组件会一次性全部构建和布局，内容过多时性能差
- 不适合长列表场景，长列表应使用 `ListView` / `CustomScrollView`

**新手易踩的坑：**

- 在 `SingleChildScrollView` 内部嵌套 `Column` 并给子组件设置 `Expanded` 会报错，因为滚动方向上无边界约束，`Expanded` 无法计算剩余空间
- 键盘弹起时若未设置 `resizeToAvoidBottomInset` 或未正确使用 `padding`，内容可能被遮挡
- 与 `ListView` 等可滚动组件嵌套时，内层需设置 `shrinkWrap: true` + `NeverScrollableScrollPhysics()`，否则会滚动冲突报错
- `reverse: true` 常用于聊天界面让内容从底部开始排列，但初学者容易忽略它会同时反转子组件顺序

## 22. TextButton

**一、一句话说明**

`TextButton` 是 Material Design 风格的文字按钮，没有边框和背景色（默认透明），用于触发次要或低优先级的操作。

**二、应用场景**

- 对话框中的"取消"、"确认"等操作按钮
- 导航栏或页面中的文字链接式操作（如"查看更多"、"跳过"）
- 表单底部的辅助操作（如"忘记密码？"）
- 工具栏或卡片中的低强调操作按钮
- 与 `ElevatedButton` 搭配使用，作为次要操作入口

**三、核心属性**

| 属性名             | 类型            | 说明                                             |
| ------------------ | --------------- | ------------------------------------------------ |
| `child`            | `Widget?`       | 按钮内容，通常为 `Text`                          |
| `onPressed`        | `VoidCallback?` | 点击回调，为 null 时按钮进入禁用状态             |
| `onLongPress`      | `VoidCallback?` | 长按回调                                         |
| `style`            | `ButtonStyle?`  | 自定义按钮样式（颜色、形状、内边距、文字样式等） |
| `autofocus`        | `bool`          | 是否自动获取焦点                                 |
| `focusNode`        | `FocusNode?`    | 焦点控制节点                                     |
| `clipBehavior`     | `Clip`          | 内容裁剪行为                                     |
| `isSemanticButton` | `bool`          | 是否在语义树中标识为按钮                         |
| `iconAlignment`    | `IconAlignment` | 使用 `TextButton.icon` 时图标的对齐方向          |

**`ButtonStyle` 中常用的样式属性（通过 `style` 设置）：**

| 属性名              | 类型                                       | 说明                      |
| ------------------- | ------------------------------------------ | ------------------------- |
| `foregroundColor`   | `WidgetStateProperty<Color?>`              | 文字及图标颜色            |
| `backgroundColor`   | `WidgetStateProperty<Color?>`              | 背景颜色                  |
| `overlayColor`      | `WidgetStateProperty<Color?>`              | 按压/悬停时的水波纹叠加色 |
| `padding`           | `WidgetStateProperty<EdgeInsetsGeometry?>` | 内边距                    |
| `minimumSize`       | `WidgetStateProperty<Size?>`               | 最小尺寸                  |
| `fixedSize`         | `WidgetStateProperty<Size?>`               | 固定尺寸                  |
| `maximumSize`       | `WidgetStateProperty<Size?>`               | 最大尺寸                  |
| `shape`             | `WidgetStateProperty<OutlinedBorder?>`     | 按钮形状（圆角等）        |
| `side`              | `WidgetStateProperty<BorderSide?>`         | 边框样式                  |
| `textStyle`         | `WidgetStateProperty<TextStyle?>`          | 文字样式（字号、字重等）  |
| `tapTargetSize`     | `MaterialTapTargetSize?`                   | 点击目标区域大小策略      |
| `animationDuration` | `Duration?`                                | 状态切换动画时长          |

**四、优缺点与注意事项**

**优点：**

- 语义清晰，专用于低强调操作，符合 Material Design 按钮层级规范
- 默认无背景无边框，视觉干扰小，适合密集布局
- 提供 `TextButton.icon` 命名构造函数，可快速创建带图标的文字按钮
- 通过 `styleFrom` 静态方法可简洁地自定义样式，无需逐一包裹 `WidgetStateProperty`

**缺点：**

- 默认自带最小点击区域（48×48）和内边距，在紧凑布局中可能占用过多空间
- 样式系统基于 `WidgetStateProperty`，精细控制不同状态样式的写法较繁琐

**新手易踩的坑：**

- `onPressed` 设为 `null` 按钮会变灰禁用，不是不设置回调就行，传空函数 `() {}` 和传 `null` 效果完全不同
- 想去掉默认内边距/最小尺寸时，需同时设置 `padding`、`minimumSize` 和 `tapTargetSize`，只改其中一个可能无效
- 直接设置 `TextStyle` 的 `color` 给 `Text` 子组件**不会生效**，文字颜色由 `ButtonStyle.foregroundColor` 控制
- `TextButton.styleFrom()` 是快捷方式，不要混淆它和直接构造 `ButtonStyle` 的用法；`styleFrom` 中的参数名更直观（如 `foregroundColor`）



## 23. IconButton

**一、一句话说明**

`IconButton` 是 Material Design 风格的图标按钮，以图标为主体响应点击操作，自带水波纹反馈效果。

**二、应用场景**

- AppBar 中的导航/操作按钮（如返回、搜索、菜单、分享）
- 列表项尾部的操作入口（如收藏、删除、更多）
- 播放器控制栏的播放/暂停/上下曲按钮
- 输入框后缀的清除按钮或密码可见性切换按钮
- 工具栏中的功能图标（如刷新、筛选、设置）

**三、核心属性**

| 属性名           | 类型                 | 说明                                                      |
| ---------------- | -------------------- | --------------------------------------------------------- |
| `icon`           | `Widget`             | 按钮显示的图标组件，通常为 `Icon`                         |
| `onPressed`      | `VoidCallback?`      | 点击回调，为 null 时按钮进入禁用状态                      |
| `iconSize`       | `double?`            | 图标尺寸                                                  |
| `color`          | `Color?`             | 图标颜色                                                  |
| `disabledColor`  | `Color?`             | 禁用状态下的图标颜色                                      |
| `splashRadius`   | `double?`            | 水波纹扩散半径                                            |
| `padding`        | `EdgeInsetsGeometry` | 图标周围的内边距                                          |
| `alignment`      | `AlignmentGeometry`  | 图标在按钮区域内的对齐方式                                |
| `constraints`    | `BoxConstraints?`    | 按钮的尺寸约束                                            |
| `tooltip`        | `String?`            | 长按或悬停时显示的提示文字                                |
| `isSelected`     | `bool?`              | 是否处于选中状态（配合 `selectedIcon` 使用）              |
| `selectedIcon`   | `Widget?`            | 选中状态下显示的图标                                      |
| `style`          | `ButtonStyle?`       | 自定义按钮样式（Material 3 风格，优先级高于单独颜色属性） |
| `highlightColor` | `Color?`             | 按压时的高亮颜色                                          |
| `splashColor`    | `Color?`             | 水波纹颜色                                                |
| `hoverColor`     | `Color?`             | 悬停时的颜色                                              |
| `focusColor`     | `Color?`             | 获取焦点时的颜色                                          |
| `focusNode`      | `FocusNode?`         | 焦点控制节点                                              |
| `autofocus`      | `bool`               | 是否自动获取焦点                                          |
| `enableFeedback` | `bool?`              | 是否启用触觉反馈                                          |
| `visualDensity`  | `VisualDensity?`     | 视觉密度，影响按钮紧凑程度                                |

**四、优缺点与注意事项**

**优点：**

- 使用简单，一个 `icon` + `onPressed` 即可完成常见图标按钮需求
- 自带水波纹和无障碍支持（`tooltip` 自动关联语义）
- 支持 `isSelected` / `selectedIcon` 实现切换态（如收藏/取消收藏），无需额外状态管理逻辑
- 提供 `IconButton.filled`、`IconButton.filledTonal`、`IconButton.outlined` 三种命名构造函数，覆盖 Material 3 的四种图标按钮变体

**缺点：**

- 默认点击区域为 48×48 且带 8.0 内边距，在紧凑布局中占用空间偏大
- 单独的颜色属性（`color`、`splashColor` 等）与 `style` 属性存在优先级关系，混用容易混乱

**新手易踩的坑：**

- 想缩小按钮占用空间，仅设置 `padding: EdgeInsets.zero` 不够，还需同时设置 `constraints: BoxConstraints()` 去掉默认最小 48×48 的限制
- `icon` 参数中 `Icon` 的 `size` 和 `IconButton` 的 `iconSize` 同时设置时，`iconSize` 优先；建议只在一处设置避免冲突
- `tooltip` 未设置时，在无障碍模式下按钮缺少语义描述，应始终提供 `tooltip`
- `color` 属性只影响正常状态的图标颜色，禁用态需单独用 `disabledColor` 控制；若使用 `style` 则可通过 `WidgetStateProperty` 统一管理各状态颜色



## 24. Card

**一、一句话说明**

`Card` 是 Material Design 风格的卡片容器，自带圆角、阴影和背景色，用于将相关信息分组展示为一个视觉整体。

**二、应用场景**

- 列表中的信息卡片（如商品卡片、新闻摘要卡片、联系人卡片）
- 设置页或个人中心的分组面板
- 仪表盘中的数据统计块
- 图文混排的内容展示区域（如社交动态、评论）
- 对话框或弹出面板中的内容承载容器

**三、核心属性**

| 属性名               | 类型                  | 说明                                       |
| -------------------- | --------------------- | ------------------------------------------ |
| `child`              | `Widget?`             | 卡片内容                                   |
| `color`              | `Color?`              | 卡片背景颜色                               |
| `shadowColor`        | `Color?`              | 阴影颜色                                   |
| `surfaceTintColor`   | `Color?`              | Material 3 中基于 elevation 叠加的表面着色 |
| `elevation`          | `double?`             | 阴影高度（Z 轴抬升程度）                   |
| `shape`              | `ShapeBorder?`        | 卡片形状（圆角、边框等）                   |
| `borderOnForeground` | `bool`                | shape 的边框是否绘制在 child 前面          |
| `margin`             | `EdgeInsetsGeometry?` | 卡片外边距                                 |
| `clipBehavior`       | `Clip?`               | 内容超出圆角区域时的裁剪行为               |
| `semanticContainer`  | `bool`                | 是否将整个卡片作为单一语义节点             |

**四、优缺点与注意事项**

**优点：**

- 开箱即用的 Material 卡片效果，自带圆角和阴影，无需手动组合 `Container` + `BoxDecoration`
- 自动跟随主题（`CardTheme`），全局统一风格方便

**缺点：**

- 功能极简，仅是一个带样式的容器，不提供内部布局结构（标题、操作栏等需自行搭建）
- 默认带有外边距（`margin`），在紧凑列表中需手动清除

**新手易踩的坑：**

- 子组件带圆角图片时，图片会溢出卡片圆角区域；需设置 `clipBehavior: Clip.antiAlias` 才能正确裁剪
- `Card` 本身不可点击，需要在外层包裹 `InkWell` / `GestureDetector`；若想让水波纹在卡片圆角内，应将 `InkWell` 放在 `Card` 的 `child` 内部，而非外部
- `elevation` 设为 0 后阴影消失，但 Material 3 下 `surfaceTintColor` 仍可能导致背景色偏移，需同时将其设为 `Colors.transparent` 才能得到纯净背景
- 默认 `margin` 不为零，在 `ListView` 中直接使用多个 `Card` 时间距可能比预期大，需注意调整





## 25. ListTile

**一、一句话说明**

`ListTile` 是 Material Design 风格的列表项组件，提供固定的图标-文字-操作三段式布局，用于快速构建规范的列表行。

**二、应用场景**

- 设置页面的选项列表（图标 + 标题 + 箭头/开关）
- 联系人列表（头像 + 姓名 + 副标题）
- 抽屉菜单（`Drawer`）中的导航项
- 消息/通知列表中的单条记录展示
- 多选列表中配合 `Checkbox` / `Switch` 使用（或直接用 `CheckboxListTile` / `SwitchListTile`）

**三、核心属性**

| 属性名                        | 类型                        | 说明                                             |
| ----------------------------- | --------------------------- | ------------------------------------------------ |
| `title`                       | `Widget?`                   | 主标题，通常为 `Text`                            |
| `subtitle`                    | `Widget?`                   | 副标题，显示在 title 下方                        |
| `leading`                     | `Widget?`                   | 左侧组件（头像、图标等）                         |
| `trailing`                    | `Widget?`                   | 右侧组件（箭头、开关等）                         |
| `onTap`                       | `GestureTapCallback?`       | 点击回调                                         |
| `onLongPress`                 | `GestureLongPressCallback?` | 长按回调                                         |
| `enabled`                     | `bool`                      | 是否可交互，为 false 时整行变灰且不响应点击      |
| `selected`                    | `bool`                      | 是否处于选中状态，选中时文字和图标使用主题选中色 |
| `selectedColor`               | `Color?`                    | 选中状态下图标和文字的颜色                       |
| `selectedTileColor`           | `Color?`                    | 选中状态下整行的背景颜色                         |
| `tileColor`                   | `Color?`                    | 未选中状态下整行的背景颜色                       |
| `iconColor`                   | `Color?`                    | 图标默认颜色                                     |
| `textColor`                   | `Color?`                    | 文字默认颜色                                     |
| `titleTextStyle`              | `TextStyle?`                | 主标题文字样式                                   |
| `subtitleTextStyle`           | `TextStyle?`                | 副标题文字样式                                   |
| `leadingAndTrailingTextStyle` | `TextStyle?`                | leading/trailing 中文字的样式                    |
| `isThreeLine`                 | `bool`                      | 是否为三行模式（副标题允许占两行）               |
| `dense`                       | `bool?`                     | 是否启用紧凑模式，减小高度和字号                 |
| `visualDensity`               | `VisualDensity?`            | 视觉密度，精细调节紧凑程度                       |
| `contentPadding`              | `EdgeInsetsGeometry?`       | 内容区域的水平内边距                             |
| `shape`                       | `ShapeBorder?`              | 列表项形状（圆角等）                             |
| `splashColor`                 | `Color?`                    | 点击水波纹颜色                                   |
| `focusColor`                  | `Color?`                    | 获取焦点时的颜色                                 |
| `hoverColor`                  | `Color?`                    | 悬停时的颜色                                     |
| `focusNode`                   | `FocusNode?`                | 焦点控制节点                                     |
| `autofocus`                   | `bool`                      | 是否自动获取焦点                                 |
| `enableFeedback`              | `bool?`                     | 是否启用触觉反馈                                 |
| `horizontalTitleGap`          | `double?`                   | leading 与 title/subtitle 之间的水平间距         |
| `minVerticalPadding`          | `double?`                   | title/subtitle 区域的最小垂直内边距              |
| `minLeadingWidth`             | `double?`                   | leading 的最小宽度                               |
| `minTileHeight`               | `double?`                   | 列表项的最小高度                                 |
| `titleAlignment`              | `ListTileTitleAlignment?`   | leading/trailing 与 title 区域的垂直对齐方式     |

**四、优缺点与注意事项**

**优点：**

- 高度标准化的三段式布局，快速产出符合 Material 规范的列表行
- 内置点击水波纹、选中态、禁用态，无需额外包裹手势组件
- 派生组件丰富：`CheckboxListTile`、`SwitchListTile`、`RadioListTile`、`ExpansionTile` 可直接使用

**缺点：**

- 布局结构固定，定制自由度有限（如需多图标并排、复杂多行排版时力不从心）
- 高度由内部逻辑计算，精确控制高度不如自定义布局灵活

**新手易踩的坑：**

- `subtitle` 默认最多一行，设置 `isThreeLine: true` 才允许副标题显示两行；但 `isThreeLine` 并不是"显示三行文字"，而是让整个 tile 按三行高度布局
- `leading` 中放较大的图片/组件时可能导致垂直居中异常，需通过 `titleAlignment` 或外层 `SizedBox` 约束尺寸
- 在 `Card` 内使用 `ListTile` 时，水波纹可能溢出圆角；需给 `Card` 设置 `clipBehavior` 或使用 `shape` 配合 `InkWell` 的 `borderRadius`
- `trailing` 中放 `IconButton` 时，`IconButton` 自带的 48×48 点击区域会撑大行高，紧凑布局下需缩小其约束
- `contentPadding` 只控制水平方向内边距，不能用它来调整上下间距；垂直间距由 `minVerticalPadding` 控制



## 26. Positioned

**一、一句话说明**

`Positioned` 是用于在 `Stack` 中精确控制子组件位置和大小的定位组件，通过设置上下左右距离来确定子组件在 `Stack` 内的摆放位置。

**二、应用场景**

- 在图片上叠加角标、徽章或标签（如右上角红点）
- 实现自定义悬浮按钮或浮层，精确定位到页面指定位置
- 构建卡片堆叠、层叠头像等重叠布局效果
- 在地图或画布上根据坐标放置标记点
- 实现拖拽交互时动态更新组件位置

**三、核心属性**

| 属性名 | 类型      | 说明                              |
| ------ | --------- | --------------------------------- |
| left   | `double?` | 子组件左边缘距 Stack 左边缘的距离 |
| top    | `double?` | 子组件上边缘距 Stack 上边缘的距离 |
| right  | `double?` | 子组件右边缘距 Stack 右边缘的距离 |
| bottom | `double?` | 子组件下边缘距 Stack 下边缘的距离 |
| width  | `double?` | 强制指定子组件的宽度              |
| height | `double?` | 强制指定子组件的高度              |
| child  | `Widget`  | 要定位的子组件                    |

**命名构造函数：**

| 构造函数                   | 说明                                                         |
| -------------------------- | ------------------------------------------------------------ |
| `Positioned.fill()`        | 四边距均可设置，默认全部为 0，撑满 Stack                     |
| `Positioned.fromRect()`    | 根据 `Rect` 对象设置位置和大小                               |
| `Positioned.directional()` | 支持文本方向（LTR/RTL）的定位，用 `start`/`end` 替代 `left`/`right` |

**四、优缺点与注意事项**

**优点：**

- 定位直观灵活，可精确控制像素级位置
- 支持只设置部分方向，未设置的方向由子组件自身大小决定
- `Positioned.fill` 快速实现铺满效果

**缺点：**

- 使用绝对定位，不具备响应式能力，屏幕尺寸变化时可能错位
- 依赖 `Stack` 父组件，不能单独使用

**易踩的坑：**

- **必须作为 `Stack` 的直接子组件**，否则运行时报错
- 同一轴向上 `left`+`right`+`width` 三者最多只能设置两个，同时设三个会报错；`top`+`bottom`+`height` 同理
- 如果所有方向属性都为 null，则等同于未定位，组件会按 `Stack.alignment` 对齐
- `Positioned` 不会约束子组件大小，若未设置 `width`/`height` 且只指定了单侧距离，子组件大小由自身决定，可能超出 `Stack` 边界（需配合 `Stack.clipBehavior` 控制裁剪）



## 27. Flexible

**一、一句话说明**

`Flexible` 是用于 `Row`、`Column`、`Flex` 中控制子组件如何弹性占用剩余空间的布局组件，允许子组件在主轴方向上按比例分配或收缩空间。

**二、应用场景**

- 在 `Row` 中让某个子组件自适应宽度，但不强制撑满剩余空间
- 多个子组件按不同比例分配可用空间（如 1:2:1 布局）
- 长文本需要自动换行或截断，而非导致溢出
- 输入框与按钮并排时，让输入框弹性占用剩余宽度
- 混合固定尺寸与弹性尺寸子组件的布局

**三、核心属性**

| 属性名 | 类型      | 说明                                                         |
| ------ | --------- | ------------------------------------------------------------ |
| flex   | `int`     | 弹性因子，决定该子组件分配剩余空间的比例权重                 |
| fit    | `FlexFit` | 子组件是否必须填满分配到的空间：`FlexFit.loose` 允许小于分配空间，`FlexFit.tight` 强制填满 |
| child  | `Widget`  | 要包裹的子组件                                               |

**四、优缺点与注意事项**

**优点：**

- 比 `Expanded` 更灵活，`fit: FlexFit.loose` 允许子组件按自身需要的大小显示，不强制撑满
- 通过 `flex` 值轻松实现多组件按比例分配空间

**缺点：**

- 功能单一，仅控制主轴方向的空间分配，交叉轴需要其他方式处理

**易踩的坑：**

- **只能作为 `Row`/`Column`/`Flex` 的直接子组件**，放在其他组件下会报错
- `Flexible` 与 `Expanded` 的唯一区别：`Expanded` 等价于 `Flexible(fit: FlexFit.tight)`，即 `Expanded` 强制填满分配空间，而 `Flexible` 默认 `FlexFit.loose` 不强制填满
- `flex: 0` 时该组件不参与剩余空间分配，仅按自身大小布局
- 多个 `Flexible` 的 `flex` 值之和决定总份数，空间按比例瓜分的是**剩余空间**（总空间减去非弹性子组件占用的空间），而非总空间
- 嵌套 `Row`/`Column` 时，内层若也有 `Flexible`/`Expanded`，需确保内层父组件本身有明确的主轴约束，否则会报无限尺寸错误



## 28. InkWell

**一、一句话说明**

`InkWell` 是 Material Design 风格的手势响应组件，为子组件提供点击、长按等交互能力并展示水波纹（ripple）视觉反馈效果。

**二、应用场景**

- 为自定义卡片、列表项添加点击事件和水波纹反馈
- 包裹图标或文字实现可点击区域，替代原生按钮
- 自定义导航栏项或标签页的点击交互
- 为整个容器区域添加手势响应（如整块区域可点击跳转）
- 需要同时处理单击、双击、长按等多种手势的场景

**三、核心属性**

| 属性名               | 类型                             | 说明                                                         |
| -------------------- | -------------------------------- | ------------------------------------------------------------ |
| child                | `Widget?`                        | 要包裹的子组件                                               |
| onTap                | `VoidCallback?`                  | 单击回调                                                     |
| onDoubleTap          | `VoidCallback?`                  | 双击回调                                                     |
| onLongPress          | `VoidCallback?`                  | 长按回调                                                     |
| onTapDown            | `void Function(TapDownDetails)?` | 手指按下时回调                                               |
| onTapUp              | `void Function(TapUpDetails)?`   | 手指抬起时回调                                               |
| onTapCancel          | `VoidCallback?`                  | 点击取消时回调                                               |
| onHover              | `void Function(bool)?`           | 鼠标悬停状态变化回调（桌面/Web）                             |
| splashColor          | `Color?`                         | 水波纹扩散颜色                                               |
| highlightColor       | `Color?`                         | 按下时高亮覆盖颜色                                           |
| hoverColor           | `Color?`                         | 鼠标悬停时的覆盖颜色                                         |
| focusColor           | `Color?`                         | 获得焦点时的覆盖颜色                                         |
| splashFactory        | `InteractiveInkFeatureFactory?`  | 自定义水波纹效果工厂（如 `NoSplash.splashFactory` 可禁用波纹） |
| borderRadius         | `BorderRadius?`                  | 水波纹和高亮效果的圆角裁剪范围                               |
| customBorder         | `ShapeBorder?`                   | 自定义水波纹裁剪形状                                         |
| enableFeedback       | `bool`                           | 是否启用触觉反馈（如点击震动）                               |
| excludeFromSemantics | `bool`                           | 是否从语义树中排除手势动作                                   |
| focusNode            | `FocusNode?`                     | 焦点控制节点                                                 |
| canRequestFocus      | `bool`                           | 是否可以获取焦点                                             |
| autofocus            | `bool`                           | 是否自动获取焦点                                             |
| mouseCursor          | `MouseCursor?`                   | 鼠标悬停时的光标样式                                         |
| overlayColor         | `WidgetStateProperty<Color?>?`   | 统一控制不同交互状态下的覆盖颜色                             |

**四、优缺点与注意事项**

**优点：**

- 自带 Material 水波纹效果，交互反馈自然，无需手动实现
- 手势种类丰富，单击、双击、长按、悬停一站式支持
- 可高度自定义波纹颜色、形状、圆角

**缺点：**

- 矩形响应区域，不能像 `InkResponse` 那样默认以圆形扩散（可通过 `customBorder` 调整）
- 依赖 `Material` 祖先组件，缺少时波纹效果不可见

**易踩的坑：**

- **水波纹不显示的最常见原因**：子组件有不透明背景（如 `Container` 设置了 `color`），波纹被绘制在 `Material` 层上而被子组件遮挡。解决方案：将颜色设置在 `Material` 的 `color` 上，或使用 `Ink` 组件替代 `Container`
- 必须有 `Material` 祖先组件，否则波纹无处绘制，会抛出断言错误
- `borderRadius` 只裁剪波纹视觉效果，不裁剪子组件本身内容，子组件圆角需自行处理
- 所有回调都为 `null` 时，组件处于禁用状态，不会响应手势也不显示波纹
- 与 `GestureDetector` 的区别：`InkWell` 带 Material 视觉反馈，`GestureDetector` 纯手势无视觉效果；两者嵌套使用可能导致手势冲突



## 29. FloatingActionButton

**一、一句话说明**

`FloatingActionButton`（FAB）是 Material Design 中悬浮在界面上方的圆形按钮，用于承载页面中最重要、最常用的主操作。

**二、应用场景**

- 列表页面底部的"新增/创建"按钮（如新建邮件、添加联系人）
- 聊天界面的发起新对话按钮
- 地图页面的"回到当前位置"按钮
- 配合 `BottomAppBar` 实现嵌入式凹槽悬浮按钮
- 使用 `FloatingActionButton.extended` 展示带图标和文字的扩展操作按钮

**三、核心属性**

| 属性名             | 类型            | 说明                                 |
| ------------------ | --------------- | ------------------------------------ |
| child              | `Widget?`       | 按钮内部内容，通常为 `Icon`          |
| onPressed          | `VoidCallback?` | 点击回调，为 null 时按钮进入禁用状态 |
| tooltip            | `String?`       | 长按或鼠标悬停时的提示文字           |
| foregroundColor    | `Color?`        | 前景色（图标/文字颜色）              |
| backgroundColor    | `Color?`        | 按钮背景色                           |
| focusColor         | `Color?`        | 获得焦点时的颜色                     |
| hoverColor         | `Color?`        | 鼠标悬停时的颜色                     |
| splashColor        | `Color?`        | 点击水波纹颜色                       |
| elevation          | `double?`       | 默认状态下的阴影高度                 |
| focusElevation     | `double?`       | 获得焦点时的阴影高度                 |
| hoverElevation     | `double?`       | 鼠标悬停时的阴影高度                 |
| highlightElevation | `double?`       | 按下时的阴影高度                     |
| disabledElevation  | `double?`       | 禁用状态下的阴影高度                 |
| shape              | `ShapeBorder?`  | 按钮形状（圆形、圆角矩形等）         |
| mini               | `bool`          | 是否使用小尺寸 FAB                   |
| heroTag            | `Object?`       | Hero 动画标签，用于页面过渡动画      |
| mouseCursor        | `MouseCursor?`  | 鼠标悬停时的光标样式                 |
| clipBehavior       | `Clip`          | 内容裁剪行为                         |
| focusNode          | `FocusNode?`    | 焦点控制节点                         |
| autofocus          | `bool`          | 是否自动获取焦点                     |
| enableFeedback     | `bool?`         | 是否启用触觉反馈                     |

**命名构造函数：**

| 构造函数                          | 说明                                                    |
| --------------------------------- | ------------------------------------------------------- |
| `FloatingActionButton()`          | 标准圆形 FAB                                            |
| `FloatingActionButton.small()`    | 小尺寸 FAB                                              |
| `FloatingActionButton.large()`    | 大尺寸 FAB                                              |
| `FloatingActionButton.extended()` | 扩展型药丸形 FAB，支持 `label`（必填）和 `icon`（可选） |

**四、优缺点与注意事项**

**优点：**

- 符合 Material Design 规范，自带阴影、波纹、形状等完整视觉效果
- 与 `Scaffold.floatingActionButton` 配合使用，自动定位
- `Scaffold.floatingActionButtonLocation` 可灵活控制 FAB 位置（居中、嵌入底栏等）
- `extended` 构造函数可快速创建图文并排的扩展按钮

**缺点：**

- 强 Material 风格，iOS 风格应用中视觉上不协调
- 可能遮挡底部列表内容

**易踩的坑：**

- **同一页面有多个 FAB 时必须为每个设置不同的 `heroTag`**，否则 Hero 动画冲突导致报错；不需要过渡动画可设为 `null`
- `onPressed` 为 `null` 时按钮变为禁用态，但 FAB 禁用在 Material 设计中并不推荐，应考虑隐藏而非禁用
- FAB 默认带有阴影，嵌入 `BottomAppBar` 凹槽时需通过 `Scaffold.floatingActionButtonLocation` 设为 `FloatingActionButtonLocation.centerDocked` 或 `endDocked`
- `mini: true` 与 `FloatingActionButton.small()` 效果类似但尺寸略有差异，Material 3 下推荐使用命名构造函数
- 每个页面应只有一个主要 FAB，代表该页面最核心的操作



## 30. Wrap

**一、一句话说明**

`Wrap` 是一个多行流式布局组件，当子组件在主轴方向空间不足时会自动换行（或换列）排列。

**二、应用场景**

- 标签（Tag）云展示，如筛选条件、兴趣标签等
- 商品规格选择（颜色、尺码等 Chip 列表）
- 动态数量的按钮组或徽章排列
- 搜索历史关键词的流式展示
- 图片缩略图自适应排列

**三、核心属性**

| 属性名             | 类型                 | 说明                                           |
| ------------------ | -------------------- | ---------------------------------------------- |
| direction          | `Axis`               | 主轴方向，水平（horizontal）或垂直（vertical） |
| alignment          | `WrapAlignment`      | 主轴方向上每行子组件的对齐方式                 |
| spacing            | `double`             | 主轴方向上子组件之间的间距                     |
| runAlignment       | `WrapAlignment`      | 交叉轴方向上各行（run）之间的对齐方式          |
| runSpacing         | `double`             | 交叉轴方向上各行（run）之间的间距              |
| crossAxisAlignment | `WrapCrossAlignment` | 每行内部子组件在交叉轴上的对齐方式             |
| textDirection      | `TextDirection`      | 水平方向时子组件的排列顺序（ltr / rtl）        |
| verticalDirection  | `VerticalDirection`  | 垂直方向时行的排列顺序（down / up）            |
| clipBehavior       | `Clip`               | 子组件溢出时的裁剪行为                         |
| children           | `List<Widget>`       | 子组件列表                                     |

**四、优缺点与注意事项**

**优点：**

- 自动换行，无需手动计算行数或宽度，适配不同屏幕尺寸
- `spacing` 和 `runSpacing` 可以方便地统一控制间距，比嵌套 `Padding` 简洁
- 支持水平和垂直两个方向的流式布局

**缺点：**

- 子组件数量非常大时性能不佳，因为所有子组件会一次性全部布局和渲染（无懒加载）
- 不支持滚动，子组件超出父容器高度会溢出；需要外层包裹 `SingleChildScrollView` 等可滚动组件

**注意事项：**

- `alignment` 控制的是**每一行内部**的对齐，`runAlignment` 控制的是**行与行之间**的对齐，两者容易混淆
- 大量子组件场景应考虑用 `Flow`（自定义布局）或 `GridView`（懒加载）替代
- 子组件宽度超过 `Wrap` 自身宽度时不会报错，但该子组件会独占一行并可能溢出，需注意约束子组件尺寸



## 31. Align

**一、一句话说明**

`Align` 用于将单个子组件在父容器内按指定的对齐方式进行定位。

**二、应用场景**

- 将按钮或图标定位到容器的某个角落（如右下角悬浮按钮效果）
- 在 `Stack` 内部精确控制某个子组件的对齐位置
- 将文本或图标在一个固定区域内居中、靠左或靠右放置
- 实现子组件相对于父容器的比例偏移定位（如居中偏上）

**三、核心属性**

| 属性名       | 类型                | 说明                                                         |
| ------------ | ------------------- | ------------------------------------------------------------ |
| alignment    | `AlignmentGeometry` | 子组件在父容器内的对齐位置，如 `Alignment.center`、`Alignment.topLeft` 等 |
| widthFactor  | `double?`           | 自身宽度为子组件宽度的倍数；为 null 时尽可能占满父容器宽度   |
| heightFactor | `double?`           | 自身高度为子组件高度的倍数；为 null 时尽可能占满父容器高度   |
| child        | `Widget?`           | 需要对齐的子组件                                             |

**四、优缺点与注意事项**

**优点：**

- API 极简，只需一个 `alignment` 参数即可完成定位
- `Alignment(x, y)` 支持 -1.0 到 1.0 的连续值，可以实现任意比例位置的精确定位，而不仅限于九宫格方位
- `widthFactor` / `heightFactor` 可让 `Align` 根据子组件大小自适应收缩，适合在无约束环境下使用

**缺点：**

- 只能包含单个子组件，多组件定位需配合 `Stack` 使用

**注意事项：**

- **`Align` 默认会撑满父容器**：当 `widthFactor` 和 `heightFactor` 为 null 时，`Align` 会尽可能占满父级给的空间；如果希望它包裹子组件大小，必须设置 `widthFactor` / `heightFactor`
- `Center` 本质上就是 `alignment` 为 `Alignment.center` 的 `Align`，两者完全等价
- `Alignment(0, 0)` 为中心，`(-1, -1)` 为左上角，`(1, 1)` 为右下角；超出 -1~1 范围的值会将子组件定位到父容器边界之外，可能导致溢出
- 在 `Row` / `Column` 等紧约束方向上，`Align` 拿不到多余空间，对齐效果不会生效；需确保对应轴向有可分配的空间



## 32. Spacer

**一、一句话说明**

`Spacer` 是一个用在 `Flex` 系列布局（`Row`、`Column`、`Flex`）中的空白占位组件，通过弹性因子占据剩余可用空间。

**二、应用场景**

- 在 `Row` 中将左侧标题和右侧按钮推到两端（替代 `MainAxisAlignment.spaceBetween`）
- 在导航栏中将多个元素按比例分隔开
- 在 `Column` 中将底部按钮推到屏幕最下方
- 多个 `Spacer` 配合不同 `flex` 值实现按比例分配剩余空间

**三、核心属性**

| 属性名 | 类型  | 说明                                             |
| ------ | ----- | ------------------------------------------------ |
| flex   | `int` | 弹性因子，决定该 `Spacer` 占据剩余空间的比例权重 |

**四、优缺点与注意事项**

**优点：**

- 极其简洁，一个组件即可替代手动计算间距或嵌套 `Expanded` + `SizedBox` 的写法
- 语义清晰，代码可读性强，一眼就能看出"这里是弹性空白"

**缺点：**

- 功能单一，本质就是 `Expanded(child: SizedBox.shrink())` 的语法糖，不能放置任何内容

**注意事项：**

- **只能用于 `Row`、`Column`、`Flex` 中**，放在其他容器内会报错（与 `Expanded` 限制相同）
- 父级主轴不能是 `MainAxisSize.min` 且无额外空间的情况，否则没有剩余空间可分配，`Spacer` 宽/高为 0，无任何效果
- 如果需要的是固定间距而非弹性空间，应使用 `SizedBox` 而不是 `Spacer`
- 多个 `Spacer` 共存时按各自 `flex` 值的比例瓜分剩余空间，与 `Expanded` 的 `flex` 参与同一分配机制





## 33. Divider

**一、一句话说明**

`Divider` 是一个水平分割线组件，用于在垂直方向的布局中对内容进行视觉分隔。

**二、应用场景**

- 列表项之间的水平分隔线
- 表单中不同区块之间的视觉分隔
- 设置页面中各选项组之间的分界线
- 对话框或弹出菜单中内容段落的分隔

**三、核心属性**

| 属性名    | 类型      | 说明                                                 |
| --------- | --------- | ---------------------------------------------------- |
| height    | `double?` | 分割线组件占据的总高度（包含上下留白），并非线条粗细 |
| thickness | `double?` | 分割线条本身的粗细（厚度）                           |
| indent    | `double?` | 分割线起始端（左侧）的缩进距离                       |
| endIndent | `double?` | 分割线末尾端（右侧）的缩进距离                       |
| color     | `Color?`  | 分割线的颜色                                         |

**四、优缺点与注意事项**

**优点：**

- 开箱即用，自动从 `Theme` 的 `DividerThemeData` 继承样式，保持全局统一
- 属性简单直观，几个参数即可满足绝大多数分隔需求

**注意事项：**

- **`height` 不是线条粗细**：`height` 控制的是组件的总占位高度（上下留白 + 线条），线条粗细由 `thickness` 控制，这是新手最常混淆的地方
- `Divider` 是水平线，只能用于垂直布局（如 `Column`、`ListView`）；如需在水平布局中使用垂直分割线，应使用 `VerticalDivider`
- 在 `ListView.separated` 中通常用 `separatorBuilder` 返回 `Divider`，而不是把 `Divider` 作为普通列表项混入 `children`
- 未指定 `color` 时使用主题中的 `DividerThemeData.color`，若主题也未设置则取 `ThemeData.dividerColor`；在深色主题下需留意默认颜色是否可见

## 34. Form

**一、一句话说明**

`Form` 是 Flutter 中用于将多个表单字段（如 `TextFormField`）组合在一起，统一进行校验、保存和重置的容器组件。

**二、应用场景**

- 用户登录/注册页面，统一校验用户名、密码等字段
- 个人信息编辑页面，提交前批量验证并收集所有字段数据
- 多步骤表单向导，每一步对当前步骤的字段统一校验
- 反馈/意见提交页面，校验必填项后统一提交
- 地址填写表单，保存前一次性验证所有地址字段

**三、核心属性**

| 属性名                 | 类型                            | 说明                                                         |
| ---------------------- | ------------------------------- | ------------------------------------------------------------ |
| key                    | `GlobalKey<FormState>`          | 通过此 key 获取 `FormState`，调用 `validate()`、`save()`、`reset()` 等方法 |
| child                  | `Widget`                        | 表单内容，通常包含多个 `FormField` 子组件                    |
| onChanged              | `VoidCallback?`                 | 表单内任意字段值发生变化时的回调                             |
| onWillPop              | `WillPopCallback?`              | 用户尝试离开页面时的拦截回调（常用于提示"未保存"）           |
| canPop                 | `bool`                          | 控制当前路由是否可以被 pop（配合 `PopScope` 使用）           |
| onPopInvokedWithResult | `PopInvokedWithResultCallback?` | 路由 pop 被触发时的回调，替代已废弃的 `onPopInvoked`         |
| autovalidateMode       | `AutovalidateMode`              | 自动校验模式：`disabled`（手动触发）、`always`（始终）、`onUserInteraction`（用户交互后） |

**四、优缺点与注意事项**

**优点：**

- 提供统一的校验、保存、重置机制，避免逐个字段手动管理
- 通过 `autovalidateMode` 灵活控制校验时机，兼顾用户体验
- 与 `FormField`/`TextFormField` 深度集成，开箱即用

**缺点：**

- 必须依赖 `GlobalKey<FormState>` 来操作表单状态，跨组件传递不够优雅
- 对于非常复杂的动态表单（字段数量和类型动态变化），管理起来较繁琐，可能需要配合状态管理方案

**新手易踩的坑：**

- 忘记给 `Form` 设置 `GlobalKey<FormState>`，导致无法调用 `validate()` / `save()`
- `TextFormField` 的 `validator` 返回 `null` 表示校验通过，返回字符串表示错误信息，容易搞反
- `autovalidateMode` 设为 `always` 会导致表单初始化时就显示错误提示，体验差；推荐使用 `onUserInteraction`
- 调用 `save()` 前应先调用 `validate()` 确认校验通过，否则可能保存了无效数据
- `Form` 内的子字段必须是 `FormField` 的子类（如 `TextFormField`），普通 `TextField` 不会被 `Form` 管理



## 35. CircularProgressIndicator

**一、一句话说明**

`CircularProgressIndicator` 是 Flutter 中用于显示圆形加载进度的指示器组件，支持确定进度和不确定（无限旋转）两种模式。

**二、应用场景**

- 网络请求加载时显示等待动画
- 文件上传/下载时展示实时进度百分比
- 按钮点击后替换为加载指示器，防止重复提交
- 页面初始化数据时作为占位加载状态
- 下拉刷新或分页加载更多时的加载提示

**三、核心属性**

| 属性名          | 类型                 | 说明                                                         |
| --------------- | -------------------- | ------------------------------------------------------------ |
| value           | `double?`            | 进度值，范围 0.0~1.0；为 `null` 时进入不确定模式（无限旋转） |
| color           | `Color?`             | 进度条前景色（弧线颜色）                                     |
| backgroundColor | `Color?`             | 进度条背景圆环颜色                                           |
| strokeWidth     | `double`             | 进度条圆弧的线条宽度                                         |
| strokeCap       | `StrokeCap?`         | 线条端点样式（`round` 圆角、`butt` 平头、`square` 方头）     |
| strokeAlign     | `double`             | 线条相对于组件边界的对齐方式（向内、居中或向外偏移）         |
| valueColor      | `Animation<Color?>?` | 进度条颜色的动画，可实现颜色渐变效果，优先级高于 `color`     |
| semanticsLabel  | `String?`            | 无障碍语义标签                                               |
| semanticsValue  | `String?`            | 无障碍语义值（如 "80%"）                                     |

**四、优缺点与注意事项**

**优点：**

- 使用极其简单，无参数即可生成无限旋转的加载动画
- 通过设置 `value` 可在确定/不确定模式间自由切换
- 支持自定义颜色、线宽、端点样式，定制灵活

**缺点：**

- 无法直接设置尺寸，需要外层包裹 `SizedBox` 来控制大小
- 样式相对固定（Material 风格），深度自定义动画效果需自行实现

**新手易踩的坑：**

- 直接使用时大小由父约束决定，常出现过大或撑满屏幕的情况，务必用 `SizedBox` 约束宽高
- `value` 为 `null` 是不确定模式（无限旋转），`value` 为 `0.0` 是确定模式且进度为零，两者表现完全不同
- 同时设置 `color` 和 `valueColor` 时，`valueColor` 优先，`color` 会被忽略
- 如需在按钮中使用，注意将 `strokeWidth` 调小、`SizedBox` 尺寸调小，否则视觉比例失调
- `CircularProgressIndicator.adaptive()` 构造函数可在 iOS 上自动切换为 `CupertinoActivityIndicator` 风格



## 36. Opacity

**一、一句话说明**

`Opacity` 是 Flutter 中用于控制子组件透明度的组件，通过设置 0.0~1.0 的值来实现完全透明到完全不透明的效果。

**二、应用场景**

- 隐藏某个组件但仍保留其占位空间（透明度设为 0）
- 实现淡入淡出过渡效果（配合动画控制透明度值）
- 将部分 UI 元素设为半透明，营造层次感或水印效果
- 禁用状态下将组件变为半透明，给用户视觉提示

**三、核心属性**

| 属性名                 | 类型      | 说明                                              |
| ---------------------- | --------- | ------------------------------------------------- |
| opacity                | `double`  | 透明度值，范围 0.0（完全透明）~ 1.0（完全不透明） |
| child                  | `Widget?` | 需要应用透明度的子组件                            |
| alwaysIncludeSemantics | `bool`    | 透明度为 0 时是否仍保留无障碍语义信息             |

**四、优缺点与注意事项**

**优点：**

- 使用极其简单，一个属性即可控制透明度
- 透明度为 0 时子组件仍保留布局空间，不会引起布局抖动

**缺点：**

- **性能开销大**：`Opacity` 会将子组件绘制到离屏缓冲区再合成，对复杂子树有明显性能代价
- 即使 `opacity` 为 0，子组件仍然参与构建和布局，存在不必要的开销

**新手易踩的坑：**

- **最常见错误**：仅为了隐藏组件就用 `Opacity(opacity: 0)`，如果不需要保留占位，应优先使用 `Visibility` 或条件判断直接移除组件
- 如果只是想让单个颜色或单个图片半透明，直接使用 `Color` 的 alpha 通道或 `Image` 的 `opacity` 属性，性能远优于包裹 `Opacity`
- 需要动画过渡透明度时，应使用 `AnimatedOpacity` 或 `FadeTransition`，而不是手动在 `Opacity` 上驱动动画
- `Opacity` 为 0 时子组件**仍然可以接收点击事件**，如果需要同时禁用交互，应配合 `IgnorePointer` 使用
- Flutter 内部对 `opacity` 值为 0.0 和 1.0 做了优化（跳过离屏合成），但介于两者之间的值会触发离屏渲染，在列表等大量重复场景中需谨慎使用



## 37. ClipRRect

**一、一句话说明**

`ClipRRect` 是 Flutter 中用于将子组件按圆角矩形路径进行裁剪的组件，常用于实现圆角效果。

**二、应用场景**

- 将图片裁剪为圆角矩形展示（如卡片封面、头像）
- 给视频播放器或地图等无法自身设置圆角的组件添加圆角
- 将整个容器内容（包括溢出部分）按圆角边界裁剪
- 设置足够大的圆角半径将方形组件裁剪为圆形

**三、核心属性**

| 属性名       | 类型                    | 说明                                                         |
| ------------ | ----------------------- | ------------------------------------------------------------ |
| borderRadius | `BorderRadiusGeometry`  | 圆角半径，控制四个角的圆角大小                               |
| clipper      | `CustomClipper<RRect>?` | 自定义裁剪路径，提供完全自定义的圆角矩形裁剪区域，优先级高于 `borderRadius` |
| clipBehavior | `Clip`                  | 裁剪行为：`hardEdge`（硬边裁剪）、`antiAlias`（抗锯齿）、`antiAliasWithSaveLayer`（抗锯齿+离屏缓冲） |
| child        | `Widget?`               | 需要被裁剪的子组件                                           |

**四、优缺点与注意事项**

**优点：**

- 使用简单直观，一行即可为任意子组件添加圆角裁剪
- 支持四个角分别设置不同的圆角半径
- 通过 `clipper` 可实现完全自定义的裁剪形状

**缺点：**

- 裁剪操作有性能开销，尤其在列表中大量使用时需注意
- `antiAliasWithSaveLayer` 模式性能代价较高，一般场景不需要

**新手易踩的坑：**

- **能用 `Container` / `DecoratedBox` 的 `borderRadius` 实现圆角时，优先用装饰而非裁剪**，装饰只影响背景和边框绘制，性能更优；`ClipRRect` 是真正裁剪子组件像素，开销更大
- 默认 `clipBehavior` 为 `hardEdge`（无抗锯齿），圆角边缘会有锯齿感；需要平滑边缘应设为 `antiAlias`
- `Container` 设置了 `decoration` 的圆角**不会裁剪子组件内容**，子组件内容会溢出圆角区域；此时必须配合 `ClipRRect` 才能真正裁剪
- 要实现正圆裁剪，可将 `borderRadius` 设为极大值或直接使用 `ClipOval`，后者语义更清晰
- `ClipRRect` 不会影响子组件的点击区域，被裁剪掉的视觉区域**仍可接收手势事件**，需要额外处理



## 38. Drawer

**一、一句话说明**

`Drawer` 是 Flutter 中从屏幕边缘水平滑出的侧边栏面板组件，通常用于放置应用导航菜单。

**二、应用场景**

- 应用主导航菜单，放置各功能模块入口（如首页、设置、关于等）
- 用户账户信息展示区，顶部显示头像和用户名，下方列出操作选项
- 多账户切换面板
- 筛选/过滤面板，从右侧滑出（`endDrawer`）提供筛选条件选择
- 应用设置快捷入口

**三、核心属性**

| 属性名           | 类型           | 说明                                                         |
| ---------------- | -------------- | ------------------------------------------------------------ |
| child            | `Widget?`      | 抽屉内部内容，通常为 `ListView` 包含 `DrawerHeader` 和多个 `ListTile` |
| backgroundColor  | `Color?`       | 抽屉背景颜色                                                 |
| elevation        | `double?`      | 阴影高度                                                     |
| shadowColor      | `Color?`       | 阴影颜色                                                     |
| surfaceTintColor | `Color?`       | Material 3 表面着色颜色                                      |
| shape            | `ShapeBorder?` | 抽屉的形状（如自定义圆角）                                   |
| width            | `double?`      | 抽屉宽度                                                     |
| clipBehavior     | `Clip?`        | 内容裁剪行为                                                 |
| semanticLabel    | `String?`      | 无障碍语义标签                                               |

**四、优缺点与注意事项**

**优点：**

- 与 `Scaffold` 深度集成，赋值给 `Scaffold.drawer` 或 `Scaffold.endDrawer` 即可自动获得滑动手势和汉堡菜单按钮
- 自带滑入/滑出动画和遮罩层，无需额外实现
- 配合 `DrawerHeader`、`UserAccountsDrawerHeader`、`ListTile` 等组件可快速构建标准导航菜单

**缺点：**

- 样式和交互模式较固定（Material 风格），深度自定义布局和动画需较多工作
- 在大屏设备上侧边栏常驻的需求，`Drawer` 并不直接支持，需自行实现响应式布局切换

**新手易踩的坑：**

- 打开/关闭抽屉应使用 `Scaffold.of(context).openDrawer()` / `Navigator.pop(context)`，而非手动管理状态；注意 `context` 必须是 `Scaffold` 的子级上下文
- `Drawer` 的 `child` 如果直接用 `Column`，内容过多时会溢出；推荐使用 `ListView` 以支持滚动
- 点击抽屉中的导航项后应主动关闭抽屉（`Navigator.pop`），否则抽屉会一直保持打开状态
- `Scaffold.drawer` 是左侧抽屉，`Scaffold.endDrawer` 是右侧抽屉，两者独立存在，不要搞混
- 使用 `Scaffold.of(context)` 时如果 `context` 就是 `Scaffold` 所在的 widget 自身，会找不到 `Scaffold`，需用 `Builder` 或 `GlobalKey<ScaffoldState>` 解决

## 39. TabBar

**一、一句话说明**

TabBar 是 Flutter 中用于创建水平选项卡栏的组件，通常与 TabBarView 配合实现多页面切换导航。

**二、应用场景**

- 顶部/底部导航栏实现多页面分类切换（如新闻类 App 的频道栏）
- 设置页面中不同设置分组的切换
- 商品详情页中"商品/评价/详情"等 Tab 切换
- 搜索结果按类型（全部/图片/视频）分类展示
- 用户个人主页中"动态/收藏/关注"等板块切换

**三、核心属性**

| 属性名               | 类型                            | 说明                                                        |
| -------------------- | ------------------------------- | ----------------------------------------------------------- |
| tabs                 | `List<Widget>`                  | 必填，选项卡列表，通常使用 Tab 组件                         |
| controller           | `TabController?`                | 选项卡控制器，未提供时需外层有 DefaultTabController         |
| isScrollable         | `bool`                          | 是否可横向滚动，false 时所有 tab 均分宽度                   |
| padding              | `EdgeInsetsGeometry?`           | TabBar 整体的内边距                                         |
| indicatorColor       | `Color?`                        | 指示器（下划线）颜色                                        |
| indicatorWeight      | `double`                        | 指示器厚度（高度）                                          |
| indicatorPadding     | `EdgeInsetsGeometry`            | 指示器相对于 tab 的内边距                                   |
| indicator            | `Decoration?`                   | 自定义指示器装饰，可完全替代默认下划线                      |
| indicatorSize        | `TabBarIndicatorSize?`          | 指示器宽度模式：tab（匹配标签宽度）或 label（匹配文字宽度） |
| dividerColor         | `Color?`                        | TabBar 底部分割线颜色                                       |
| dividerHeight        | `double?`                       | TabBar 底部分割线高度，设为 0 可隐藏                        |
| labelColor           | `Color?`                        | 选中标签的文字颜色                                          |
| labelStyle           | `TextStyle?`                    | 选中标签的文字样式                                          |
| labelPadding         | `EdgeInsetsGeometry?`           | 每个标签的内边距                                            |
| unselectedLabelColor | `Color?`                        | 未选中标签的文字颜色                                        |
| unselectedLabelStyle | `TextStyle?`                    | 未选中标签的文字样式                                        |
| overlayColor         | `WidgetStateProperty<Color?>?`  | 点击/悬停/聚焦时的水波纹叠加色                              |
| splashFactory        | `InteractiveInkFeatureFactory?` | 自定义水波纹效果，设为 NoSplash.splashFactory 可去除        |
| onTap                | `ValueChanged<int>?`            | 点击 tab 时的回调，参数为索引                               |
| enableFeedback       | `bool?`                         | 是否启用触觉反馈                                            |
| tabAlignment         | `TabAlignment?`                 | tab 的对齐方式（start/center/fill 等）                      |
| textDirection        | `TextDirection?`                | 文本方向（LTR 或 RTL）                                      |
| dragStartBehavior    | `DragStartBehavior`             | 拖拽开始行为                                                |

**四、优缺点与注意事项**

**优点：**

- 与 Material Design 深度集成，开箱即用
- 支持高度自定义（指示器、样式、动画等）
- 与 TabBarView 联动实现滑动切换，体验流畅

**缺点：**

- 必须配合 TabController 或 DefaultTabController 使用，单独使用会报错
- 复杂自定义指示器（如圆角气泡型）需要自行实现 Decoration，成本较高

**注意事项：**

- **最常见错误**：未提供 `TabController` 也未在祖先节点包裹 `DefaultTabController`，会直接抛异常
- `tabs` 数量必须与 `TabBarView.children` 数量及 `TabController.length` 一致，否则断言失败
- 使用自定义 `TabController` 时，所在 State 必须 `with TickerProviderStateMixin`
- `isScrollable: false` 时 tab 数量过多会导致文字被压缩截断；数量不定时建议设为 `true`
- 设置 `labelStyle` 中的字号变化（选中放大）会导致布局跳动，需配合 `labelPadding` 调整
- 隐藏底部分割线：设置 `dividerHeight: 0` 或 `dividerColor: Colors.transparent`



## 40. TabBarView

**一、一句话说明**

TabBarView 是与 TabBar 配合使用的页面视图容器，用于展示每个选项卡对应的内容页面，支持滑动切换。

**二、应用场景**

- 与顶部 TabBar 联动，滑动切换不同分类的内容页面（如新闻频道内容区）
- 商品详情页中"商品/评价/详情"对应的不同内容区域展示
- 用户主页中"动态/收藏/关注"各板块的内容承载
- 表单向导中多步骤页面的左右滑动切换
- 图片/卡片集的可滑动浏览视图

**三、核心属性**

| 属性名            | 类型                | 说明                                                         |
| ----------------- | ------------------- | ------------------------------------------------------------ |
| children          | `List<Widget>`      | 必填，每个 tab 对应的内容页面列表                            |
| controller        | `TabController?`    | 选项卡控制器，未提供时需外层有 DefaultTabController          |
| physics           | `ScrollPhysics?`    | 滑动物理效果，可设为 NeverScrollableScrollPhysics 禁止滑动切换 |
| dragStartBehavior | `DragStartBehavior` | 拖拽开始行为，影响滑动手势的识别起点                         |
| viewportFraction  | `double`            | 每个子页面占视口的比例，小于 1 时可露出相邻页面边缘          |
| clipBehavior      | `Clip`              | 内容裁剪行为                                                 |

**四、优缺点与注意事项**

**优点：**

- 与 TabBar/TabController 自动联动，滑动与点击切换动画天然同步
- 基于 PageView 实现，滑动性能优秀且支持懒加载（默认只构建当前及相邻页面）
- API 极简，配置成本低

**缺点：**

- 无内置的页面缓存机制，切换后页面默认会被销毁重建（需手动用 AutomaticKeepAliveClientMixin 保活）
- 不支持自定义切换动画（固定为水平滑动），需要其他过渡效果须自行实现
- 子页面高度不一致时，TabBarView 不会自适应高度（它总是撑满父容器约束）

**注意事项：**

- **最常见错误**：`children.length` 必须与 `TabController.length`（以及 TabBar 的 `tabs.length`）完全一致，否则断言失败
- **必须有有限高度约束**：TabBarView 内部是 PageView，不能放在无界高度的容器中（如直接放入 Column/ListView），否则报布局错误；需用 `Expanded`、`SizedBox` 或 `Flexible` 包裹提供高度
- 未提供 `controller` 时，祖先节点必须有 `DefaultTabController`，否则抛异常
- 页面切换后状态丢失问题：子页面的 State 中需 `with AutomaticKeepAliveClientMixin` 并重写 `wantKeepAlive => true`，才能在切换后保留状态
- 如需禁止用户手势滑动（仅允许点击 TabBar 切换），将 `physics` 设为 `NeverScrollableScrollPhysics()`
- TabBarView 内部每个 child 嵌套可滚动列表时，注意水平滑动手势冲突问题



## 41. DefaultTabController

**一、一句话说明**

DefaultTabController 是一个便捷的 InheritedWidget，用于在组件树中自动创建并共享 TabController，免去手动管理 TabController 和 TickerProviderStateMixin 的麻烦。

**二、应用场景**

- 简单的 Tab 页面，无需监听切换事件或程序化控制跳转，快速搭建 TabBar + TabBarView
- StatelessWidget 中使用 Tab 导航（无法 mixin TickerProviderStateMixin 时）
- 原型开发或页面结构简单时，减少样板代码快速实现选项卡功能
- 多个子组件需要共享同一个 TabController，通过组件树隐式传递

**三、核心属性**

| 属性名            | 类型        | 说明                                                         |
| ----------------- | ----------- | ------------------------------------------------------------ |
| length            | `int`       | 必填，选项卡总数，必须与 TabBar.tabs 和 TabBarView.children 数量一致 |
| initialIndex      | `int`       | 初始选中的 tab 索引                                          |
| animationDuration | `Duration?` | tab 切换动画时长                                             |
| child             | `Widget`    | 必填，子组件树，其中的 TabBar 和 TabBarView 会自动获取此控制器 |

**四、优缺点与注意事项**

**优点：**

- 极大简化代码，无需手动创建 TabController、无需 StatefulWidget、无需 mixin TickerProviderStateMixin
- 通过 InheritedWidget 机制自动向下传递，子组件无需显式传参即可使用
- 适合快速开发和简单场景，几行代码即可完成 Tab 导航

**缺点：**

- 无法直接获取 TabController 实例来调用 `animateTo()`、监听 `addListener` 等操作（需通过 `DefaultTabController.of(context)` 间接获取，且受 context 位置限制）
- 不适合需要精细控制切换逻辑的复杂场景（如切换前校验、动态增减 tab）
- `length` 变化时整个控制器会重建，可能导致状态丢失

**注意事项：**

- **DefaultTabController 必须是 TabBar 和 TabBarView 的共同祖先**，否则子组件找不到控制器会报错
- 如需在代码中获取控制器实例（如监听切换或程序化跳转），使用 `DefaultTabController.of(context)`，注意 context 必须在 DefaultTabController 之下
- `length` 不能为 0 或负数
- 当需要监听 tab 切换、动态修改 tab 数量、或在切换前做拦截判断时，应改用手动创建 TabController 的方式
- 同时手动给 TabBar/TabBarView 指定了 `controller` 属性时，手动指定的优先级更高，DefaultTabController 会被忽略



## 42. BottomNavigationBar

**一、一句话说明**

BottomNavigationBar 是 Flutter 中用于在屏幕底部显示导航栏的 Material 组件，通过图标和标签实现应用主要页面之间的快速切换。

**二、应用场景**

- App 主页底部导航栏，切换"首页/发现/消息/我的"等主要模块
- 电商类应用底部切换"商城/分类/购物车/订单/个人中心"
- 社交应用底部导航"动态/聊天/通讯录/设置"
- 工具类应用底部切换不同功能面板
- 内容类应用底部分区"推荐/关注/热榜/我的"

**三、核心属性**

| 属性名               | 类型                                  | 说明                                                     |
| -------------------- | ------------------------------------- | -------------------------------------------------------- |
| items                | `List<BottomNavigationBarItem>`       | 必填，导航项列表，至少 2 个                              |
| currentIndex         | `int`                                 | 当前选中项的索引                                         |
| onTap                | `ValueChanged<int>?`                  | 点击导航项时的回调，参数为被点击项的索引                 |
| type                 | `BottomNavigationBarType?`            | 导航栏类型：fixed（固定）或 shifting（切换时带位移动画） |
| backgroundColor      | `Color?`                              | 导航栏背景色                                             |
| elevation            | `double?`                             | 阴影高度                                                 |
| iconSize             | `double`                              | 图标大小                                                 |
| selectedItemColor    | `Color?`                              | 选中项的图标和文字颜色                                   |
| unselectedItemColor  | `Color?`                              | 未选中项的图标和文字颜色                                 |
| selectedIconTheme    | `IconThemeData?`                      | 选中项的图标主题（大小、颜色、透明度）                   |
| unselectedIconTheme  | `IconThemeData?`                      | 未选中项的图标主题                                       |
| selectedLabelStyle   | `TextStyle?`                          | 选中项的标签文字样式                                     |
| unselectedLabelStyle | `TextStyle?`                          | 未选中项的标签文字样式                                   |
| selectedFontSize     | `double`                              | 选中项的字体大小                                         |
| unselectedFontSize   | `double`                              | 未选中项的字体大小                                       |
| showSelectedLabels   | `bool?`                               | 是否显示选中项的文字标签                                 |
| showUnselectedLabels | `bool?`                               | 是否显示未选中项的文字标签                               |
| enableFeedback       | `bool?`                               | 是否启用触觉反馈                                         |
| landscapeLayout      | `BottomNavigationBarLandscapeLayout?` | 横屏时的布局方式                                         |
| useLegacyColorScheme | `bool`                                | 是否使用旧版配色方案                                     |
| mouseCursor          | `MouseCursor?`                        | 鼠标悬停时的光标样式                                     |

**四、优缺点与注意事项**

**优点：**

- Material Design 规范开箱即用，自带选中动画和水波纹效果
- 支持 fixed 和 shifting 两种风格，适配不同设计需求
- 与 Scaffold.bottomNavigationBar 无缝集成，自动处理安全区域

**缺点：**

- `items` 数量必须 ≥ 2，否则断言失败
- 官方已推荐使用 `NavigationBar`（Material 3）替代，BottomNavigationBar 属于 Material 2 风格，未来可能逐步弱化
- 自定义程度有限，复杂造型（如中间凸起按钮）需额外配合 FloatingActionButton + `Scaffold.floatingActionButtonLocation`

**注意事项：**

- **items 数量 ≥ 4 时**，`type` 默认变为 `shifting`，未选中项标签会隐藏且背景变白，需手动设为 `BottomNavigationBarType.fixed` 保持一致表现
- `onTap` 回调中需自行调用 `setState` 更新 `currentIndex`，组件本身不会自动切换选中状态
- `selectedFontSize` 与 `unselectedFontSize` 不同时，切换会导致图标上下跳动；如不需要此效果，应将两者设为相同值
- 页面保活问题：BottomNavigationBar 本身不管理页面，需配合 `IndexedStack` 或 `PageView` 保持子页面状态，否则切换后页面会重建
- 与 `NavigationBar`（Material 3）不要混淆，两者 API 不同且视觉风格有差异



## 43. NavigationBar

**一、一句话说明**

NavigationBar 是 Flutter Material 3 规范下的底部导航栏组件，用于在应用主要目的地之间切换，是 BottomNavigationBar 的现代替代品。

**二、应用场景**

- Material 3 风格应用的底部主导航，切换"首页/搜索/收藏/个人"等模块
- 需要选中项带药丸形（pill-shaped）指示器高亮效果的底部导航
- 适配最新 Material Design 规范的新项目开发
- 导航项需要展示 Badge 角标（如未读消息数）的场景
- 跨平台应用中需要统一现代化视觉风格的底部导航

**三、核心属性**

| 属性名                | 类型                                  | 说明                                             |
| --------------------- | ------------------------------------- | ------------------------------------------------ |
| destinations          | `List<NavigationDestination>`         | 必填，导航目的地列表，至少 2 个                  |
| selectedIndex         | `int`                                 | 当前选中项的索引                                 |
| onDestinationSelected | `ValueChanged<int>?`                  | 点击导航项时的回调，参数为索引                   |
| backgroundColor       | `Color?`                              | 导航栏背景色                                     |
| elevation             | `double?`                             | 阴影高度                                         |
| shadowColor           | `Color?`                              | 阴影颜色                                         |
| surfaceTintColor      | `Color?`                              | 表面着色叠加色（Material 3 色彩系统）            |
| indicatorColor        | `Color?`                              | 选中项指示器（药丸形背景）的颜色                 |
| indicatorShape        | `ShapeBorder?`                        | 选中项指示器的形状                               |
| height                | `double?`                             | 导航栏高度                                       |
| labelBehavior         | `NavigationDestinationLabelBehavior?` | 标签显示行为：始终显示 / 仅选中时显示 / 全部隐藏 |
| animationDuration     | `Duration?`                           | 选中切换的动画时长                               |
| overlayColor          | `WidgetStateProperty<Color?>?`        | 点击/悬停/聚焦时的叠加色                         |

**四、优缺点与注意事项**

**优点：**

- 完全遵循 Material 3 设计规范，自带药丸形选中指示器动画，视觉现代
- 使用 `NavigationDestination` 作为子项，原生支持 `icon` 和 `selectedIcon` 分别设置，比 BottomNavigationBarItem 更清晰
- 不存在 BottomNavigationBar 中 ≥4 项自动切换 shifting 模式的陷阱，行为一致
- 与 Scaffold.bottomNavigationBar 无缝集成

**缺点：**

- 仅适用于 Material 3 风格，如需 Material 2 风格应使用 BottomNavigationBar
- 自定义程度相对有限，指示器只能改颜色和形状，无法完全自定义样式
- 不直接支持中间凸起的 FAB 造型

**注意事项：**

- **与 BottomNavigationBar 不要混淆**：子项类型不同，NavigationBar 用 `NavigationDestination`，BottomNavigationBar 用 `BottomNavigationBarItem`
- `onDestinationSelected` 回调中需自行 `setState` 更新 `selectedIndex`，组件不会自动管理选中状态
- `destinations` 数量必须 ≥ 2，否则断言失败
- 页面保活需自行处理，通常配合 `IndexedStack` 防止切换时子页面重建
- `labelBehavior` 设为 `onlyShowSelected` 时，未选中项只显示图标，切换时会有标签展开/收起动画
- 确保项目的 `useMaterial3: true`（Flutter 3.16+ 已默认开启），否则视觉效果可能不符合预期



## 44. Scrollbar

**一、一句话说明**

Scrollbar 是一个 Material 风格的滚动条组件，包裹在可滚动视图外层，用于显示当前滚动位置并支持拖拽滚动条快速定位。

**二、应用场景**

- 长列表（ListView、GridView）需要可视化滚动进度时
- 桌面端/Web 端应用中用户习惯通过拖拽滚动条进行导航
- 内容区域较长，需要让用户快速感知当前所处位置
- 嵌套滚动视图中为特定区域单独提供滚动指示

**三、核心属性**

| 属性名                | 类型                        | 说明                                                         |
| --------------------- | --------------------------- | ------------------------------------------------------------ |
| child                 | Widget                      | 必需，内部的可滚动子组件（如 ListView、SingleChildScrollView 等） |
| controller            | ScrollController?           | 关联的滚动控制器，当页面存在多个可滚动组件时必须显式指定     |
| thumbVisibility       | bool?                       | 滚动条滑块是否始终可见（true 为常驻显示，false 为自动隐藏）  |
| trackVisibility       | bool?                       | 滚动条轨道是否始终可见                                       |
| thickness             | double?                     | 滚动条滑块的粗细（宽度）                                     |
| radius                | Radius?                     | 滚动条滑块的圆角半径                                         |
| interactive           | bool?                       | 是否允许用户拖拽滚动条进行滚动                               |
| scrollbarOrientation  | ScrollbarOrientation?       | 强制指定滚动条显示的位置（左/右/上/下）                      |
| notificationPredicate | ScrollNotificationPredicate | 决定响应哪一层级的滚动通知，默认只响应最近的可滚动组件       |

**四、优缺点与注意事项**

**优点：**

- 开箱即用，自动跟随 Material 主题样式
- 支持拖拽交互，桌面端/Web 端体验好
- 可通过 `ScrollbarThemeData` 全局统一配置样式

**缺点：**

- 自定义能力有限，复杂的自定义滚动条样式需使用 `RawScrollbar` 或第三方库
- 移动端默认自动隐藏，视觉提示较弱

**新手易踩的坑：**

- **页面有多个可滚动组件时**未给 Scrollbar 指定 `controller` 会报错，必须将同一个 `ScrollController` 同时传给 Scrollbar 和其子可滚动组件
- `thumbVisibility` 设为 `true` 时，**必须**提供 `controller`，否则会抛出断言错误
- Scrollbar 必须直接或间接包裹一个可滚动组件，否则无法正常工作
- 在 iOS 平台上推荐使用 `CupertinoScrollbar` 以符合平台风格
- `isAlwaysShown` 和 `showTrackOnHover` 已废弃，应分别使用 `thumbVisibility` 和 `trackVisibility` 替代





## 45. FutureBuilder

**一、一句话说明**

FutureBuilder 是一个根据 Future 的异步执行状态（等待中、完成、出错）自动重建 UI 的组件，用于将异步操作的结果映射到界面展示。

**二、应用场景**

- 页面初始化时从网络请求数据，根据加载/成功/失败状态展示不同 UI
- 从本地数据库或 SharedPreferences 异步读取数据后渲染界面
- 调用平台通道（MethodChannel）获取原生端结果并展示
- 读取本地文件或资源（如 JSON 配置）后构建界面
- 执行一次性计算密集型任务（通过 `compute`）并展示结果

**三、核心属性**

| 属性名      | 类型                  | 说明                                                         |
| ----------- | --------------------- | ------------------------------------------------------------ |
| future      | Future<T>?            | 要监听的异步任务，为 null 时 snapshot 状态保持为 none        |
| builder     | AsyncWidgetBuilder<T> | 必需，根据 AsyncSnapshot 构建 UI 的回调，每次状态变化都会调用 |
| initialData | T?                    | Future 完成前 snapshot.data 的初始值，使 snapshot.hasData 为 true |

**四、优缺点与注意事项**

**优点：**

- 用声明式方式处理异步状态，代码结构清晰，无需手动 `setState`
- `AsyncSnapshot` 提供 `connectionState`、`data`、`error` 三维信息，覆盖所有异步阶段
- 轻量简洁，适合一次性异步操作的 UI 绑定

**缺点：**

- 仅适合**一次性**异步操作，不适合持续数据流（流式数据应使用 `StreamBuilder`）
- 没有内置的重试、缓存、分页等机制，复杂场景需自行封装或借助状态管理方案
- builder 中无法区分"首次加载"与"Future 被替换后的重新加载"

**新手易踩的坑：**

- **最常见错误：** 将 Future 的创建写在 `build` 方法内（如 `future: fetchData()`），每次 rebuild 都会产生新 Future，导致无限重建。**必须**将 Future 缓存在 `initState` 或成员变量中
- `snapshot.data` 在 `ConnectionState.waiting` 阶段可能为 null（除非设了 `initialData`），直接使用需判空
- 正确的判断顺序应为：先检查 `snapshot.hasError`，再检查 `snapshot.hasData`，最后处理 loading 状态
- FutureBuilder 在 widget 被销毁后 Future 仍可能完成，不会自动取消 Future；若 Future 回调中有副作用需自行处理生命周期
- 当传入的 `future` 引用发生变化（即不同的 Future 实例）时，FutureBuilder 会重新监听，旧 Future 的结果将被忽略



## 46. Navigator

**一、一句话说明**

Navigator 是 Flutter 的页面路由管理组件，以栈结构管理 Route 对象，实现页面的压入（push）、弹出（pop）及替换等导航操作。

**二、应用场景**

- 应用内页面间的前进、后退导航（如首页跳转到详情页）
- 使用命名路由集中管理多页面跳转路径
- 页面跳转后携带参数传递或等待目标页面返回结果
- 在局部区域实现嵌套导航（如底部导航栏内各 Tab 独立维护页面栈）
- 登录/引导流程中通过 `pushReplacement` 替换页面栈防止回退

**三、核心属性**

**Navigator Widget 本身属性（用于嵌套导航或自定义 Navigator 时）：**

| 属性名          | 类型                    | 说明                                                       |
| --------------- | ----------------------- | ---------------------------------------------------------- |
| initialRoute    | String?                 | 初始路由名称，Navigator 创建时首先压入的路由               |
| onGenerateRoute | RouteFactory?           | 根据 RouteSettings 动态生成 Route，处理命名路由的核心回调  |
| onUnknownRoute  | RouteFactory?           | 当 onGenerateRoute 无法匹配时的兜底回调，用于 404 页面     |
| pages           | List<Page>              | 声明式导航的页面列表（Navigator 2.0），配合 onPopPage 使用 |
| onPopPage       | PopPageCallback?        | 声明式导航中处理页面弹出的回调，决定是否允许 pop           |
| observers       | List<NavigatorObserver> | 导航观察者列表，可监听 push/pop/replace 等事件             |

**Navigator 常用静态方法（通过 `Navigator.of(context)` 调用）：**

| 方法名                                       | 说明                                      |
| -------------------------------------------- | ----------------------------------------- |
| push                                         | 将一个新 Route 压入栈顶                   |
| pushNamed                                    | 通过路由名称压入新页面                    |
| pop                                          | 弹出栈顶页面，可携带返回值                |
| pushReplacement / pushReplacementNamed       | 用新页面替换当前栈顶页面                  |
| pushAndRemoveUntil / pushNamedAndRemoveUntil | 压入新页面并移除之前的页面直到满足条件    |
| popUntil                                     | 连续弹出页面直到满足条件                  |
| canPop                                       | 判断当前栈是否可以 pop                    |
| maybePop                                     | 尝试 pop，若不可 pop 则不执行（安全 pop） |
| popAndPushNamed                              | 先 pop 当前页面再 push 新命名路由         |

**四、优缺点与注意事项**

**优点：**

- 命令式 API（push/pop）直观易懂，上手成本低
- 支持命名路由，便于集中管理和维护路由表
- Navigator 2.0 声明式 API 可满足复杂导航需求（深链接、Web URL 同步等）
- 支持嵌套 Navigator 实现局部导航，灵活度高

**缺点：**

- Navigator 1.0 命令式 API 难以处理深链接和 Web URL 同步
- Navigator 2.0 声明式 API 概念复杂（Router、RouteInformationParser、RouterDelegate），学习曲线陡峭
- 原生 API 缺少路由守卫、路由拦截等高级功能，复杂项目通常需借助第三方路由库（如 go_router）

**新手易踩的坑：**

- **Context 错误：** 在 `MaterialApp` 所在的 `build` 方法中直接使用 `Navigator.of(context)` 会找不到 Navigator，因为 Navigator 是 MaterialApp 内部创建的，需要使用其子组件的 context
- `push` 返回的是 `Future`，要获取目标页面的返回值需 `await`，目标页面通过 `Navigator.pop(context, result)` 传回
- 使用命名路由时忘记在 `MaterialApp.routes` 或 `onGenerateRoute` 中注册，会导致黑屏或报错
- `pushReplacement` 和 `pushAndRemoveUntil` 的区别要分清：前者只替换栈顶一个，后者可清除到指定位置
- 嵌套 Navigator 场景下，Android 物理返回键默认作用于根 Navigator，需通过 `WillPopScope`（或 `PopScope`）拦截处理内层导航的回退逻辑



## 47. Visibility

**一、一句话说明**

Visibility 是一个控制子组件是否可见的组件，可以在隐藏时选择是否保留占位空间、是否参与交互和绘制等行为。

**二、应用场景**

- 根据条件动态显示或隐藏某个 UI 元素（如权限控制下的按钮）
- 隐藏组件但仍保留其占位空间，避免布局跳动
- 隐藏组件的同时保持其状态（State）不被销毁
- 调试时临时隐藏某个组件但不想删除代码

**三、核心属性**

| 属性名                | 类型   | 说明                                                         |
| --------------------- | ------ | ------------------------------------------------------------ |
| child                 | Widget | 必需，被控制可见性的子组件                                   |
| visible               | bool   | 是否可见，false 时根据其他属性决定隐藏行为                   |
| replacement           | Widget | 不可见时用来替代 child 的组件，默认为 SizedBox.shrink()      |
| maintainState         | bool   | 不可见时是否保留子组件的 State 对象                          |
| maintainAnimation     | bool   | 不可见时是否保持动画继续运行（需 maintainState 为 true）     |
| maintainSize          | bool   | 不可见时是否保留子组件原有的布局尺寸（占位空间）（需 maintainAnimation 为 true） |
| maintainSemantics     | bool   | 不可见时是否保留语义信息用于无障碍（需 maintainSize 为 true） |
| maintainInteractivity | bool   | 不可见时是否仍可接收交互事件（需 maintainSize 为 true）      |

**四、优缺点与注意事项**

**优点：**

- 提供细粒度的隐藏策略，可精确控制隐藏后的状态保留、占位、交互等行为
- 比手动用条件判断 `if/else` 切换组件更语义化，意图清晰
- `maintainSize: true` 可实现类似 CSS `visibility: hidden` 的效果（隐藏但占位）

**缺点：**

- maintain 系列属性存在严格的依赖链（maintainSize → maintainAnimation → maintainState），配置不当会抛断言错误
- 当仅需简单的"显示/不显示"且不关心状态保留时，直接用条件表达式更简洁

**新手易踩的坑：**

- **maintain 属性的依赖关系：** `maintainSize: true` 必须同时设置 `maintainAnimation: true`；`maintainAnimation: true` 必须同时设置 `maintainState: true`。缺少任一前置条件都会报错
- `visible: false` 且所有 maintain 均为 false 时，child 会被完全移除并替换为 `replacement`，子组件的 State 会丢失；若需保持状态，必须显式开启 `maintainState`
- Visibility 与 `Offstage` 的区别：Offstage 隐藏时不绘制也不占位但仍保留 State，而 Visibility 默认隐藏时连 State 都不保留，需要通过 maintain 系列属性手动开启
- 仅需占位隐藏的简单场景，也可直接用 `Opacity(opacity: 0)` 替代，但 Opacity 仍会响应点击事件，Visibility 在 `maintainInteractivity: false` 时不会.



## 48. AnimatedContainer

**一、一句话说明**

AnimatedContainer 是 Container 的隐式动画版本，当其属性值发生变化时自动在新旧值之间平滑过渡，无需手动管理 AnimationController。

**二、应用场景**

- 点击按钮后平滑改变容器的大小、颜色或圆角等视觉属性
- 状态切换时实现卡片展开/收缩的过渡动画
- 选中/未选中状态下容器样式（边框、背景色、阴影）的平滑切换
- 响应式布局中容器尺寸随条件变化时添加动画效果
- 简单的位置移动动画（通过改变 margin 或 alignment）

**三、核心属性**

| 属性名               | 类型                | 说明                                                |
| -------------------- | ------------------- | --------------------------------------------------- |
| child                | Widget?             | 容器内的子组件（child 本身不参与动画过渡）          |
| duration             | Duration            | 必需，动画的持续时长                                |
| curve                | Curve               | 动画的缓动曲线                                      |
| onEnd                | VoidCallback?       | 动画完成时的回调                                    |
| alignment            | AlignmentGeometry?  | 子组件在容器内的对齐方式                            |
| padding              | EdgeInsetsGeometry? | 容器内边距                                          |
| margin               | EdgeInsetsGeometry? | 容器外边距                                          |
| width                | double?             | 容器宽度                                            |
| height               | double?             | 容器高度                                            |
| constraints          | BoxConstraints?     | 容器的额外约束条件                                  |
| color                | Color?              | 容器背景色（不可与 decoration 中的 color 同时使用） |
| decoration           | Decoration?         | 容器的装饰（背景色、圆角、边框、渐变、阴影等）      |
| foregroundDecoration | Decoration?         | 绘制在 child 之上的前景装饰                         |
| transform            | Matrix4?            | 容器的变换矩阵（旋转、缩放、平移等）                |
| transformAlignment   | AlignmentGeometry?  | 变换的锚点对齐方式                                  |
| clipBehavior         | Clip                | 内容超出装饰范围时的裁剪行为                        |

**四、优缺点与注意事项**

**优点：**

- 零门槛动画：无需 AnimationController、Tween、setState 配合，只需改变属性值即可触发动画
- 支持的可动画属性丰富，涵盖尺寸、颜色、边距、装饰、变换等
- `onEnd` 回调可用于链式触发后续动画或逻辑

**缺点：**

- **child 不参与动画过渡**，child 的变化是瞬间替换而非渐变（需要 child 过渡应使用 AnimatedSwitcher）
- 无法精细控制动画（如反向播放、重复、监听中间值），复杂场景需改用显式动画
- 每次属性变化都会触发动画，无法选择性跳过某次变化

**新手易踩的坑：**

- **必须通过 `setState` 改变属性值**才能触发动画，直接修改变量而不调用 setState 不会触发重建和动画
- `color` 属性和 `decoration` 中的 `color` 不能同时设置，否则会报错；需要背景色动画时统一写在 `decoration` 里
- `decoration` 类型变化（如从 `BoxDecoration` 变为 `ShapeDecoration`）无法插值过渡，会直接跳变；确保前后 decoration 类型一致
- `transform` 动画是对 Matrix4 进行插值，某些变换组合可能产生非预期的中间状态，简单旋转/缩放建议使用 `AnimatedRotation`、`AnimatedScale` 等专用组件
- 动画未完成时属性再次变化，会从当前中间状态平滑过渡到新值，不会出现跳变，这是正常行为



## 49. GridView

**一、一句话说明**

GridView 是 Flutter 中用于将子组件以二维网格形式排列展示的可滚动列表组件。

**二、应用场景**

- 图片/相册九宫格展示
- 电商商品列表的多列瀑布流卡片展示
- 应用首页功能入口图标网格排列（如支付宝/微信九宫格菜单）
- 设置页面中多选项的网格选择器（如主题色选择）
- 文件管理器中的缩略图网格浏览

**三、核心属性**

**GridView 通用属性：**

| 属性名                  | 类型                              | 说明                                               |
| ----------------------- | --------------------------------- | -------------------------------------------------- |
| gridDelegate            | SliverGridDelegate                | 控制网格布局方式（列数、宽高比、间距等），核心属性 |
| scrollDirection         | Axis                              | 滚动方向，水平或垂直                               |
| reverse                 | bool                              | 是否反向排列                                       |
| controller              | ScrollController                  | 滚动控制器，用于监听或控制滚动位置                 |
| primary                 | bool                              | 是否使用父级 PrimaryScrollController               |
| physics                 | ScrollPhysics                     | 滚动物理效果（弹性、固定等）                       |
| shrinkWrap              | bool                              | 是否根据子组件总长度来设置自身尺寸，而非填满父容器 |
| padding                 | EdgeInsetsGeometry                | 网格内边距                                         |
| children                | List<Widget>                      | 直接传入子组件列表（适用于少量子项）               |
| cacheExtent             | double                            | 预渲染区域的像素范围                               |
| semanticChildCount      | int                               | 语义子项数量，用于无障碍                           |
| keyboardDismissBehavior | ScrollViewKeyboardDismissBehavior | 滚动时键盘的关闭行为                               |
| clipBehavior            | Clip                              | 内容裁剪方式                                       |
| dragStartBehavior       | DragStartBehavior                 | 拖拽开始行为的判定方式                             |

**GridView.builder 额外属性：**

| 属性名      | 类型                 | 说明                             |
| ----------- | -------------------- | -------------------------------- |
| itemBuilder | IndexedWidgetBuilder | 按需构建子项的回调函数（懒加载） |
| itemCount   | int                  | 子项总数，不设置则为无限列表     |

**GridView.count 额外属性（语法糖）：**

| 属性名           | 类型   | 说明                         |
| ---------------- | ------ | ---------------------------- |
| crossAxisCount   | int    | 交叉轴方向的列数（固定列数） |
| mainAxisSpacing  | double | 主轴方向子项间距             |
| crossAxisSpacing | double | 交叉轴方向子项间距           |
| childAspectRatio | double | 子项宽高比                   |

**GridView.extent 额外属性（语法糖）：**

| 属性名             | 类型   | 说明                                   |
| ------------------ | ------ | -------------------------------------- |
| maxCrossAxisExtent | double | 交叉轴方向子项的最大宽度，自动计算列数 |
| mainAxisSpacing    | double | 主轴方向子项间距                       |
| crossAxisSpacing   | double | 交叉轴方向子项间距                     |
| childAspectRatio   | double | 子项宽高比                             |

**两个内置 SliverGridDelegate：**

| 属性名                                                      | 类型   | 说明                                                 |
| ----------------------------------------------------------- | ------ | ---------------------------------------------------- |
| SliverGridDelegateWithFixedCrossAxisCount.crossAxisCount    | int    | 固定列数                                             |
| SliverGridDelegateWithFixedCrossAxisCount.mainAxisSpacing   | double | 主轴间距                                             |
| SliverGridDelegateWithFixedCrossAxisCount.crossAxisSpacing  | double | 交叉轴间距                                           |
| SliverGridDelegateWithFixedCrossAxisCount.childAspectRatio  | double | 子项宽高比                                           |
| SliverGridDelegateWithFixedCrossAxisCount.mainAxisExtent    | double | 子项主轴方向固定尺寸（设置后 childAspectRatio 失效） |
| SliverGridDelegateWithMaxCrossAxisExtent.maxCrossAxisExtent | double | 子项交叉轴最大宽度，自动算列数                       |
| SliverGridDelegateWithMaxCrossAxisExtent.mainAxisSpacing    | double | 主轴间距                                             |
| SliverGridDelegateWithMaxCrossAxisExtent.crossAxisSpacing   | double | 交叉轴间距                                           |
| SliverGridDelegateWithMaxCrossAxisExtent.childAspectRatio   | double | 子项宽高比                                           |
| SliverGridDelegateWithMaxCrossAxisExtent.mainAxisExtent     | double | 子项主轴方向固定尺寸                                 |

**四、优缺点与注意事项**

**优点：**

- 提供多种构造方式（默认、builder、count、extent），覆盖不同场景
- `GridView.builder` 支持懒加载，适合大数据量场景，性能优异
- `GridView.count` 和 `GridView.extent` 语法糖简洁易用，上手快

**缺点：**

- 原生不支持瀑布流（子项高度不一致）布局，需借助第三方包如 `flutter_staggered_grid_view`
- 所有子项受 `childAspectRatio` 约束为统一尺寸，灵活性有限

**注意事项：**

- **`shrinkWrap: true` 慎用**：会一次性计算所有子项高度，丧失懒加载优势，数据量大时严重影响性能；嵌套在 `ListView` 中时常被迫开启，应优先考虑用 `CustomScrollView` + `SliverGrid` 替代
- **少量子项用默认构造，大量子项必须用 `GridView.builder`**：默认构造会一次性构建所有 children，数据多时卡顿
- **嵌套滚动冲突**：GridView 放在另一个可滚动组件中时，需设置 `shrinkWrap: true` 和 `physics: NeverScrollableScrollPhysics()`，否则会报错或滚动冲突
- **`childAspectRatio` 与 `mainAxisExtent` 互斥**：设置了 `mainAxisExtent` 后 `childAspectRatio` 会被忽略
- **`crossAxisCount` vs `maxCrossAxisExtent`**：前者固定列数（不同屏幕子项大小不同），后者固定子项最大宽度（自动适配列数），响应式布局优先用后者



## 50. PageView

**一、一句话说明**

PageView 是 Flutter 中用于实现页面级滑动切换的可滚动组件，每次滑动展示一个完整页面。

**二、应用场景**

- App 首次启动时的引导页/欢迎页轮播
- 图片详情的全屏左右滑动浏览
- 首页 Banner 广告轮播图
- Tab 页面的左右滑动切换（配合 TabBar 使用）
- 短视频上下滑动切换（如抖音式交互）

**三、核心属性**

**PageView 通用属性：**

| 属性名                 | 类型              | 说明                                                         |
| ---------------------- | ----------------- | ------------------------------------------------------------ |
| controller             | PageController    | 页面控制器，控制初始页、页面跳转、监听页面变化等             |
| scrollDirection        | Axis              | 滚动方向，水平或垂直                                         |
| reverse                | bool              | 是否反向排列页面顺序                                         |
| physics                | ScrollPhysics     | 滚动物理效果（弹性、禁止滑动等）                             |
| onPageChanged          | ValueChanged<int> | 页面切换时的回调，返回当前页索引                             |
| pageSnapping           | bool              | 是否开启页面吸附效果，关闭后可自由停在任意位置               |
| children               | List<Widget>      | 直接传入子页面列表（适用于少量页面）                         |
| padEnds                | bool              | 是否在列表两端添加内边距使首尾页居中（配合 viewportFraction < 1 使用） |
| allowImplicitScrolling | bool              | 是否允许辅助功能隐式滚动，影响无障碍和页面预缓存             |
| clipBehavior           | Clip              | 内容裁剪方式                                                 |
| dragStartBehavior      | DragStartBehavior | 拖拽开始行为的判定方式                                       |
| scrollBehavior         | ScrollBehavior    | 自定义滚动行为（如滚动条、过度滚动效果等）                   |

**PageView.builder 额外属性：**

| 属性名      | 类型                 | 说明                             |
| ----------- | -------------------- | -------------------------------- |
| itemBuilder | IndexedWidgetBuilder | 按需构建页面的回调函数（懒加载） |
| itemCount   | int                  | 页面总数，不设置则为无限滚动     |

**PageView.custom 额外属性：**

| 属性名           | 类型                | 说明                               |
| ---------------- | ------------------- | ---------------------------------- |
| childrenDelegate | SliverChildDelegate | 自定义子项生成代理，提供最大灵活性 |

**PageController 核心属性与方法：**

| 属性名/方法      | 类型         | 说明                                              |
| ---------------- | ------------ | ------------------------------------------------- |
| initialPage      | int          | 初始显示的页面索引                                |
| viewportFraction | double       | 每个页面占视口的比例，小于 1 时可露出相邻页面边缘 |
| keepPage         | bool         | 是否在控制器重新关联时保留当前页面位置            |
| page             | double?      | 当前页面位置（可含小数，表示滑动中间态）          |
| animateToPage()  | Future<void> | 带动画跳转到指定页面，可指定 duration 和 curve    |
| jumpToPage()     | void         | 无动画直接跳转到指定页面                          |
| nextPage()       | Future<void> | 带动画跳转到下一页                                |
| previousPage()   | Future<void> | 带动画跳转到上一页                                |

**四、优缺点与注意事项**

**优点：**

- 内置页面吸附效果（pageSnapping），滑动体验自然流畅
- `viewportFraction` 可轻松实现卡片式轮播（露出左右邻页）效果
- `PageView.builder` 支持懒加载，适合大量或无限页面场景
- 支持水平和垂直两个方向，覆盖横滑和竖滑场景

**缺点：**

- 默认不缓存已划过的页面，切回时会重建，需配合 `AutomaticKeepAliveClientMixin` 手动保活
- 不自带页面指示器（小圆点），需自行实现或借助第三方包

**注意事项：**

- **页面状态丢失**：默认只保留当前页及相邻页面（由 `allowImplicitScrolling` 和缓存范围决定），切换后页面会被销毁重建；需要保持状态时，子页面必须混入 `AutomaticKeepAliveClientMixin` 并重写 `wantKeepAlive => true`
- **PageController 生命周期**：必须在 `initState` 中创建，在 `dispose` 中销毁，避免内存泄漏
- **监听页面变化的两种方式**：`onPageChanged` 回调只返回整数索引；若需要监听滑动过程中的连续位置变化（如联动动画），应通过 `controller.addListener` 读取 `controller.page`
- **嵌套滚动冲突**：PageView 嵌套在同方向的可滚动组件中会产生手势冲突，需调整 `physics` 或使用 `NeverScrollableScrollPhysics` 禁用内层/外层之一的滚动
- **无限轮播实现**：`PageView.builder` 不设 `itemCount` 可无限滑动，但需在 `itemBuilder` 中对索引取模来循环展示内容，并将 `initialPage` 设为一个很大的中间值以支持双向滑动
- **`viewportFraction` 小于 1 时**：配合 `padEnds: true`（默认）可让首尾页居中显示；设为 `false` 则首页左对齐，视觉效果不同
- **与 TabBarView 的关系**：`TabBarView` 内部就是基于 `PageView` 实现的，如果已经用了 TabBar + TabBarView，通常不需要再手动使用 PageView



## 51. StreamBuilder

**一、一句话说明**

StreamBuilder 是 Flutter 中用于监听 Stream（异步数据流）并根据流的最新状态自动重建 UI 的组件。

**二、应用场景**

- 实时聊天消息列表的动态更新
- WebSocket / SSE 推送数据的实时展示
- Firebase Firestore 等实时数据库的数据监听与展示
- 倒计时、计时器等周期性数据驱动的 UI 更新
- BLoC 模式中监听状态流来构建界面

**三、核心属性**

**StreamBuilder 属性：**

| 属性名      | 类型                                            | 说明                                                         |
| ----------- | ----------------------------------------------- | ------------------------------------------------------------ |
| stream      | Stream<T>?                                      | 要监听的异步数据流，为 null 时 snapshot 处于无数据的等待状态 |
| initialData | T?                                              | 流尚未发出任何数据前的初始值，会影响 snapshot 的初始状态     |
| builder     | Widget Function(BuildContext, AsyncSnapshot<T>) | 根据当前快照状态构建 UI 的回调，每次流有新事件都会调用       |

**AsyncSnapshot<T> 核心属性与方法：**

| 属性名/方法     | 类型            | 说明                                               |
| --------------- | --------------- | -------------------------------------------------- |
| connectionState | ConnectionState | 当前流的连接状态（none / waiting / active / done） |
| data            | T?              | 流最近一次发出的数据，无数据时为 null              |
| hasData         | bool            | 是否有数据（data != null）                         |
| error           | Object?         | 流最近一次发出的错误，无错误时为 null              |
| hasError        | bool            | 是否有错误（error != null）                        |
| stackTrace      | StackTrace?     | 错误关联的堆栈追踪信息                             |
| requireData     | T               | 强制获取 data，无数据时抛异常                      |

**ConnectionState 枚举值：**

| 枚举值  | 说明                           |
| ------- | ------------------------------ |
| none    | 未连接任何流（stream 为 null） |
| waiting | 已连接流但尚未收到任何数据     |
| active  | 流处于活跃状态，正在接收数据   |
| done    | 流已关闭，不会再有新数据       |

**四、优缺点与注意事项**

**优点：**

- 声明式地将异步数据流与 UI 绑定，无需手动 `listen` / `cancel` / `setState`，代码简洁
- 自动管理 Stream 订阅的生命周期（组件销毁时自动取消订阅）
- `AsyncSnapshot` 提供完整的状态信息（等待、数据、错误、完成），便于分状态构建 UI

**缺点：**

- 每次流发出数据都会触发 `builder` 重建整棵子树，频繁更新时可能有性能问题
- 只能获取流的最新一条数据，无法直接访问历史数据（需自行在外部累积）

**注意事项：**

- **builder 中必须处理所有状态**：至少要处理 `waiting`（加载中）、`hasError`（错误）、`hasData`（正常数据）三种情况，否则会出现空白或报错
- **stream 不要在 `build` 方法中创建**：如果每次 `build` 都创建新的 Stream，StreamBuilder 会反复取消旧订阅并重新订阅，导致状态重置和无限重建；应在 `initState` 或外部创建并缓存 stream 引用
- **`done` 状态下 `data` 仍保留**：流关闭后 `connectionState` 变为 `done`，但 `data` 保留最后一次的值，`hasData` 仍为 true；不要误以为流关闭后数据就没了
- **`error` 和 `data` 可同时存在**：snapshot 保留的是"最近一次数据"和"最近一次错误"，收到错误后 `hasError` 为 true 但之前的 `data` 可能仍非 null；判断优先级建议：先判 `hasError`，再判 `hasData`
- **广播流 vs 单订阅流**：StreamBuilder 内部会 `listen` 该流，如果传入单订阅流（Single-subscription Stream）且已被其他地方监听过，会抛异常；此场景需使用 `stream.asBroadcastStream()` 转换
- **与 FutureBuilder 的区别**：FutureBuilder 适用于一次性异步操作（只返回一个结果），StreamBuilder 适用于持续的数据流（多次返回结果）；不要用 StreamBuilder 监听 Future
- **initialData 的影响**：设置了 `initialData` 后，首次构建时 `connectionState` 仍为 `waiting` 但 `hasData` 为 true、`data` 为初始值，可避免展示加载状态的闪烁



## 52. Hero

**一、一句话说明**

Hero 是 Flutter 中用于在页面路由切换时实现共享元素过渡动画的组件，使同一元素在两个页面间平滑飞行过渡。

**二、应用场景**

- 列表页点击缩略图飞入详情页大图的过渡动画
- 商品卡片点击后图片/标题飞入商品详情页
- 头像从列表飞入个人主页的过渡效果
- 浮动按钮（FAB）变形飞入新页面的转场动画
- 卡片展开为全屏页面的共享元素过渡

**三、核心属性**

| 属性名                   | 类型                      | 说明                                                         |
| ------------------------ | ------------------------- | ------------------------------------------------------------ |
| tag                      | Object                    | 唯一标识，起始页和目标页的 Hero 必须使用相同的 tag 才能配对飞行 |
| child                    | Widget                    | Hero 包裹的子组件，即参与过渡动画的元素                      |
| flightShuttleBuilder     | HeroFlightShuttleBuilder? | 自定义飞行过程中显示的组件（默认使用目标页的 child）         |
| placeholderBuilder       | HeroPlaceholderBuilder?   | 飞行期间在原位置显示的占位组件（默认留空）                   |
| createRectTween          | CreateRectTween?          | 自定义飞行路径的 RectTween（控制位移和尺寸的插值曲线）       |
| transitionOnUserGestures | bool                      | 是否在用户手势触发的路由转场（如 iOS 侧滑返回）中也执行飞行动画 |

**四、优缺点与注意事项**

**优点：**

- 使用极其简单，只需在两个页面用相同 `tag` 包裹对应组件即可自动实现飞行动画
- 无需手动编写复杂的动画代码，框架自动处理位置、尺寸的过渡插值
- 支持自定义飞行路径和飞行中的组件外观，灵活度高

**缺点：**

- 仅适用于路由（Navigator）切换场景，同一页面内的动画无法使用
- 飞行过程中组件脱离原布局树进入 Overlay 层，可能导致某些依赖上下文的功能异常

**注意事项：**

- **tag 必须唯一且配对**：同一页面内不能存在两个相同 tag 的 Hero，否则会抛异常；起始页和目标页的 tag 必须完全相等（用 `==` 比较）才能触发飞行
- **列表场景中 tag 要动态化**：在列表中使用时，tag 应包含唯一标识（如 `'hero-item-$id'`），避免多个 Hero 使用同一 tag 冲突
- **child 类型变化时需注意**：如果起始页和目标页的 child 类型或结构差异较大（如 Image → Text），默认飞行效果可能不理想，应通过 `flightShuttleBuilder` 自定义飞行中的组件
- **必须配合路由转场使用**：Hero 动画只在 `Navigator.push` / `Navigator.pop` 等路由切换时触发，使用 `PageRouteBuilder` 等无转场动画的路由时需确保 `transitionDuration` 不为零
- **Material 组件的溢出问题**：Hero 飞行时子组件脱离原父容器，可能出现溢出警告；常见做法是用 `Material(type: MaterialType.transparency)` 包裹 child
- **iOS 侧滑返回默认不触发**：`transitionOnUserGestures` 默认为 false，若需要在 iOS 边缘侧滑返回时也执行 Hero 动画，需设为 true
- **避免在 Hero child 中使用全局 Key**：飞行过程中组件会在 Overlay 中重建，使用 GlobalKey 可能导致 key 冲突报错
- **与 Dialog / BottomSheet 不兼容**：Hero 依赖路由级别的转场，`showDialog` / `showModalBottomSheet` 等不会触发 Hero 动画



## 53. AlertDialog

**一、一句话说明**

`AlertDialog` 是 Flutter 中用于向用户展示紧急信息、确认操作或收集简单输入的模态弹窗组件。

**二、应用场景**

- 删除、退出等危险操作的二次确认弹窗
- 展示错误提示、警告或通知信息
- 简单的用户输入收集（如重命名、输入密码）
- 提供多选项让用户做出选择
- 展示协议条款并要求用户同意或拒绝

**三、核心属性**

| 属性名                       | 类型                  | 说明                                |
| ---------------------------- | --------------------- | ----------------------------------- |
| title                        | Widget?               | 弹窗标题，通常为 Text               |
| titlePadding                 | EdgeInsetsGeometry?   | 标题区域的内边距                    |
| titleTextStyle               | TextStyle?            | 标题文本样式                        |
| content                      | Widget?               | 弹窗主体内容区域                    |
| contentPadding               | EdgeInsetsGeometry?   | 内容区域的内边距                    |
| contentTextStyle             | TextStyle?            | 内容文本样式                        |
| actions                      | List<Widget>?         | 底部操作按钮列表，通常为 TextButton |
| actionsPadding               | EdgeInsetsGeometry?   | 操作按钮区域的内边距                |
| actionsAlignment             | MainAxisAlignment?    | 操作按钮的水平对齐方式              |
| actionsOverflowDirection     | VerticalDirection?    | 按钮溢出时的排列方向                |
| actionsOverflowButtonSpacing | double?               | 按钮溢出换行时的间距                |
| actionsOverflowAlignment     | OverflowBarAlignment? | 按钮溢出时的对齐方式                |
| icon                         | Widget?               | 标题上方的图标                      |
| iconPadding                  | EdgeInsetsGeometry?   | 图标区域的内边距                    |
| iconColor                    | Color?                | 图标颜色                            |
| backgroundColor              | Color?                | 弹窗背景色                          |
| elevation                    | double?               | 阴影高度                            |
| shadowColor                  | Color?                | 阴影颜色                            |
| surfaceTintColor             | Color?                | Material 3 表面着色颜色             |
| shape                        | ShapeBorder?          | 弹窗外形（圆角等）                  |
| alignment                    | AlignmentGeometry?    | 弹窗在屏幕中的对齐位置              |
| insetPadding                 | EdgeInsets?           | 弹窗与屏幕边缘的最小间距            |
| clipBehavior                 | Clip                  | 内容裁剪行为                        |
| scrollable                   | bool                  | 内容是否可滚动（默认 false）        |

**四、优缺点与注意事项**

**优点：**

- API 简洁直观，快速搭建标准弹窗
- 自动适配 Material Design 规范和主题
- 支持 Material 3 的 icon 属性，视觉层次更丰富

**缺点：**

- 布局结构固定（icon → title → content → actions），复杂自定义弹窗不够灵活，此时应使用 `Dialog` 或 `SimpleDialog`
- content 区域默认不可滚动，内容过长会溢出

**注意事项：**

- `AlertDialog` 本身只是一个 Widget，必须通过 `showDialog()` 函数弹出
- 关闭弹窗需调用 `Navigator.of(context).pop()`，可传值作为 `showDialog` 的返回结果
- `scrollable: true` 官方标注为不推荐使用，建议自行在 content 中嵌套 `SingleChildScrollView`
- content 中放置 `ListView` / `Column` 等无界组件时，需用 `SizedBox` 约束尺寸，否则会报布局错误
- `actions` 中按钮过多时会自动换行（基于 `OverflowBar`），注意测试小屏设备的显示效果
- `barrierDismissible` 是 `showDialog` 的参数而非 AlertDialog 的属性，控制点击遮罩是否关闭



## 54. SnackBar

**一、一句话说明**

`SnackBar` 是 Flutter 中从屏幕底部短暂弹出的轻量级提示条，用于向用户反馈操作结果或提供简单的撤销操作入口。

**二、应用场景**

- 操作成功/失败后的即时反馈（如"已保存"、"发送失败"）
- 提供撤销入口（如删除邮件后显示"已删除，撤销"）
- 网络状态变化提示（如"网络已断开"）
- 表单提交后的结果通知
- 后台任务完成通知（如文件下载完成）

**三、核心属性**

| 属性名                  | 类型                | 说明                                       |
| ----------------------- | ------------------- | ------------------------------------------ |
| content                 | Widget              | **必填**，SnackBar 的主体内容，通常为 Text |
| action                  | SnackBarAction?     | 右侧操作按钮（如"撤销"），只能设一个       |
| duration                | Duration            | 自动消失的持续时间                         |
| backgroundColor         | Color?              | 背景颜色                                   |
| elevation               | double?             | 阴影高度                                   |
| shape                   | ShapeBorder?        | 外形（圆角等）                             |
| behavior                | SnackBarBehavior?   | 显示行为：fixed（贴底）或 floating（悬浮） |
| margin                  | EdgeInsetsGeometry? | 外边距，仅 behavior 为 floating 时有效     |
| padding                 | EdgeInsetsGeometry? | 内容区域的内边距                           |
| width                   | double?             | 固定宽度，仅 behavior 为 floating 时有效   |
| dismissDirection        | DismissDirection?   | 滑动关闭的方向                             |
| onVisible               | VoidCallback?       | SnackBar 可见时的回调                      |
| showCloseIcon           | bool?               | 是否显示右侧关闭图标                       |
| closeIconColor          | Color?              | 关闭图标的颜色                             |
| actionOverflowThreshold | double?             | action 按钮换行的阈值比例                  |
| animation               | Animation<double>?  | 自定义出入动画                             |
| clipBehavior            | Clip                | 内容裁剪行为                               |
| hitTestBehavior         | HitTestBehavior?    | 点击事件的命中测试行为                     |

**四、优缺点与注意事项**

**优点：**

- 非侵入式提示，不阻断用户操作流
- 自动消失，无需用户手动关闭
- 支持 action 按钮，可实现撤销等交互
- floating 模式下可自由控制位置和圆角，视觉更现代

**缺点：**

- 只能附着在 `Scaffold` 上，脱离 Scaffold 无法使用
- 同时只能显示一个，多个 SnackBar 会排队依次展示
- 不适合展示需要用户必须确认的重要信息

**注意事项：**

- SnackBar 不能直接使用，必须通过 `ScaffoldMessenger.of(context).showSnackBar()` 调用
- **不要**再使用已过时的 `Scaffold.of(context).showSnackBar()`，应使用 `ScaffoldMessenger`
- 调用时的 `context` 必须是 `Scaffold` 的子级 context，否则找不到 `ScaffoldMessenger` 会报错
- 设置 `margin` 或 `width` 时必须将 `behavior` 设为 `SnackBarBehavior.floating`，否则会抛异常
- 页面跳转后 SnackBar 默认仍会显示；若需跳转时清除，可调用 `ScaffoldMessenger.of(context).clearSnackBars()`
- `duration` 设置过短时用户可能来不及点击 action，需合理设置时长
- 与底部 `FloatingActionButton` 或 `BottomNavigationBar` 共存时，fixed 模式可能出现遮挡，建议使用 floating 模式





## 55. ColoredBox

**一、一句话说明**

`ColoredBox` 是 Flutter 中一个极其轻量的单一用途组件，专门用于给子组件绑定一个纯色背景。

**二、应用场景**

- 仅需纯色背景、不需要圆角/阴影/边框等装饰时替代 `Container` 或 `DecoratedBox`
- 作为页面或区域的纯色底色层
- 在性能敏感场景（如长列表项）中以最小开销添加背景色

**三、核心属性**

| 属性名 | 类型    | 说明                   |
| ------ | ------- | ---------------------- |
| color  | Color   | **必填**，背景填充颜色 |
| child  | Widget? | 子组件                 |

**四、优缺点与注意事项**

**优点：**

- 极致轻量，是 Flutter 中给组件加背景色开销最小的方式
- 语义明确，代码可读性高，一眼看出意图
- `Container` 在仅设置 `color` 时，内部实际就是创建了一个 `ColoredBox`

**缺点：**

- 功能单一，不支持圆角、边框、渐变、阴影、形状等任何装饰效果
- 不提供 padding、margin、尺寸约束等布局能力

**注意事项：**

- 如果只需要纯色背景，优先使用 `ColoredBox` 而非 `Container(color: ...)`，避免 `Container` 的额外开销和歧义
- 需要圆角或渐变背景时应改用 `DecoratedBox` 或 `Container(decoration: ...)`
- `ColoredBox` 本身不影响布局尺寸，大小完全由子组件或父级约束决定；无 child 且无约束时会尽可能大























