A=[3 1 6 0 2;1 5 2 1 0; 0 2 5 1 1 ; 0 1 1 6 2 ; 2 0 1 2 -12];

%localizzazione autovalori
GershgorinFunction(A)
% ricerca dell'autovalore dominante in modulo tramite metodo delle potenze
[lambda,x,g] = MetodoPotenze(A);
lambda


function []=GershgorinFunction(A)
    f1=figure
    hold on
    f2=figure
    hold on
    RR=polyshape([0],[0])
    CC=polyshape([0],[0])
    
    t=linspace(0,2*pi,100);
    t=t(1:end-1);
    for i=1:size(A,1)
        r(i)=sum(abs(A(i,[1:i-1,i+1:end])));
        R(i)=polyshape(r(i)*cos(t)+A(i,i),r(i)*sin(t));
        figure(f1)
        hold on
        plot(R(i))
        text(A(i,i),0,strcat('R_',num2str(i)'));
        c(i)=sum(abs(A([1:i-1,i+1:end],i)));
        C(i)=polyshape(c(i)*cos(t)+A(i,i),c(i)*sin(t));
        figure(f2)
        hold on
        plot(C(i))
        text(A(i,i),0,strcat('C_',num2str(i)'));
        RR=union(RR,R(i));
        CC=union(CC,C(i));
    end
end


function [lambda,x,g] = MetodoPotenze(A)
    flag=true;
    k=1;
    g(1)=1;
    y=ones(size(A,1),1);
    m=1;
    while (flag)&(k<300)
        k=k+1;
        w=A*y;
        g(k)=w(m)/y(m);
        y=w/norm(w,Inf);
        [mm,m]=max(abs(w));
        flag=(abs(g(k)-g(k-1))/abs(g(k))>sqrt(eps));
    end
    lambda=g(k);
    x=y;
end