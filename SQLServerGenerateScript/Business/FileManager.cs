using SQLServerGenerateScript.Enums;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace SQLServerGenerateScript.Business
{
    public class FileManager
    {
        private static string TablesFilePath;
        private static string StoredProceduresFilePath;
        private static string FunctionsFilePath;
        private static string TriggersFilePath;
        private static string ViewsFilePath;

        
        static string GetFileText(string FilePath)
        {
            return File.ReadAllText(FilePath);
        }


        public static string GetFileTextByType(ScriptTypeEnum scriptType)
        {
            switch (scriptType)
            {
                case ScriptTypeEnum.Table:
                    TablesFilePath = GetDirectory() + "\\ScripSourceFiles\\Tables.txt";
                    return GetFileText(TablesFilePath);
                case ScriptTypeEnum.StoredProcedure:
                    StoredProceduresFilePath = GetDirectory() + "\\ScripSourceFiles\\StoredProcedures.txt";
                    return GetFileText(StoredProceduresFilePath);
                case ScriptTypeEnum.UserDefinedFunction:
                    FunctionsFilePath = GetDirectory() + "\\ScripSourceFiles\\UserDefinedFunctions.txt";
                    return GetFileText(FunctionsFilePath);
                case ScriptTypeEnum.View:
                    ViewsFilePath = GetDirectory() + "\\ScripSourceFiles\\Views.txt";
                    return GetFileText(ViewsFilePath);
                case ScriptTypeEnum.Trigger:
                    TriggersFilePath = GetDirectory() + "\\ScripSourceFiles\\Triggers.txt";
                    return GetFileText(TriggersFilePath);
                default:
                    return "";

            }
        }

        static string GetDirectory()
        {
            return System.AppContext.BaseDirectory.Replace("\\bin\\Debug\\netcoreapp3.1\\", "");
        }

        public static string GetGeneratedScriptResultPath()
        {
            return GetDirectory() + "\\ScriptResult\\GeneratedScript.sql";
        }

        public static void SaveTextToFile(string path, string text)
        {
            File.WriteAllText(path, text);
        }
    }
}
