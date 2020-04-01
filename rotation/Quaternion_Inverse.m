% quaternion inverse defined in ACS P17
% find the inverse of q=[q0;q1;q2;q3]=[q(1);q(2);q(3);q(4)]
function invq = Quaternion_Inverse(q)
normq = q(1)^2+q(2)^2+q(3)^2+q(4)^2;   % the norm of quaternion
% the norm of quaternion is sqrt(sum(qi^2)), as defined in wiki.
% invq = [q(1);-q(2);-q(3);-q(4)]./sqrt(normq);
  invq = [q(1);-q(2);-q(3);-q(4)]./normq; % the both are the same for unit quaternion
