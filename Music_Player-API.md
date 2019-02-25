# Matlab Music Palyer APIs

## Core Functions

With the help of these three functions below, we can build a complete ecosystem of generating music featuring all kinds of instruments.

### InstrumentPropertyScan

This function provides the `harm_coef`, `envelope` and `one_sec_index` for beatGene. It takes a audio filename as parameter.

**Parameters**

- audio_filename: The filename of audio file to be processed.

**Returns**

- harm_coef
- envelope
- one_sec_index: It is actually same value as `fs` returned by `audioread`.


### beatGene

Create each beat of the sound. This API is designed with consideration of sound's coherence. So remember that the generator can create sound array whose duration is longer than a beat. 

**Parameters**:

- envelope: An envelope array.
- one_sec_index: The index pointing at the envelop's one second point. Because the envelope relies on the absolute time, not on the beat time so this is important.
- harm_coef: Harmonic coefficient array.
- key: Frequency of this beat of sound. Function returns zeros when key `NULL`, which help express the short pause in the song.
- fs: Sampling frequency.



**Returns**: A array containing the samples of a sound. It's length is dependent on the sampling rate and length of envelope vector.

**Note**: The envelope array might represent time less than a sec. So `one_sec_index` might be greater than `length(envelope)`.



The implement of the function's main responsibility is to adapt the envelope array to the sample rate and synthesize a beat of sound.

For the same `envelope` and `one_sec_index`, the `beatGene` 's return should be the same size.



### audioVectComp

This compositor is responsible for mixing the array of sounds (the return array of the beatGene) into a song vector.

**Parameters**:

- arr_sounds: The array of sounds
- beat_time: How long a period of time one beat takes.
- comp_mode: `'cut'` , `'mix'` or `add`. Cut mode cuts out the samples beyond the range of one beat so that there won't be interaction between two consecutive beats. Mix aims at a more natural transition between 2 beats. Add means direct adding operation.

**Returns**: A array of the song samples.
