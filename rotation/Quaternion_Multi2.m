% this program shows the multiplication of two quaternions

% note that the multiplication of the quaternions is NOT commutative
% here quatMulti(p,q)=p*q !=q*p
% the calculation is using the matrix form in page 16 the first equation
% also, teh quaternion p=[p0;p1;p2;p3]=[p(1);p(2);p(3);p(4)]


% q0 is in front! some people use q = [q1;q2;q3;q0], that I don't like at all!

function multiq = Quaternion_Multi2(p,q)
         pM = [ p(1) -p(2) -p(3) -p(4);
                p(2)  p(1) -p(4)  p(3);
                p(3)  p(4)  p(1) -p(2);
                p(4) -p(3)  p(2)  p(1)];
         qV = [ q(1); q(2); q(3); q(4)];
    multiq  = pM * qV;
    
%% a test program
% q1=[1;2;3;4];q2=[5;6;7;8];
% % multiplication in the usual way
% r1=quatMulti2(q1,q2)
% % multiplication with some equation, term by term in the form of vector
% q1v=[q1(2);q1(3);q1(4)];
% q2v=[q2(2);q2(3);q2(4)];
% r21=q1(1)*q2(1)-q1v'*q2v;
% r2v=q1(1)*q2v+q2(1)*q1v+cross(q1v,q2v);
% r2=[r21;r2v]
