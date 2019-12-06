
function [Kph , Kf]=gen_kal_gain(R,InitialCovariance,TransitionMatrix,ObservationMatrix,N)

I=[1 0;0 1];

error=(TransitionMatrix*InitialCovariance)*TransitionMatrix.';
kalgain=(error*ObservationMatrix.')/(R+ObservationMatrix*error*ObservationMatrix.');
CovarianceMatrix=(I-kalgain*ObservationMatrix)*error;
Kph(1)=kalgain(1,:,1);
Kf(1)=kalgain(2,:,1);

for k=2:N
    error(:,:,k)=TransitionMatrix*CovarianceMatrix(:,:,k-1)*TransitionMatrix.';
    kalgain(:,:,k)=error(:,:,k)*ObservationMatrix.'/(R+ObservationMatrix*error(:,:,k)*ObservationMatrix.');
    CovarianceMatrix(:,:,k)=(I-kalgain(:,:,k)*ObservationMatrix)*error(:,:,k);
    Kph(k)=kalgain(1,:,k);
    Kf(k)=kalgain(2,:,k);
end
end

    
    