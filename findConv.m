Input = [12 20 3 10 22 19 23 16 0 21 23 16 18]
Output = [75 52 33 97 251 211 63 65]

% size(Input)
% size(Output)
filterS = size(Input) - size(Output);
filterS = filterS + repmat(1, size(filterS))

A = zeros(filterS(2));

for i = 1:size(Input, 2) - filterS(2) + 1
	A(i, :) = Input(i:i+filterS(2)-1);
end

Filter = pinv(A) * (Output')
Filter = fliplr(Filter')

Result = conv(Input, Filter)
