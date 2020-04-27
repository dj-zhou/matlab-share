
% mml book equation (6.37), on page 190
% Cov[x,y] = E(xy^T] - E[x]E[y]^T

% there is not transpose because the data is a univariate random variable
% the "len" is just the count of dataset collected

function covariance = Covariance_Univariate(data1, data2)

len = min(length(data1),length(data2));

expect_prod = 0;
expect1     = 0;
expect2     = 0;

for i = 1 : len
    expect_prod = expect_prod + data1(i) * data2(i) / len;
    expect1     = expect1 + data1(i) / len;
    expect2     = expect2 + data2(i) / len;
end

covariance = expect_prod - expect1 * expect2;
