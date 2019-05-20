function [CostValue] = cost(x1, x2)
global Kp Ki G s
    Kp = x1;
    Ki = x2;
    sim('pi_hooke');

%% J3 Part
% Integral Time Square Error
    CostValue=ans.J3(end,:);

end


