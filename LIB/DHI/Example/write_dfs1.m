% Example of how to modify data in an existing dfs1 file.

NET.addAssembly('DHI.Generic.MikeZero.DFS');
NET.addAssembly('DHI.Generic.MikeZero.EUM');
import DHI.Generic.MikeZero.DFS.*;
import DHI.Generic.MikeZero.DFS.dfs123.*;
import DHI.Generic.MikeZero.*

% Modify and write changes to dfs1 file
filename = 'test_written.dfs1';

% Copy to a new file, keeping the original intact.
copyfile('data/data_moving_bump.dfs1', filename);

% Load existing dfs1 file for editing
dfs1 = DfsFileFactory.Dfs1FileOpenEdit(filename);

for i = 0:dfs1.FileInfo.TimeAxis.NumberOfTimeSteps-1

  % Read data for timestep
  itemData = dfs1.ReadItemTimeStep(1,i);
  data = double(itemData.Data);
  % modify data - add 1.5
  data = data + 1.5;
  % Write data back for timestep
  dfs1.WriteItemTimeStep(1, i, itemData.Time, NET.convertArray(single(data(:))));
  
end

dfs1.Close();

fprintf('\nFile created: ''%s''\n',filename);
