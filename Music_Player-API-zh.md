# Matlab音乐播放器API文档

## 文件关系

- 功能函数`FunctionName.m`，按照功能命名

- 待解析文件：

  - 音频文件`Music_Type.wav`，用于解析包络函数

  - 乐谱文件`Music_Book.txt`， 用于谱解析乐谱序列

- 主函数`MusicPlayer.m`，调用各个功能函数实现音乐播放

- **图形界面，to be complete！**

## 功能函数

### 单音产生

**参数**

- note_key: 音调等级，取相对于`middle C`的半音数
- scale_time: 音符时长级别，取值为1,2,4,8...分别对应全音符，半分，四分，八分等音符
- Fs: 采样率，`SAMPLE_RATE` for default

```matlab
% .
function single_note = singleGene(note_key, time_scale, Fs)
	note_time = 1/(SPPED*time_scale);
	% to be complete
end
	
```

**返回值**：single_note, 



### 音轨合成

**参数**:

**返回值**:



### 播放



### 包络解析



```matlab
% 各种乐器声音采集
sound_file_name = 'piano.wav'; % or 'piano.mp3', 'piano.mp4' and so forth
[sound_y, sound_Fs] = audioread(sound_file_name);

% 快速傅里叶变换fft
n1 = Fs; % for 1 second
sound_yy = sound_y(1:n1);
freq = fft(sound_yy);

% to be complete
```



### 乐谱解析



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


%More to be figured out...
```

**说明**：

- GUI中设置`play speed`选项，与SPEED对应

