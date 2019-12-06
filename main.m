clear all
close all
N=128;
EsNo_dB=11;
InitialCovariance= [((pi^2)/3) 0; 0 0.054];
ObservationMatrix=[1 0];
R= 1/(2*10^(EsNo_dB/10));
TransitionMatrix=[1 1; 0 1];
PhaseError=0.15;
FreqError=0.2;
amerhis=load('amerhisData.mat');
amerhis=amerhis.y;

[Kph,Kf] = gen_kal_gain(R,InitialCovariance,TransitionMatrix,ObservationMatrix,N);

phase= PhaseWrapping(angle(amerhis),(pi/2));
x=phase;
fq_sim=FreqError*ones(1,N);
[ph_est, fq_est] = kalmanfilter(x, Kph, Kf);
T=exp(-1i*ph_est);
T=amerhis.*T;


figure(4)
plot(1:N,x,'b');
hold on
plot(1:N,ph_est,'r');

legend('Original Signal Phase ','Estimated Phase')
xlabel('n');
title('Kalman filter & Phase Estimation');

figure(5)
hold on
plot(1:N,fq_est,'r');
legend('Frequency Estimation')
xlabel('n');
title('Kalman filter & Frequency Estimation');

hold on
scatterplot(amerhis);
title('Original Constellation')

hold on
scatterplot(T);
title('Constellation after being processed by the Kalman Filter');




