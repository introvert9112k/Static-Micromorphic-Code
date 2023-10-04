
function X=square_node_array(pt1,pt2,pt3,pt4,numnod_u,numnod_v,uratio,vratio)
    if ( nargin < 6 )
        disp('Not enough parameters specified for square_node_array function') 
    elseif ( nargin == 6 )
        uratio=1;
        vratio=1;
    elseif ( nargin == 7 )
        vratio=1;
    end

    % get node spacing along u direction
    if ( uratio == 1 )
        xi_pts=linspace(-1,1,numnod_u);
    elseif ( uratio > 0 )
        ru=uratio^(1/(numnod_u-2));
        xi_pts(1)=0;
        d=1;
        for i=2:numnod_u
            xi_pts(i)=xi_pts(i-1)+d;
            d=d/ru;
        end
        xi_pts=2*xi_pts/xi_pts(numnod_u)-1;
    else
        disp('uratio must be greator than 0');
        xi_pts=linspace(-1,1,numnod_u);
    end

    % get node spacing along v direction
    if ( vratio == 1 )
        eta_pts=linspace(-1,1,numnod_v);
    elseif ( vratio > 0 )
        rv=vratio^(1/(numnod_v-2));
        eta_pts(1)=0;
        d=1;
        for i=2:numnod_v
            eta_pts(i)=eta_pts(i-1)+d;
            d=d/rv;
        end
        eta_pts=2*eta_pts/eta_pts(numnod_v)-1;
    else
        disp('vratio must be greator than 0');
        eta_pts=linspace(-1,1,numnod_v);
    end

    x_pts=[pt1(1),pt2(1),pt3(1),pt4(1)];
    y_pts=[pt1(2),pt2(2),pt3(2),pt4(2)];

    for r=1:numnod_v
        eta=eta_pts(r);
        for c=1:numnod_u
            xi=xi_pts(c);
            % get interpolation basis at xi, eta
            N=lagrange_basis('Q4',[xi,eta]);
            N=N(:,1);
            X((r-1)*numnod_u+c,:)=[x_pts*N,y_pts*N];
        end

    end

end % End of Square Node Array
