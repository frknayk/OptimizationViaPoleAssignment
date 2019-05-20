function [p,Costvalue] = PatternMove(xvar,Cost)

p=2*xvar(end,:)-xvar(end-1,:);
Costvalue=feval(Cost,p(1), p(2));

end

