# Matlab Music Palyer APIs

## soundGene

Create each beat of the sound. This API is designed with consideration of sound's coherence. So remember that the generator can create sound array whose duration is longer than a beat. 

**Parameters**:

- envelope: An envelope array.
- one_sec_index: The index pointing at the envelop's one second point. Because the envelope relies on the absolute time, not on the beat time so this is important.
- harm_coef: Harmonic coefficient array.
- key: Frequency of this s,ound. Function returns zeros when key `NULL`.
- fs: Sampling frequency.



**Return**: A array containing the samples of a sound. It's length is dependent on the sampling rate.



The implement of the function's main responsibility is to adapt the envelope array to the sample rate.

For the same `envelope` and `one_sec_index`, the `soundGene` 's return should be the same size.



## audioVectComp

This compositor is responsible for mixing the array of sounds (the return array of the soundGene) into a song vector.

**Parameters**:

- arr_sounds: The array of sounds
- beat_time: How long a period of time one beat takes.
- cut_mode: `'cut'` , `'mix'` and `add`. Cut mode cuts out the samples beyond the range of one beat. Mix aims at a more natural transition between 2 beats. Add means direct adding operation.

**Return**: A array of the song samples.
