# Matlab Music Player APIs

## Core Functions

With the help of these three functions below, we can build a complete ecosystem of generating music featuring all kinds of instruments.



### InstrumentPropertyScan

This function provides the `harm_coef`, `avg_envelope` and `one_sec_index` for `beatGene`. It takes a audio filename as parameter.

**Parameters**

- `audio_filename`: The filename of audio file to be processed.

**Returns**

- `harm_coef` : Both two are explained above.
- `avg_envelope`
- `one_sec_index`: It is actually same value as `fs` returned by `audioread`.



### beatGene

Create each beat of the song. This API is designed with consideration of sound's coherence. So remember that the generator can create sound array whose duration is longer than a beat. 

**Parameters**:

- `avg_envelope`: An envelope array.
- `one_sec_index`: The index pointing at the envelop's one second point. Because the envelope relies on the absolute time, not on the beat time so this is important.
- `harm_coef`: Harmonic coefficient array.
- `key`: Frequency of this beat of sound. Function returns zeros when key `NULL`, which help express the short pause in the song.
- `fs`: Sampling frequency.

**Returns**: 

- `beat_array`: A array containing the samples of a sound. Its length is dependent on the sampling rate and length of envelope vector.

**Note**: The envelope array might represent time less than a sec. So `one_sec_index` might be greater than `length(envelope)`.

The implement of the function's main responsibility is to adapt the envelope array to the sample rate and synthesize a beat of sound.

For the same `envelope` and `one_sec_index`, the `beatGene` 's return should be the same size.



### audioVectComp

This compositor is responsible for mixing the array of sounds (the return array of the beatGene) into a song vector.

**Parameters**:

- `song_array`: The composited audio samples array.

- `beat_array`: The array of one beat.
- `beat_time`: How long a period of time this beat takes before next beat sound.
- `fs`: The targeting sampling frequency.
- `comp_mode`: `'cut'` , `'mix'` or `add`. CUT mode cuts out the samples beyond the range of one beat so that there won't be interaction between two consecutive beats. MIX aims at a more natural transition between 2 beats. ADD means direct adding operation.
- `last_end_index`: It's a variable maintaining the continuity between different calls of this function, which helps figure out from where the concatenation starts.

**Returns**: 

- `last_end_index`: Explained already.
- `song_array`: The composited audio samples array. 



