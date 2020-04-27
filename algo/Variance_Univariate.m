% data = rand(1,1000);
% 
% % method 1: standard calculaltion -----------------------
% average1 = 0;
% for i = 1 : length(data)
%     average1 = average1 + data(i) / length(data);
% end
% 
% variance1 = 0;
% for i = 1 : length(data)
%     variance1 = variance1 + (data(i) - average1)^2 / length(data);
% end
% variance1 
% 
% 
% % method 2 -----------------------
% variance2 = 0;
% for i = 1 : length(data)
%     for j = 1 : length(data)
%         variance2 = variance2 + (data(i) - data(j))^2/ length(data)^2 / 2;
%     end
% end
% variance2
% 
% % method 3 -----------------------
% average3 = 0;
% sum_square = 0;
% for i = 1 : length(data)
%     average3 = average3 + data(i) / length(data);
%     sum_square = sum_square +  data(i)^2 / length(data);
% end
% variance3 = sum_square - average3^2

% the method 3 for calculating the covariance for univariate random
% varaible
function variance = Variance_Univariate(data)

average = 0;
sum_square = 0;
for i = 1 : length(data)
    average = average + data(i) / length(data);
    sum_square = sum_square +  data(i)^2 / length(data);
end
variance = sum_square - average^2;
