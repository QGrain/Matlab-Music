# Matlab音乐播放器API文档

[TOC]

## 文件关系

- 功能函数`FunctionName.m`，按照功能命名

- 待解析文件：

  - 音频文件`Music_Type.wav`，用于解析包络函数

  - 乐谱文件`Music_Book.txt`， 用于谱解析乐谱序列

- 主函数`MusicPlayer.m`，调用各个功能函数实现音乐播放

- **图形界面，to be complete！**

## 功能函数

### 乐谱解析

#### 统一标准

**定义音高频率标准**

| 八度名/音名 | 0    | 1    | 2    | 3    | 4      | 5    | 6    | 7    | 8    | 9    |
| ----------- | ---- | ---- | ---- | ---- | ------ | ---- | ---- | ---- | ---- | ---- |
| C           |      |      |      |      | 261.63 |      |      |      |      |      |
| C#/Db       |      |      |      |      |        |      |      |      |      |      |
| D           |      |      |      |      |        |      |      |      |      |      |
| D#/Eb       |      |      |      |      |        |      |      |      |      |      |
| E           |      |      |      |      |        |      |      |      |      |      |
| F           |      |      |      |      |        |      |      |      |      |      |
| F#/Gb       |      |      |      |      |        |      |      |      |      |      |
| G           |      |      |      |      |        |      |      |      |      |      |
| G#/Ab       |      |      |      |      |        |      |      |      |      |      |
| A           |      |      |      |      |        |      |      |      |      |      |
| A#/Bb       |      |      |      |      |        |      |      |      |      |      |
| B           |      |      |      |      |        |      |      |      |      |      |

**定义音符书写标准**

- 如`C#4_4`表示音名为**C**#、八度名为**4**的一个**四分音符**。
- `N___4`表示长度为一个**四分音符**的休止符。

**定义乐谱文本格式标准**

`Music_Book.txt`的文本格式为

```txt
120
4/4
C#4_2 Cb4_4 C-4_4 B-5_1
D#2_8 N___4
...
```

- 第一行定义**演奏速度**
- 第二行定义**几分音符为一拍，每小节几拍**
- 从第三行开始即为**乐谱正文**，以**空格**为音符书写的间隔，可以**任意换行**。

#### 函数接口

- 输入参数: `filename`，是乐谱文本`Music_Book.txt`的相对或绝对路径。
- 输出参数: `[basic_info book_single]`
  - `basic_info`是一个3x1的矩阵，对应文本第一、二行。
  - `book_single`是一个结构体数组，有两个成员:
    - key: 频率
    - time: 1表示全音符，2表示二分音符，依此类推。

```matlab
function [basic_info book_single] = parseBook(filename)
	#function done
end
```



## 高级接口

### 包络（音色）

### 音效

### 简谱解析

### 图形界面





## 核心函数

在以下这三个函数的帮助下, 我们可以搭建一套完整的能够产生各种乐器音效的生态系统.



### InstrumentPropertyScan (乐音特征提取)

这个函数为`beatGene`(单拍发生器)提供了`harm_coef` (谐波系数), `avg_envelope` (包络) 和 `one_sec_index` (包络一秒时间索引). 它接受一个音频文件名称为参数.

**参数**:

- `audio_filename`: 待处理音频文件名称

**返回值**:

- `harm_coef`: 谐波系数矩阵
- `avg_envelope`: 包络
- `one_sec_index`: 它的值事实上是和Matlab原生函数`audioread`的返回值`fs`完全相同.



### beatGene (单拍发生器)

产生一拍的音. 这个API的设计思路是基于"保证声音的连贯性"这一点的. 所以记住, 这个发生器可能产生时长超过一拍的采样向量.

**参数**:

- `avg_envelope`: 一个包络数列/向量
- `one_sec_index`: 指向包络的一秒位置的索引. 因为包络依赖于绝对时间而不是一拍时长, 所以这很重要.
- `harm_coef`: 谐波系数向量
- `key`: 这拍发声的基频频率. 当`key`是NULL时, 函数产生0数列以代表歌曲中的发声间断.
- `fs`: 采样率

**返回值**: 

- `beat_array`: 一个整首歌曲的音频采样向量. 它的长度依赖于采样率和包络向量长度.

**注意**: 包络向量所表达时长可能小于一秒. 所以 `one_sec_index`可能比`length(envelope)`大, 函数实现的时候需要考虑到这一点. (函数调用可忽略这句)



这个函数实现的主要责任是将包络向量适配到采样率, 并且合成一拍的指定参数的声音.

对于同样的`envelope` 和`one_sec_index`, 该函数应该产生相同长度的返回值.



### audioVectComp (音频采样向量混成)

这个混成器负责将声音发生器的返回值组合成一首完整的歌曲采样向量. 

**参数**:

- `arr_sounds`: 声音向量的数组
- `beat_array`: 一拍的采样向量
- `beat_time`:  这拍开始到下拍开始的之间的时间间隔.
- `fs`: 希望产生的音频的采样率
- `comp_mode`:  `'cut'`, `'mix'`或者`'add'`. 剪切模式会直接将超出一拍的采样减去, 这样相邻的两拍不会相互影响. 混合模式旨在让两拍之间的过渡更加自然. 叠加模式意味着两拍声音之间的直接叠加.
- `last_end_index`: 这是一个用于维持这个函数的不同次调用之间连贯性的参数. 它记录了下次连接的索引位置.

**返回值**: 

- `last_end_index`: 已经解释过了. 详情请查看`function_demos/test_audioVectComp.m`
- `song_array`: 合成后的音频采样序列.



### 音效处理

#### 圆润

#### 双声道

#### 风格变换

#### so on



## 主函数

### 全局变量

```matlab
global REF_NOTE		% Base key，'Middle C' for example
global SAMPLE_RATE	% Set sampling rate, '44100' for example
global SPEED		% Note number in one minute, '90' for example
global GAIN			% Gain for the volume, '2' for example
global STYLE		% Style, 'Heavy mental' for example

% More to be figured out...
```

**说明**：



## 图形界面

- 播放速度，增益，风格等选项

- 乐曲选择下拉栏
  - 左侧显示乐曲简介，包括曲名，歌手，作曲家以及**推荐speed**，**推荐style**
- 乐器选择下拉栏
  - 左侧显示乐器的图片
- To be complete
