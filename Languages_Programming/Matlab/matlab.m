%% Comments %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % Comments
  %% Section separator

%% Operators: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Comparators: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
< <= > >=
~ % ~ == NOT
%% print %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Use ; to not output the value to console
a = 'filename';
['folder/' a '.mat'] % String interpolation, one way
b = 12
['folder/' num2str(b) '.mat']

name = 'Alice'; age = 12;
X = sprintf('%s will be %d this year.',name,age); % String interpolation
disp(X)

%% Variables: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Struct{1} = something;
Struct{1}
Struct.something

labels(1:3,1) = {'Value in cell'}; % Add values to cell in a range

% Linear index
A = [ 1 2;
      3 4]
sub2ind(size(A),1,2) % Find the linear index. Line, col.
A(3) % == 2, same as A(1,2)

% Get range of values from matrix
A(A > 10 & A < 45)
% Every line that has first item in range, and every column of that line
A(A(:,1) > 10 & A(:,1) < 45, :)

%% if/else: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Loops: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 1:10:100 % from:step:to
end
for i = [1,2,3, 5,7,9, 12,15,18] % Irregular step, can also use 1:2:3 3:3:9
  % < process using i >
  pause(1) % sleep for 1 second
end


%% Functions: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% String interpolation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  for K=1:10
    filename = sprintf('out%d.doc', K);
    fid = fopen(filename,'w');
    %read the file here
    fclose(fid);
  end

%% Plot: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
axis([-2 2 -2 2]) % x x y y % Limit the plot range
scatter(x,y) % Scatter
plot(x,y,'b.') %plot, lines by default, but with 'b.' will be blue dots