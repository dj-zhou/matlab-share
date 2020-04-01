function mat = Quaternion_OP_plus(q)
q0 = q(1);
v = [q(2);q(3);q(4)];
mat = [ q0, -v.';
        v , q0*diag([1,1,1]) + Skew_3D(v)];