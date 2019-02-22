# Matlab Music Palyer APIs

## soundGene

 Create each beat of the sound.

**Parameters**:

- envelope: An envelope array.
- one_sec_index: The index pointing at the envelop's one second point.
- harm_coef: Harmonic coefficient array.
- key: Frequency of this sound.
- fs: Sampling frequency.



Note that the generator can create sound array whose duration is longer than a beat.



**Return**: A array containing the sample of a sound. It's length is dependent on the sampling rate.



## audioVectComp

