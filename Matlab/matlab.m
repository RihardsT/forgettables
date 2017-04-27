%% Comments
  % Comments
  %% Section separator

%% Operators:
%% Comparators:
%% print
%% Variables:
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