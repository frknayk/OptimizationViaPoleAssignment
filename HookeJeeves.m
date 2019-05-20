function [xvar,Costvalue,iteration,stepsize] = HookeJeeves(initial, step, stopsize,Cost)
global Kc Ki Kd
n=length(initial); % Initial variable=Function parameters
if ~((n==length(step))&&(n==length(stopsize)))
    warning(' Describe step & stop size for each parameter');
end

failure=0;
k=1
iteration(k)=k;
stepsize(k,:)=step;
xvar(k,:)=initial;
Costvalue(k)=feval(Cost,xvar(k,1), xvar(k,2));

while (stepsize(end,:)>stopsize)

    [xvar(k+1,:),Costvalue(k+1),failure] = feval('ExploratoryMove',xvar(k,:),stepsize(end,:),Costvalue(k),Cost);
    if(failure==0)
        [xvarpattern,Costpattern] = feval('PatternMove',xvar,Cost);
        [xvarexp(k,:),Costexp(k,:),failure] = feval('ExploratoryMove',xvarpattern,stepsize(end,:),Costpattern,Cost);
        
        while (Costexp(k)<Costvalue(k+1))
            k=k+1
            iteration(k)=k;
            xvar(k+1,:)=xvarexp(k-1,:);
            Costvalue(k+1)=Costexp(k-1);
            [xvarpattern,Costpattern] = feval('PatternMove',xvar,Cost);
            [xvarexp(k,:),Costexp(k,:),failure] = feval('ExploratoryMove',xvarpattern,stepsize(end,:),Costpattern,Cost);
        end
    else
        stepsize(k,:)=stepsize(end,:)/2;
        failure=0;
    end
    k=k+1
    iteration(k)=k;
end
  
end