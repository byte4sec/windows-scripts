echo url = WScript.Arguments.Item(0) > wget.vbs
echo filename = WScript.Arguments.Item(1) >> wget.vbs
echo Set o = CreateObject("MSXML2.XMLHTTP") >> wget.vbs
echo Set fs = CreateObject("Scripting.FileSystemObject") >> wget.vbs
echo Set f = CreateObject("ADODB.Stream") >> wget.vbs
echo o.open "GET", url, False >> wget.vbs
echo o.send >> wget.vbs
echo currdir = fs.GetAbsolutePathName(".") >> wget.vbs
echo file = fs.BuildPath(currdir, filename) >> wget.vbs
echo f.Type = 1 >> wget.vbs
echo f.Open >> wget.vbs
echo f.Write o.ResponseBody >> wget.vbs
echo f.Position = 0 >> wget.vbs
echo f.SaveToFile file >> wget.vbs
echo f.Close >> wget.vbs
