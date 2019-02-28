Matlab音乐播放器API文档
## 基本接口
### 音调

```matlab
global reference_note = 261.6 % base kit for Middle C
```



### 节拍

```matlab
global sampling_rate = 40000 % According to Sampling Theorem, set rate with 2*20k
```



### 波形

### 播放
### 增益

## 高级接口

### 包络（音色）

### 音效

### 简谱解析

### 图形界面







## 核心函数

在以下这三个函数的帮助下, 我们可以搭建一套完整的能够产生各种乐器音效的生态系统.



### InstrumentPropertyScan (乐器特征扫描器)

这个函数为"单拍发生器"提供了`harm_coef` (谐波系数), `envelope` (包络) 和 `one_sec_index` (包络一秒时间索引). 它接受一个音频文件名称为参数.

**参数**:

- `audio_filename`: 待处理音频文件名称

**返回值**:

- `harm_coef`: 谐波系数矩阵
- `envelope`: 包络
- `one_sec_index`: 它的值事实上是和Matlab原生函数`audioread`的返回值`fs`完全相同.



### beatGene (单拍发生器)

产生一拍的音. 这个API的设计思路是基于"保证声音的连贯性"这一点的. 所以记住, 这个发生器可能产生时长超过一拍的采样向量.

**参数**:

- `envelope`: 一个包络数列/向量
- `one_sec_index`: 指向包络的一秒位置的索引. 因为包络依赖于绝对时间而不是一拍时长, 所以这很重要.
- `harm_coef`: 谐波系数向量
- `key`: 这拍发声的基频频率. 当`key`是NULL时, 函数产生0数列以代表歌曲中的发声间断.
- `fs`: 采样率

**返回值**: 一个整首歌曲的音频采样向量. 它的长度依赖于采样率和包络向量长度.

**注意**: 包络向量所表达时长可能小于一秒. 所以 `one_sec_index`可能比`length(envelope)`大, 函数设计的时候需要考虑到这一点.



这个函数实现的主要责任是将包络向量适配到采样率, 并且合成一拍的指定参数的声音.

对于同样的`envelope` 和`one_sec_index`, 该函数应该产生相同长度的返回值.



### audioVectComp (音频采样向量混成器)

这个混成器负责将声音发生器的返回值组合成一首完整的歌曲采样向量. 

**参数**:

- `arr_sounds`: 声音向量的数组
- `beat_time`: 一拍所花费的时间.
- `comp_mode`:  `'cut'`, `'mix'`或者`'add'`. 剪切模式会直接将超出一拍的采样减去, 这样相邻的两拍不会相互影响. 混合模式旨在让两拍之间的过渡更加自然. 叠加模式意味着两拍声音之间的直接叠加.
- `last_end_index`: 这是一个用于维持这个函数的不同次调用之间连贯性的参数. 它记录了下次连接的索引位置.

**返回值**: 

- `last_end_index`: 已经解释过了.
- `song_array`: 合成后的音频采样序列.

