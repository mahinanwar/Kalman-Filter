function ph = PhaseWrapping(ph,P)
y=subs(exp(1i*ph));
for k=1:length(ph)
    if (abs(angle(y(k))))>=P 
    ph (k) = angle(y(k)) - sign(angle(y(k)))*2*P;
    else  ph(k)=angle(y(k));
    end
end
end
