function LorenzCD(sigma, t0, x0, y0, max_grid)
    % Solucion de constantes c1 y c2 de solucion general 
    syms C1 C2
    eq1 = C1-sigma*C2*exp((-sigma-1).*t0)==x0;
    eq2 = C1+C2*exp((-sigma-1).*t0)==y0;
    eq=[eq1, eq2];
    var=[C1 C2];
    s = solve(eq, var);
    c1 = s.C1;
    c2 = s.C2;

    t=linspace(0,max_grid);
    x2=c1 - sigma*c2*exp((-sigma-1).*t);
    y2=c1 + c2*exp((-sigma-1).*t);

    figure, subplot(2,2,1);
    plot(x2,y2)
    title("Orbita")
    grid on

    subplot(2,2,2);
    plot(t,x2);
    hold on
    plot(t,y2)
    hold off
    legend("x(t)", "y(t)")
    xlabel("t")
    ylabel("x(t), y(t)")
    title("Solucion")
    grid on

    % Campo de direcciones
    [x,y] = meshgrid(-max_grid:0.5:max_grid,-max_grid:0.5:max_grid);
    A = [-sigma sigma; 1 -1];
    u = A(1,1).*x + A(1,2).*y;
    v = A(2,1).*x + A(2,2).*y;
    
    subplot(2,2,3);
    q = quiver(x,y,u,v,'linewidth',2);
    q.Color = 'red';
    q.MaxHeadSize = 0.8;
    xlabel('x(t)'), ylabel('y(t)')
    title("Campo de direcciones")
    grid on
end