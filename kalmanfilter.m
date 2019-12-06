function [ph_est, fq_est, MeasuredPred] = kalmanfilter(x, Kph, Kf)
N=length(x);
TransitionMatrix=[1 1; 0 1];
ObservationMatrix=[1; 0];
FirstPrediction=[0 ; 0];
k = [Kph ; Kf];

StateProp(:,1)=FirstPrediction;
StateProp(:,1)=TransitionMatrix*StateProp(:,1);
MeasuredPred(1)=ObservationMatrix.'*StateProp(:,1);
MeasuredPred(1)=PhaseWrapping(MeasuredPred(1),pi/2);
error(1)=x(1)-MeasuredPred(1);
error(1)=PhaseWrapping(error(1),pi/2);
StateProp(:,2)=StateProp(:,1)+k(:,1)*error(1);
StateProp(1,2)=PhaseWrapping(StateProp(1,2),pi/2);
for i=2:N
StateProp(:,i)=TransitionMatrix*StateProp(:,i);
MeasuredPred(i)=ObservationMatrix.'*StateProp(:,i);
MeasuredPred(i)=PhaseWrapping(MeasuredPred(i),pi/2);
error(i)=x(i)-MeasuredPred(i);
error(i)=PhaseWrapping(error(i),pi/2);
StateProp(:,i+1)=StateProp(:,i)+k(:,i)*error(i);
StateProp(1,i+1)=PhaseWrapping(StateProp(1,i+1),pi/2);

ph_est(i)=PhaseWrapping(StateProp(1,i),pi/2);
fq_est(i)=StateProp(2,i);

end

end