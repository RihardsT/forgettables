%% Comments
  % Comments
  %% Section separator

%% Operators:
%% Comparators:
%% print
%% Variables:
Struct{1} = something
Struct.something


%% if/else:

%% Loops:
for i = 1:10:100 % from:step:to
end
for i = [1,2,3, 5,7,9, 12,15,18] % Irregular step, can also use 1:2:3 3:3:9
  % < process using i >
end


%% Functions:


%% String interpolation
  for K=1:10
    filename = sprintf('out%d.doc', K);
    fid = fopen(filename,'w');
    %read the file here
    fclose(fid);
  end

  for i=1:10
    somevalue= <something>
    save(['GeneralPrefix' num2str(i) '.mat'],'somevalue')
  end


% Linear index
A = [ 1 2;
      3 4]
sub2ind(size(A),1,2) % Find the linear index. Line, col.
A(3) % == 2, same as A(1,2)
