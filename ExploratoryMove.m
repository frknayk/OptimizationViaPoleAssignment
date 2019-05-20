function [nextvar,nextCostvalue,failure] = ExploratoryMove(xvar,stepsize,Costvalue,Cost)
failure=0;
plus1=feval(Cost,(xvar(1)+stepsize(1)),xvar(2));
minus1=feval(Cost,(xvar(1)-stepsize(1)),xvar(2));

if (plus1<minus1)&&(plus1<Costvalue)
    plus2=feval(Cost,(xvar(1)+stepsize(1)),(xvar(2)+stepsize(2)));
    minus2=feval(Cost,(xvar(1)+stepsize(1)),(xvar(2)-stepsize(2)));

    if(plus1<=plus2)&&(plus1<=minus2)
        nextvar(1)=xvar(1)+stepsize(1);
        nextvar(2)=xvar(2);
        nextCostvalue=plus1;
    elseif (plus2<minus2)&&(plus2<Costvalue)
        nextvar(1)=xvar(1)+stepsize(1);
        nextvar(2)=xvar(2)+stepsize(2);
        nextCostvalue=plus2;
    elseif (plus2>minus2)&&(minus2<Costvalue)
        nextvar(1)=xvar(1)+stepsize(1);
        nextvar(2)=xvar(2)-stepsize(2);
        nextCostvalue=minus2;
    end

elseif  (plus1>minus1)&&(minus1<Costvalue)
    plus2=feval(Cost,(xvar(1)-stepsize(1)),(xvar(2)+stepsize(2)));
    minus2=feval(Cost,(xvar(1)-stepsize(1)),(xvar(2)-stepsize(2)));
    
    if (minus1<=plus2)&&(minus1<=minus2)
        nextvar(1)=xvar(1)-stepsize(1);
        nextvar(2)=xvar(2);
        nextCostvalue=minus1;
    elseif (plus2<minus2)&&(plus2<Costvalue)
        nextvar(1)=xvar(1)-stepsize(1);
        nextvar(2)=xvar(2)+stepsize(2);
        nextCostvalue=plus2;
    elseif (plus2>minus2)&&(minus2<Costvalue)
        nextvar(1)=xvar(1)-stepsize(1);
        nextvar(2)=xvar(2)-stepsize(2);
        nextCostvalue=minus2;
    end
else
    nextvar=xvar;
    nextCostvalue=Costvalue;
    failure=1;
end

end

