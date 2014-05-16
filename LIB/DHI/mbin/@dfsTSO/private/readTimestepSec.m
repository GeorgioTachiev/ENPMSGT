function timestepsec = readTimestepSec(dm)
timestepsec  = ...
  dm.TSO.Time.TimeStep.ConvertStructToSecs(...
    dm.TSO.Time.TimeStep.Year,...
    dm.TSO.Time.TimeStep.Month,...
    dm.TSO.Time.TimeStep.Day,...
    dm.TSO.Time.TimeStep.Hour,...
    dm.TSO.Time.TimeStep.Minute,...
    dm.TSO.Time.TimeStep.Second,...
    dm.TSO.Time.TimeStep.Millisecond);
