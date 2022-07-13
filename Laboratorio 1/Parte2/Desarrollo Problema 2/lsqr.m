function [x0, error, costoLSQR] = lsqr(A,b,tol) 
    costoLSQR = 0;
    n=length(A);
    x0=zeros(n,1);
    %Paso 1: Inicializar (Resolver sistema Ax = b)
    beta=norm(b);
    u= b/beta;
    alpha = norm(A'*u);
    v=(A'*u)/alpha;
    errores = [];
    %Asignar w1=v1
    w=v;
    fi=beta;
    p=alpha;
    x1=x0;  
    costoLSQR = costoLSQR + 4*n;
    %costoLSQR= n+(n-1)*n+(n-1)*n^2;
    error = 1;
    while error > tol
        x1=x0;
        %Paso 2: Bidiagonalización 
        beta=norm(A*v-alpha*u);
        %a)
        u=(A*v-alpha*u)/beta;
        %b)
        alpha=norm(A'*u-beta*v);
        v=(A'*u-beta*v)/alpha;
        %Paso 3: Construir y aplicar la siguiente transformación
        %ortogonal
        pj=sqrt(p^2+beta^2);
        sj = beta/pj;
        cj = p/pj;
        o= sj*alpha;
        p=-cj*alpha;
        fi2=cj*fi;
        fi = sj*fi;
        x0= x0+(fi2/pj)*w;
        w= v-(o/pj)*w;
        error = norm(x0-x1);
        errores = [errores, error];   
        costoLSQR = costoLSQR + 30*n;
        %costoLSQR = costoLSQR+4*((n-1)*n*2+n )+ 11*n + 2*(n^2+n);
    end
    x0 = x0(:,1);
end