# Kalman-Filter
In Statistics and Control Theory, Kalman Filtering is an algorithm that uses a series of measurements observed over time, containing statistical noise and other inaccuracies, and produces estimates of unknown variables that tend to be more accurate than those based in a single measurement alone, by estimating a joint probability distribution over the variables for each timeframe.

## Objective
The objective of this project is to address the problem if carrier synchronization in on-board processing (OBP) satellite digital receivers. Carrier Synchronization is the problem of resolving the undesired phase in the baseband, so that the in-phase and quadrature components can be properly recovered. Through the Kalman Filter, both the carrier phase and carrier frequency can be jointly estimated.


## Project Description
This project was designed and implemented on MATLAB and it follows a certain set of instructions and predetermined conditions. The firt step in the designing of this filter is to calculate the Kalman Gains. Once the Kalman Gains have been calculated, the next step is to model the filter based on the State Propagation, Measurement Prediction and State Correction Equations. A test signal is then fed to the filter to observe its response. Once that has been done, a  BPSK(Binary Phase Shift Keyed) signal corrupted with noise (named 'AmerhisData') is then passed through the filter and its response observed.

## File Description
The following project contains 5 files (4 '.m' files and 1 dataset). The tasks performed by these files are mentioned below:

1- AmerhisData: This is the corrupted BPSK signal with noise.

2- Main.m: This is the root file where all the functions are called.

3- gen_kal_gain.m: This is the file which contains all the procedure to calculate the Kalman Gains.

4- Kalman Filter.m: This is the file which contains all the modelling equations required to implement the Kalman Filter.

5- PhaseWrapping.m: This is the file which contains the methodology to wrap all the phases according to the requirements. 




